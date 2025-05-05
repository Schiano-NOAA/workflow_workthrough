# A Sample Stock Assessment Workflow
A template repository for users to write a stock assessment report using {asar}
and {stockplotr} packages

## Directions

Use the "Use this template" button in the top right corner of the repository. 
This will create a clone of this repo into your account so you can follow the 
activity found below or in the [Workflow Document](https://github.com/nmfs-ost/workflow_workthrough/blob/main/check/Testing%20%7Basar%7D%20and%20%7Bstockplotr%7D%20-%20key.pdf).

During this activity you will create a report template for a stock as well as associated tables and figures found in [stockplot](https://github.com/nmfs-ost/stockplotr).
By the end of this activity, your repository should consist of the following files:

- report/
- rda_files/
- captions_alt_text.csv
- std_output.csv (**do not recommend pushing to remote**)


# Workthrough

The following are the same directions found in the [worksheet](https://github.com/nmfs-ost/workflow_workthrough/blob/main/check/Testing%20%7Basar%7D%20and%20%7Bstockplotr%7D%20-%20key.pdf)

## Testing {asar} and {stockplotr}

### Directions: 

We have prepared a workflow for writing a stock assessment report using the asar and stockplotr R packages. Run code step-by-step, in the activity section. Open a new script when indicated. A stock synthesis output file is provided in the repository for use during this workflow. The example provided is for the 2024 yelloweye rockfish (Sebastes rubberimus) update on the U.S. West Coast. All materials to complete this activity can be found in the Workflows Workthrough repo.

Please consider the following questions as you work through the exercise. We welcome your answers at the next steering committee meeting.
How would this template work based on your current guidelines?
How easy was the template to make?
How similar was this to your current workflow?
Did you encounter any issues or errors?
Could you see the future of its use into your workflow?
What improvements would you make to the process as a whole or individual parts of the workflow?

### Activity:

#### Initialize your workflow

1. Create a repository from the template repo in GitHub.
2. Identify where you want the folder containing your report files as well as the figures and tables files to be placed*.
We recommend putting it in a folder containing the rest of your materials 
for a particular assessment species and year.

*{asar} defaults to your working directory; however, you are able to tell it where to place the files through the file_dir argument.

3. Open a new script that will be the basis for creating the reproducible 
workflow.

4. Install the most recent version of {asar} and {stockplotr}

```
remotes::install_github("nmfs-ost/asar")
remotes::install_github("nmfs-ost/stockplotr")
```

5. If you haven’t already, install tinytex expanded version:

```
install.packages(“tinytex”)
tinytex::install.tinytex(bundle = “TinyTeX-1”)
```

If you want to go above and beyond, download the TinyTeX bundle 2 instead of
the above option which might be necessary for later process 
(WARNING: this will take upwards of ~30-45 minutes).

```
tinytex::install.tinytex(bundle = “TinyTeX-2”)
```

#### Automation

1. Create a blank report template using the following arguments (or a 
region/species of your choice):

- region = “U.S. West Coast”
- species = “Yelloweye rockfish”
- spp_latin = “Sebastes rubberimus”
- year = 2024
- Author (use your name)
- Office (use your office) 



*Render the skeleton file and see what it looks like blank!*


2. Convert the report.sso file in the repo to a standard dataframe. Load it
into your environment.

**Note: An example Report.sso file has been provided for you. If you work with BAM or SS3, feel free to use your own model output for this exercise.**

3. Create all of the tables and figures from `stockplotr`

    *Hint: you might need to add specific arguments to render some tables and figures (ref_line, ref_line_sb, and indices_unit_label)*

4. Add the tables and figures into your outline.

5. Update your preamble so it includes the converted output file. 


*Re-render your quarto file to check on your progress!* 🙂



#### Alterations to the template

1. Woops! You forgot to add an author to the outline. Please add 
“Patrick Star” as an additional author into your report.

2. Of course…The SSC requested a new section be added to the report for this 
species. Please add the section “Ecosystem Indicators” to your outline in 
the data section then add another section, “Management”, to your outline 
after the assessment sections.

3. You need to generate a plot that is not currently in stockplotr. Add the 
provided image (SPRratio.png) from the repo into the figures doc.

	*Hint: make sure to incorporate a caption and alternative text in their proper location.*
	*Hint #2: Check out the Custom Figures & Tables vignette for more help.*

4. Check the captions and alternative text for your other figures and tables. 
Find the line associated with the biomass figure and remove the sentence in 
the caption about the limit reference point, since it doesn’t appear in the 
figure.

*Hint: Check out the Accessibility vignette for more help.*

#### Final Actions

1. Remove draft watermark.

2. Add alternative text and PDF tagging.

### Reflection

Congratulations, you’ve learned most of the workflow needed to render a stock
assessment report with asar! If you have 5 more minutes, we’d greatly 
appreciate hearing your answers to these questions so that we can improve 
`asar` for everyone. (Feel free to leave you comments on their respective 
[discussion pages](https://github.com/nmfs-ost/workflow_workthrough/discussions))

1. [How would this template work based on your current guidelines?](https://github.com/nmfs-ost/workflow_workthrough/discussions/1)
2. [How easy was the template to make?](https://github.com/nmfs-ost/workflow_workthrough/discussions/2)
3. [How similar was this to your current workflow?](https://github.com/nmfs-ost/workflow_workthrough/discussions/3)
4. [Did you encounter any issues or errors?](https://github.com/nmfs-ost/workflow_workthrough/discussions/4)
5. [Could you see the future of its use into your workflow?](https://github.com/nmfs-ost/workflow_workthrough/discussions/5)
6. [What improvements would you make to the process as a whole or individual parts of the workflow?](https://github.com/nmfs-ost/workflow_workthrough/discussions/6)
