# Workflow Activity ----
# Trying out {asar} and {stockplotr}

## Initialize ----
# Download or update the packages
# Alternative methods for download can be found at
# https://github.com/nmfs-ost/asar?tab=readme-ov-file#installation
# https://github.com/nmfs-ost/stockplotr?tab=readme-ov-file#installation
remotes::install_github("nmfs-ost/asar")
remotes::install_github("nmfs-ost/stockplotr")

# Install tinytex if needed
# install.packages("tinytex")
tinytex::install_tinytex(bundle = "TinyTeX")

## Automation ----
#1.Create report template
asar::create_template(
  type = "SAR",
  format = "pdf",
  office = "NWFSC",
  region = "U.S. West Coast", # important for title, but not neccessary
  species = "Yelloweye rockfish",
  spp_latin = "Sebastes ruberrimus",
  year = 2024,
  author = "John Snow" # Input your name as you would find it in an assessment
)

#2. Convert results file
output <- asar::convert_output(
  output_file = "Report.sso",
  outdir = getwd(),
  model = "SS3"
)

#3. Create tables and figures
stockplotr::exp_all_figs_tables(
  dat = output,
  ref_line = "target",
  ref_line_sb = "target",
  indices_unit_label = ""
)

#4. Update tables and figures docs
# tables
asar::create_tables_doc(
  subdir = file.path(getwd(), "report"),
  rda_dir = getwd()
)
# Figures
asar::create_figures_doc(
  subdir = file.path(getwd(), "report"),
  rda_dir = getwd()
)

#5. Add standard output to template
# Save output file
write.csv(
  output,
  file = file.path(getwd(), "report", "std_output.csv"),
  row.names = FALSE
)
# Add to template
# Choose "Y" when prompted to update the preamble
asar::create_template(
  rerender_skeleton = TRUE,
  file_dir = file.path(getwd(), "report"),
  model_results = "std_output.csv",
  resdir = file.path(getwd(), "report")
)

## Alterations ----
#1. Add author to outline
asar::create_template(
  rerender_skeleton = TRUE,
  file_dir = file.path(getwd(), "report"),
  author = "Patrick Star"
)

#2. Add new section
asar::create_template(
  rerender_skeleton = TRUE,
  file_dir = file.path(getwd(), "report"),
  custom = TRUE,
  new_section = c("Social Indicators", "Management"),
  section_location = c("in-data", "after-assessment")
)

#3. Add external plot/image
# the next few steps can be done manually, but are coded out to help show where
# components of an external image will go
# copy image to directory folder
file.copy(
  from = file.path(getwd(), "SPRratio.png"),
  to = file.path(getwd(), "report", "SPRratio.png"),
  overwrite = TRUE
)

image_line <- paste0(
  "![My caption](SPRratio.png){#fig-sprratio}"
)
# Add to figure.qmd
figs_qmd <- readLines(
  file.path(getwd(), "report", "09_figures.qmd"),
  warn = FALSE
)
new_lines <- append(
  figs_qmd,
  image_line
)
writeLines(
  new_lines,
  file.path(getwd(), "report", "09_figures.qmd")
)
# Add image bundle to captions.alt_text.csv
# This can be done manually if preferred
label <- "fig-sprratio"
alt_text <- "My alternative text."
cap <- ""
my_img <- data.frame("label" = label, "type" = "figure", "caption" = cap, "alt_text" = alt_text)
write.table(
  my_img,
  file = file.path(getwd(), "captions_alt_text.csv"),
  sep = ",",
  row.names = FALSE,
  col.names = FALSE,
  append = TRUE
)

## Final actions ----
#1. Remove watermark
asar::remove_draft(
  dir = file.path(getwd(), "report")
)

#2. Add accessibility to the document.
path <- getwd()
withr::with_dir(
  file.path(getwd(), "report"),
  asar::add_alttext(
    rda_dir = path,
    alttext_csv_dir = path,
    rename = "2025_yelloweye_SAR_501compliance"
  )
)
