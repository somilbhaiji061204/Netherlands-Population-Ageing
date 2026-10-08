# Netherlands Population Ageing
# Data Cleaning
# Source: Statistics Netherlands (CBS)

# ---------------------------------------------------------
# 1. Load packages
# ---------------------------------------------------------

library(tidyverse)


# ---------------------------------------------------------
# 2. Import raw data
# ---------------------------------------------------------

data <- read_csv("data/raw/table__85524ENG.csv")


# ---------------------------------------------------------
# 3. Inspect the dataset
# ---------------------------------------------------------

head(data)
names(data)
dim(data)
data <- read_csv("raw/table__85524ENG.csv")
# ---------------------------------------------------------
# 3. Inspect the raw dataset
# ---------------------------------------------------------

head(data)
names(data)
dim(data)
# ---------------------------------------------------------
# 4. Select variables required for the analysis
# ---------------------------------------------------------

ageing_data <- data %>%
  select(
    Year = Periods,
    Total_Population = contains("Total population"),
    Age_65_79 = contains("65 to 79 years"),
    Age_80_Plus = contains("80 years or older")
  )

# View the cleaned dataset
ageing_data
# ---------------------------------------------------------
# 5. Check for missing values
# ---------------------------------------------------------

colSums(is.na(ageing_data))
# ---------------------------------------------------------
# 6. Calculate population shares of older age groups
# ---------------------------------------------------------

ageing_data <- ageing_data %>%
  mutate(
    Percent_65_79 = (Age_65_79 / Total_Population) * 100,
    Percent_80_Plus = (Age_80_Plus / Total_Population) * 100
  )

# View the updated dataset
ageing_data
ageing_data %>%
  select(Year, Percent_65_79, Percent_80_Plus)
# ---------------------------------------------------------
# 7. Round percentage variables
# ---------------------------------------------------------

ageing_data <- ageing_data %>%
  mutate(
    Percent_65_79 = round(Percent_65_79, 2),
    Percent_80_Plus = round(Percent_80_Plus, 2)
  )

# Final check of the cleaned dataset
ageing_data