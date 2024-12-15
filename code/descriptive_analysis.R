
# Load necessary libraries
library(dplyr)
library(gtsummary)
library(gt)


# Load the dataset
data <- read.csv("data/heart.csv")

# Create a descriptive statistics table
summary_table <- data %>%
  select(age, chol, cp, target) %>%
  tbl_summary(by = target) %>%
  modify_header(label ~ "Variable")

# Convert to gt table
gt_table <- as_gt(summary_table)

# Save the table as an image
gt::gtsave(gt_table, filename = "output/table1.png")

