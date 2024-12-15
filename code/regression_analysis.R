
# Load necessary libraries
library(readr)
library(gtsummary)
library(gt)


# Load the dataset
data <- read_csv("data/heart.csv")

# Primary Regression Model
primary_mod <- glm(
  target ~ age + chol + cp,
  data = data,
  family = gaussian()
)

# Save primary model summary as an image
gtsave(as_gt(tbl_regression(primary_mod) |> add_global_p()), "output/primary_model.png")

# Secondary Regression Model
binary_mod <- glm(
  I(target == 1) ~ age + chol + cp,
  data = data,
  family = binomial()
)

# Save secondary model summary as an image
gtsave(as_gt(tbl_regression(binary_mod, exponentiate = TRUE) |> add_global_p()), "output/secondary_model.png")

