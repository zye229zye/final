# Default target: Run the Docker container to generate the report
all: docker-run

# -----------------------------
# Docker-based rules
# -----------------------------
# Build Docker image locally
docker-build:
	docker buildx build --platform linux/amd64 -t heart-analysis:latest .


# Push Docker image to Docker Hub
docker-push:
	docker push yezifan/heart-analysis:latest

# Run the Docker container using Docker Hub image
docker-run:
	docker run --rm -v $(PWD)/output:/project/output yezifan/heart-analysis:latest

# -----------------------------
# Native R-based rules (for local execution)
# -----------------------------
# Default target for local execution
local: output/heart_analysis.html

# Generate the final report locally
output/heart_analysis.html: heart_analysis.Rmd .all_outputs
	Rscript -e "rmarkdown::render('heart_analysis.Rmd', output_file = 'output/heart_analysis.html')"

# Ensure all intermediate outputs exist
.all_outputs: output/table1.png output/scatter_plot.png output/primary_model.png output/secondary_model.png
	touch .all_outputs

# Generate Table 1 locally
output/table1.png: code/descriptive_analysis.R data/heart.csv
	Rscript code/descriptive_analysis.R && touch output/table1.png

# Generate scatter plot locally
output/scatter_plot.png: code/graphical_analysis.R data/heart.csv
	Rscript code/graphical_analysis.R && touch output/scatter_plot.png

# Generate primary regression model summary locally
output/primary_model.png: code/regression_analysis.R data/heart.csv
	Rscript code/regression_analysis.R && touch output/primary_model.png

# Generate secondary regression model summary locally
output/secondary_model.png: code/regression_analysis.R data/heart.csv
	Rscript code/regression_analysis.R && touch output/secondary_model.png

# Install R dependencies locally
install:
	Rscript -e 'if (!requireNamespace("renv", quietly = TRUE)) install.packages("renv"); renv::restore()'

# Clean up generated files
.PHONY: clean
clean:
	rm -rf output/*.png output/*.html .all_outputs
