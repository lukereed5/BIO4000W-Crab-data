rm(list = ls())
library(readr)

greencrab <- read.csv("Green Crab Ganzekraal.csv")


# Convert empty strings to NA
greencrab$Sex[greencrab$Sex == ""] <- NA

# Recreate SexStatus
greencrab$SexStatus <- ifelse(greencrab$Sex == "F" & greencrab$Berried == "Y",
                              "Berried female",
                              greencrab$Sex)

# Remove NA rows
greencrab_clean <- subset(greencrab, !is.na(SexStatus))

# Make table
sex_counts <- as.data.frame(table(greencrab_clean$SexStatus))
names(sex_counts) <- c("SexStatus", "Freq")

# Add percent
sex_counts$percent <- round(100 * sex_counts$Freq / sum(sex_counts$Freq), 1)

sex_counts
#########test
library(ggplot2)

# Make sure 'sex_counts' has the right column names
# It should look like: Var1 (the category), Freq (the counts)
# You can rename for clarity:
names(sex_counts) <- c("SexStatus", "Freq")

# Add percentage column
sex_counts$percent <- round(100 * sex_counts$Freq / sum(sex_counts$Freq), 1)

#  plot pie chhart
ggplot(sex_counts, aes(x = "", y = Freq, fill = SexStatus)) +
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
ggplot(greencrab, aes(x = Width.Carapace, y = Weight, color = Sex)) +
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
ggplot(greencrab, aes(x = Width.Carapace, y = Weight, color = SexStatus)) +
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



ggplot(greencrab, aes(x = Width.Carapace, fill = Sex)) +
  geom_histogram(binwidth = 2, alpha = 0.7, position = "dodge") +
  theme_minimal() +
  ggtitle("Size-Frequency Distribution of Green Crabs")