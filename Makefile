# Build the Docker image
docker-build:
	docker build -t zifanye218/heart-analysis .

# Run the Docker container to generate the report
docker-run: docker-build
	docker run --rm -v $$(pwd)/report:/code/output zifanye218/heart-analysis

# Initialize renv and create renv.lock
renv.lock:
	Rscript -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv'); renv::init(bare = TRUE); renv::snapshot()"

# Restore dependencies using renv
restore:
	Rscript -e "renv::restore()"

# Build the final report
output/heart_analysis.html: heart_analysis.Rmd .all_outputs
	Rscript -e "rmarkdown::render('heart_analysis.Rmd', output_file = 'output/heart_analysis.html')"

# Create all intermediate outputs
.all_outputs: output/table1.png output/scatter_plot.png output/primary_model.png output/secondary_model.png
	$(MAKE) output/table1.png
	$(MAKE) output/scatter_plot.png
	$(MAKE) output/primary_model.png
	$(MAKE) output/secondary_model.png
	touch .all_outputs

# Generate the descriptive statistics table
output/table1.png: code/descriptive_analysis.R data/heart.csv
	Rscript code/descriptive_analysis.R && touch output/table1.png

# Generate the scatter plot
output/scatter_plot.png: code/graphical_analysis.R data/heart.csv
	Rscript code/graphical_analysis.R && touch output/scatter_plot.png

# Generate the primary regression model
output/primary_model.png: code/regression_analysis.R data/heart.csv
	Rscript code/regression_analysis.R && touch output/primary_model.png

# Generate the secondary regression model
output/secondary_model.png: code/regression_analysis.R data/heart.csv
	Rscript code/regression_analysis.R && touch output/secondary_model.png

# Clean up all generated files
clean:
	rm -f output/*.png output/*.html .all_outputs
	# Remove renv only if explicitly needed
	rm -rf report/


# Remove Docker image
clean-docker:
	docker rmi -f zifanye218/heart-analysis || true

.PHONY: all docker-build docker-run clean restore clean-docker

