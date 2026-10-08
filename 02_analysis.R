# Netherlands Population Ageing
# Data Analysis
# Source: Statistics Netherlands (CBS)

# ---------------------------------------------------------
# 1. Load packages
# ---------------------------------------------------------

library(tidyverse)

# ---------------------------------------------------------
# 2. Import cleaned data
# ---------------------------------------------------------

data <- read_csv("raw/table__85524ENG.csv")

# ---------------------------------------------------------
# 3. Prepare variables for analysis
# ---------------------------------------------------------

ageing_data <- data %>%
  select(
    Year = Periods,
    Total_Population = contains("Total population"),
    Age_65_79 = contains("65 to 79 years"),
    Age_80_Plus = contains("80 years or older")
  ) %>%
  mutate(
    Percent_65_79 = round((Age_65_79 / Total_Population) * 100, 2),
    Percent_80_Plus = round((Age_80_Plus / Total_Population) * 100, 2)
  )
# ---------------------------------------------------------
# 4. Examine population ageing over time
# ---------------------------------------------------------

ageing_data %>%
  select(Year, Age_65_79, Age_80_Plus)
# ---------------------------------------------------------
# 5. Calculate percentage growth in older age groups
# ---------------------------------------------------------

growth <- ageing_data %>%
  summarise(
    Growth_65_79 = ((last(Age_65_79) - first(Age_65_79)) /
                      first(Age_65_79)) * 100,
    
    Growth_80_Plus = ((last(Age_80_Plus) - first(Age_80_Plus)) /
                        first(Age_80_Plus)) * 100
  )

growth
# ---------------------------------------------------------
# 6. Examine the changing share of older age groups
# ---------------------------------------------------------

ageing_data %>%
  select(
    Year,
    Percent_65_79,
    Percent_80_Plus
  )
# ---------------------------------------------------------
# 7. Calculate change in population share
# ---------------------------------------------------------

share_change <- ageing_data %>%
  summarise(
    Change_65_79 = last(Percent_65_79) - first(Percent_65_79),
    Change_80_Plus = last(Percent_80_Plus) - first(Percent_80_Plus)
  )

share_change
# ---------------------------------------------------------
# 8. Visualise the changing share of older age groups
# ---------------------------------------------------------

ageing_data %>%
  ggplot(aes(x = Year)) +
  geom_line(aes(y = Percent_65_79, linetype = "Age 65–79"), linewidth = 1) +
  geom_line(aes(y = Percent_80_Plus, linetype = "Age 80+"), linewidth = 1) +
  labs(
    title = "Changing Share of Older Population in the Netherlands",
    x = "Year",
    y = "Population share (%)",
    linetype = "Age group"
  ) +
  theme_minimal()
# ---------------------------------------------------------
# 8. Visualise the changing share of older age groups
# ---------------------------------------------------------

ageing_data %>%
  ggplot(aes(x = Year)) +
  
  geom_line(
    aes(y = Percent_65_79, linetype = "Age 65–79"),
    linewidth = 1
  ) +
  
  geom_point(
    aes(y = Percent_65_79),
    size = 2
  ) +
  
  geom_line(
    aes(y = Percent_80_Plus, linetype = "Age 80+"),
    linewidth = 1
  ) +
  
  geom_point(
    aes(y = Percent_80_Plus),
    size = 2
  ) +
  
  scale_x_continuous(
    breaks = ageing_data$Year
  ) +
  
  labs(
    title = "Changing Share of Older Population in the Netherlands",
    x = "Year",
    y = "Population share (%)",
    linetype = "Age group"
  ) +
  
  theme_minimal() +
  
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(face = "bold")
  )
scale_x_continuous(
  breaks = c(1900, 1950, 1970, 1990, 2000, 2010, 2025, 2026)
)
# ---------------------------------------------------------
# 8. Visualise the changing share of older age groups
# ---------------------------------------------------------

ageing_data %>%
  ggplot(aes(x = Year)) +
  
  geom_line(
    aes(y = Percent_65_79, linetype = "Age 65–79"),
    linewidth = 1
  ) +
  
  geom_point(
    aes(y = Percent_65_79),
    size = 2
  ) +
  
  geom_line(
    aes(y = Percent_80_Plus, linetype = "Age 80+"),
    linewidth = 1
  ) +
  
  geom_point(
    aes(y = Percent_80_Plus),
    size = 2
  ) +
  
  scale_x_continuous(
    breaks = c(1900, 1950, 1970, 1990, 2000, 2010, 2026)
  ) +
  
  labs(
    title = "Changing Share of Older Population in the Netherlands",
    x = "Year",
    y = "Population share (%)",
    linetype = "Age group"
  ) +
  
  theme_minimal() +
  
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(face = "bold")
  )
scale_x_continuous(
  breaks = ageing_data$Year
)
scale_x_continuous(
  breaks = ageing_data$Year
)
# ---------------------------------------------------------
# 8. Visualise the changing share of older age groups
# ---------------------------------------------------------

ageing_data %>%
  ggplot(aes(x = Year)) +
  
  geom_line(
    aes(y = Percent_65_79, linetype = "Age 65–79"),
    linewidth = 1
  ) +
  
  geom_point(
    aes(y = Percent_65_79),
    size = 2
  ) +
  
  geom_line(
    aes(y = Percent_80_Plus, linetype = "Age 80+"),
    linewidth = 1
  ) +
  
  geom_point(
    aes(y = Percent_80_Plus),
    size = 2
  ) +
  
  scale_x_continuous(
    breaks = ageing_data$Year,
    guide = guide_axis(n.dodge = 2)
  ) +
  
  labs(
    title = "Changing Share of Older Population in the Netherlands",
    x = "Year",
    y = "Population share (%)",
    linetype = "Age group"
  ) +
  
  theme_minimal() +
  
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(face = "bold")
  )
