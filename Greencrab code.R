rm(list = ls())
library(readr)
install.packages("janitor")
library(janitor)
greencrab <-  read_csv("Data/Green Crab Ganzekraal.csv")|>clean_names()


# Convert empty strings to NA
greencrab$sex[greencrab$sex == ""] <- NA

# Recreate SexStatus
greencrab$sexstatus <- ifelse(greencrab$sex == "F" & greencrab$berried == "Y",
                              "berried female",
                              greencrab$sex)

# Remove NA rows
greencrab_clean <- subset(greencrab, !is.na(sexstatus))

# Make table
sex_counts <- as.data.frame(table(greencrab_clean$sexstatus))
names(sex_counts) <- c("sexstatus", "freq")

# Add percent
sex_counts$percent <- round(100 * sex_counts$freq / sum(sex_counts$freq), 1)

sex_counts
#########test
library(ggplot2)

# Make sure 'sex_counts' has the right column names
# It should look like: Var1 (the category), Freq (the counts)
# You can rename for clarity:
names(sex_counts) <- c("sexstatus", "freq")

# Add percentage column
sex_counts$percent <- round(100 * sex_counts$freq / sum(sex_counts$freq), 1)

#  plot pie chhart
ggplot(sex_counts, aes(x = "", y = freq, fill = sexstatus)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  theme_void() +
  geom_text(aes(label = paste0(percent, "%")), 
            position = position_stack(vjust = 0.5)) +
  scale_fill_manual(
    values = c("lightblue", "lightgreen", "red"),
    name = "Sex",
    labels = c("♀ Berried Female", "♀ Female", "♂ Male")
  ) +
  ggtitle("Sex Composition of Green Crabs at Ganzekraal")







library(ggplot2)
## regression
ggplot(greencrab, aes(x = width_carapace, y = weight, color = sex)) +
  geom_point(size = 3, alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Relationship between Carapace Width and Weight of Green Crabs",
    x = "Carapace Width (mm)",
    y = "Weight (g)",
    color = "Sex"
  ) +
  scale_color_manual(values = c("Blue", "Green")) +
  theme_minimal()





# 2nd regression
ggplot(greencrab, aes(x = width_carapace, y = weight, color = sexstatus)) +
  geom_point(size = 3, alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Carapace Width vs. Weight of Green Crabs by Sex Category",
    x = "Carapace Width (mm)",
    y = "Weight (g)",
    color = "Sex Category"
  ) +
  scale_color_manual(values = c(
    "M" = "blue",
    "F" = "green",
    "Berried female" = "darkgreen"
  )) +
  theme_minimal()


unique(greencrab$SexStatus)



ggplot(greencrab, aes(x = width_carapace, fill = sex)) +
  geom_histogram(binwidth = 2, alpha = 0.7, position = "dodge") +
  theme_minimal() +
  ggtitle("Size-Frequency Distribution of Green Crabs")
