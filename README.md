Heart Disease Data Analysis

This project analyzes a heart disease dataset, focusing on key risk factors like age, cholesterol levels, and chest pain type. The results are summarized in a final report.


#Project Structure
project/
├── data/                   
│   └── heart.csv
├── code/                   
│   ├── descriptive_analysis.R
│   ├── graphical_analysis.R
│   ├── regression_analysis.R
├── output/                 
├── heart_analysis.Rmd     
├── renv/                   
├── renv.lock               
├── Dockerfile              
├── .gitignore            
└── Makefile             

#Workflow

*Generate Final Report*
Run the following command to generate the report：make

*Clean Up*
Remove all generated files:clean up

##individual code

Descriptive Statistics Table (output/table1.png):
Code: code/descriptive_analysis.R

make output/table1.png
Code: code/descriptive_analysis.R
Scatter Plot (output/scatter_plot.png):

make output/scatter_plot.png
Code: code/graphical_analysis.R
Primary Regression Results (output/primary_model.png):

make output/primary_model.png
Code: code/regression_analysis.R
Secondary Regression Results (output/secondary_model.png):

make output/secondary_model.png
Code: code/regression_analysis.R

Build Docker Image
make docker-build

Run the Docker Container
docker run --rm -v $(pwd)/output:/project/output yezifan/heart-disease-analysis

#Outputs
*The final report (output/heart_analysis.html) includes:*
Data Overview: Preview of the dataset.
Descriptive Statistics: Summary table.
Scatter Plot: Visualization of key variables.
Regression Analysis: Summaries of primary and secondary models.