# Load necessary libraries
library(ggplot2)

# Load data
data <- read.csv("data/heart.csv")

# Create scatter plot
scatter_plot <- ggplot(data, aes(x = age, y = chol, color = as.factor(target))) +
  geom_point(alpha = 0.7) +
  labs(
    title = "Scatter Plot of Age vs Cholesterol Level",
    x = "Age",
    y = "Cholesterol Level (mg/dl)",
    color = "Heart Disease Presence"
  ) +
  theme_bw()

# Save plot
ggsave("output/scatter_plot.png", scatter_plot)