# ---------------------------------------------------------
# 9. Visualise the population size of older age groups
# ---------------------------------------------------------

ageing_data %>%
  ggplot(aes(x = Year)) +
  
  geom_line(
    aes(y = Age_65_79, linetype = "Age 65–79"),
    linewidth = 1
  ) +
  
  geom_point(
    aes(y = Age_65_79),
    size = 2
  ) +
  
  geom_line(
    aes(y = Age_80_Plus, linetype = "Age 80+"),
    linewidth = 1
  ) +
  
  geom_point(
    aes(y = Age_80_Plus),
    size = 2
  ) +
  
  scale_x_continuous(
    breaks = ageing_data$Year,
    guide = guide_axis(n.dodge = 2)
  ) +
  
  labs(
    title = "Growth of Older Age Groups in the Netherlands",
    x = "Year",
    y = "Population (×1,000)",
    linetype = "Age group"
  ) +
  
  theme_minimal() +
  
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(face = "bold")
  )
# ---------------------------------------------------------
# 9. Visualise the population size of older age groups
# ---------------------------------------------------------

ageing_data %>%
  ggplot(aes(x = Year)) +
  
  geom_line(
    aes(y = Age_65_79, linetype = "Age 65–79"),
    linewidth = 1
  ) +
  
  geom_point(
    aes(y = Age_65_79),
    size = 2
  ) +
  
  geom_line(
    aes(y = Age_80_Plus, linetype = "Age 80+"),
    linewidth = 1
  ) +
  
  geom_point(
    aes(y = Age_80_Plus),
    size = 2
  ) +
  
  scale_x_continuous(
    breaks = ageing_data$Year,
    guide = guide_axis(n.dodge = 2)
  ) +
  
  labs(
    title = "Growth of Older Age Groups in the Netherlands",
    x = "Year",
    y = "Population (×1,000)",
    linetype = "Age group"
  ) +
  
  theme_minimal() +
  
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(face = "bold")
  )
# ---------------------------------------------------------
# 10. Compare population growth of older age groups
# ---------------------------------------------------------

growth_comparison <- ageing_data %>%
  summarise(
    Growth_65_79 = ((last(Age_65_79) - first(Age_65_79)) /
                      first(Age_65_79)) * 100,
    
    Growth_80_Plus = ((last(Age_80_Plus) - first(Age_80_Plus)) /
                        first(Age_80_Plus)) * 100
  )

growth_comparison
# ---------------------------------------------------------
# 11. Compare change in population share
# ---------------------------------------------------------

share_change <- ageing_data %>%
  summarise(
    Change_65_79 = last(Percent_65_79) - first(Percent_65_79),
    Change_80_Plus = last(Percent_80_Plus) - first(Percent_80_Plus)
  )

share_change
dir.create("figures", showWarnings = FALSE)
# ---------------------------------------------------------
# 12. Save Figure 1
# ---------------------------------------------------------

figure1 <- ageing_data %>%
  ggplot(aes(x = Year)) +
  
  geom_line(
    aes(y = Percent_65_79, linetype = "Age 65–79"),
    linewidth = 1
  ) +
  
  geom_point(
    aes(y = Percent_65_79),
    size = 2
  ) +
  
  geom_line(
    aes(y = Percent_80_Plus, linetype = "Age 80+"),
    linewidth = 1
  ) +
  
  geom_point(
    aes(y = Percent_80_Plus),
    size = 2
  ) +
  
  scale_x_continuous(
    breaks = ageing_data$Year,
    guide = guide_axis(n.dodge = 2)
  ) +
  
  labs(
    title = "Changing Share of Older Population in the Netherlands",
    x = "Year",
    y = "Population share (%)",
    linetype = "Age group"
  ) +
  
  theme_minimal() +
  
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(face = "bold")
  )

ggsave(
  "figures/figure1_ageing_share.png",
  figure1,
  width = 9,
  height = 6,
  dpi = 300
)
# ---------------------------------------------------------
# 13. Save Figure 2
# ---------------------------------------------------------

figure2 <- ageing_data %>%
  ggplot(aes(x = Year)) +
  
  geom_line(
    aes(y = Age_65_79, linetype = "Age 65–79"),
    linewidth = 1
  ) +
  
  geom_point(
    aes(y = Age_65_79),
    size = 2
  ) +
  
  geom_line(
    aes(y = Age_80_Plus, linetype = "Age 80+"),
    linewidth = 1
  ) +
  
  geom_point(
    aes(y = Age_80_Plus),
    size = 2
  ) +
  
  scale_x_continuous(
    breaks = ageing_data$Year,
    guide = guide_axis(n.dodge = 2)
  ) +
  
  labs(
    title = "Growth of Older Age Groups in the Netherlands",
    x = "Year",
    y = "Population (×1,000)",
    linetype = "Age group"
  ) +
  
  theme_minimal() +
  
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(face = "bold")
  )

ggsave(
  "figures/figure2_older_population_size.png",
  figure2,
  width = 9,
  height = 6,
  dpi = 300
)
# ---------------------------------------------------------
# 14. Create summary table
# ---------------------------------------------------------

summary_table <- ageing_data %>%
  select(
    Year,
    Total_Population,
    Age_65_79,
    Age_80_Plus,
    Percent_65_79,
    Percent_80_Plus
  )

summary_table
# ---------------------------------------------------------
# 15. Compare the beginning and end of the period
# ---------------------------------------------------------

period_comparison <- ageing_data %>%
  filter(Year %in% c(1900, 2026)) %>%
  select(
    Year,
    Total_Population,
    Age_65_79,
    Age_80_Plus,
    Percent_65_79,
    Percent_80_Plus
  )

period_comparison