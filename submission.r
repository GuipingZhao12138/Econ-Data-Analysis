library(tidyverse)
suicide_rates_data_allsex <- read.csv("Crude suicide rates.csv")
head(suicide_rates_data_allsex)
suicide_rates_data <- suicide_rates_data_allsex %>%
  filter(Sex == " Both sexes")
mental_hosipital_data <- read.csv("Facilities.csv")
merged_data_1 <- merge(suicide_rates_data, mental_hosipital_data, by = "Country")
human_resource_data <- read.csv("Human Resources.csv")
merged_data <- merge(human_resource_data, merged_data_1, by = "Country")
selected_data <- merged_data[,c("Country","Psychiatrists","Nurses","X20to29","Mental._hospitals","Psychologists","health_units")]
head(selected_data)
show(selected_data)
selected_data <- na.omit(selected_data)
selected_data <- subset(selected_data, Mental._hospitals <= 1)
show(selected_data)
library(ggplot2)

##plot1
plot1 <- ggplot(data = selected_data, aes(x = health_units, y = X20to29)) +
  geom_point() +
  labs(title = "Scatter Plot of suicide amount and health units",
       x = "health units",
       y = "suicide number among 20-29 years old")

png("results/plot1.png", width = 800, height = 600, units = "px", pointsize = 12)
print(plot1)
dev.off()


model0 <- lm(selected_data$X20to29 ~ selected_data$health_units, data = selected_data)
summary(model0)
summary_model0 <- summary(model0)
p_value_slope_health_units <- summary_model0$coefficients["selected_data$health_units", "Pr(>|t|)"]
p_value_slope_health_units

##plot2
plot2 <- ggplot(data = selected_data, aes(x = Mental._hospitals, y = X20to29)) +
  geom_point() +
  labs(title = "Scatter Plot of suicide amount and mental hospital rate",
       x = "Mental hospital rate",
       y = "suicide number among 20-29 years old")
png("results/plot2.png", width = 800, height = 600, units = "px", pointsize = 12)
print(plot2)
dev.off()
model <- lm(selected_data$X20to29 ~ selected_data$Mental._hospitals, data = selected_data)
summary(model)
summary_model <- summary(model)
p_value_mental_hospitals <- summary_model$coefficients["selected_data$Mental._hospitals", "Pr(>|t|)"]
p_value_mental_hospitals

##plot3
plot3 <- ggplot(data = selected_data, aes(x = Psychologists, y = X20to29)) +
  geom_point() +
  labs(title = "Scatter Plot of suicide amount and Psychologists ",
       x = "Psychologists",
       y = "suicide number among 20-29 years old") +
  facet_wrap(~1)
png("results/plot3.png", width = 800, height = 600, units = "px", pointsize = 12)
print(plot3)
dev.off()

model1 <- lm(selected_data$X20to29 ~ selected_data$Psychologists, data = selected_data)
summary(model1)
summary_model1 <- summary(model1)
p_value_psychologists <- summary_model1$coefficients["selected_data$Psychologists", "Pr(>|t|)"]
p_value_psychologists

##plot4
plot4 <- ggplot(data = selected_data, aes(x = Psychiatrists, y = X20to29)) +
  geom_point() +
  labs(title = "Scatter Plot of suicide amount and Psychiatrists",
       x = "Psychiatrists",
       y = "suicide number among 20-29 years old") +
  facet_wrap(~1)
png("results/plot4.png", width = 800, height = 600, units = "px", pointsize = 12)
print(plot4)
dev.off()
model2 <- lm(selected_data$X20to29 ~ selected_data$Psychiatrists, data = selected_data)
summary(model2)
summary_model2 <- summary(model2)
p_value_psychiatrists <- summary_model2$coefficients["selected_data$Psychiatrists", "Pr(>|t|)"]
p_value_psychiatrists
multiple_r_squared1 <- summary_model2$r.squared
multiple_r_squared1
par(mfrow = c(1, 5))


##plot5-9
plot5 <- boxplot(selected_data$X20to29, 
        main = "suicide_rate_20_to_29",
        ylab = "X20to29")
dev.copy(png, "results/boxplot_X20to29.png")
print(plot5)
dev.off()

plot6 <- boxplot(selected_data$Psychiatrists, 
        main = "Psychiatrists rate",
        ylab = "Psychiatrists")
dev.copy(png, "results/boxplot_Psychiatrists.png")
print(plot6)
dev.off()

plot7 <- boxplot(selected_data$Psychologists, 
        main = "Psychologists rate",
        ylab = "Psychologists")
dev.copy(png, "results/boxplot_Psychologists.png")
print(plot7)
dev.off()

plot8 <- boxplot(selected_data$Mental._hospitals, 
        main = "Mental._hospitals rate",
        ylab = "Mental._hospitals")
dev.copy(png, "results/boxplot_Mental_hospitals.png")
print(plot8)
dev.off()

plot9 <- boxplot(selected_data$health_units, 
        main = "health_units rate",
        ylab = "health_units")
dev.copy(png, "results/boxplot_health_units.png")
print(plot9)
dev.off()
model3 <- lm(selected_data$X20to29 ~ selected_data$Psychiatrists +selected_data$Psychologists + selected_data$Mental._hospitals + selected_data$health_units , data = selected_data)


summary(model3)
summary_model3 <- summary(model3)
#we can get p-value and R square from the summary information
p_value_psychiatrists1 <- 0.0599
p_value_Psychologists1 <- 0.8750
p_value_Mental_hospitals1 <- 0.5067
p_value_health_units1 <- 0.9002
combined_R_square <- 0.09952
result_list <- list(p_value_slope_health_units = p_value_slope_health_units,
p_value_mental_hospitals = p_value_mental_hospitals,
p_value_psychologists = p_value_psychologists,
p_value_psychiatrists = p_value_psychiatrists,
multiple_r_squared1 = multiple_r_squared1,
p_value_psychiatrists1 = p_value_psychiatrists1,
p_value_Psychologists1 = p_value_Psychologists1,
p_value_Mental_hospitals1 = p_value_Mental_hospitals1,
p_value_health_units1 = p_value_health_units1,
combined_R_square = combined_R_square)


# Ensure the "results" directory exists or create it
if (!dir.exists("results")) {
  dir.create("results")
}

# Write to results/example.yaml
library(yaml)
write_yaml(result_list, "results/submission.yaml")