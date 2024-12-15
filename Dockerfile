# Base image: Rocker with Tidyverse and R Markdown support
FROM rocker/verse:4.4.0

# Set the working directory inside the container
WORKDIR /project

# Copy the project files into the container
COPY . /project

# Install renv and restore the environment if renv.lock exists
RUN Rscript -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv')"
RUN Rscript -e "renv::restore()"


# Default command to render the R Markdown report
CMD ["Rscript", "-e", "rmarkdown::render('heart_analysis.Rmd', output_file = 'output/heart_analysis.html')"]
