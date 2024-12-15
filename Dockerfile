# Base image: Rocker with Tidyverse and R Markdown support
FROM --platform=linux/amd64 rocker/verse:4.4.0

# Set environment variables
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Install required system libraries
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libpng-dev \
    zlib1g-dev \
    pandoc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install renv
RUN Rscript -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv')"

# Copy renv.lock file and restore dependencies
COPY renv.lock /renv.lock
WORKDIR /
RUN Rscript -e "renv::restore()"

# Copy project files
COPY . /code
WORKDIR /code

# Command to render the report
CMD ["Rscript", "-e", "rmarkdown::render('heart_analysis.Rmd', output_file = 'output/heart_analysis.html')"]
