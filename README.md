#Heart Disease Data Analysis

This project analyzes a heart disease dataset, focusing on key risk factors such as age, cholesterol levels, and chest pain type. The results are summarized in a final report, which includes descriptive statistics, scatter plots, and regression analyses.

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

#Generate Final Report

To generate the final report, run:

make

Clean Up

#To remove all generated files:

make clean

#Individual Code Descriptions

Descriptive Statistics Table

Output: output/table1.pngCode: code/descriptive_analysis.RCommand:

make output/table1.png

Scatter Plot

Output: output/scatter_plot.pngCode: code/graphical_analysis.RCommand:

make output/scatter_plot.png

Primary Regression Results

Output: output/primary_model.pngCode: code/regression_analysis.RCommand:

make output/primary_model.png

Secondary Regression Results

Output: output/secondary_model.pngCode: code/regression_analysis.RCommand:

make output/secondary_model.png

#Using Docker

Build Docker Image

To build the Docker image, run:

make docker-build

Run the Docker Container

To run the container and generate the report:

make docker-run

Alternatively, you can directly run:

docker run --rm -v $(pwd)/output:/project/output zifanye218/heart-analysis

#Outputs

The final report (output/heart_analysis.html) includes:

Data Overview: Preview of the dataset.

Descriptive Statistics: Summary table of key variables.

Scatter Plot: Visualization of relationships between variables.

Regression Analysis: Summaries of primary and secondary models.