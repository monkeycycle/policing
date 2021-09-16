
ottawa_police_pressers <- read_feather(dir_data_processed('ottawa_police_pressers.feather'))


ottawa_police_pressers_annual <- ottawa_police_pressers %>%
  group_by(year) %>%
  summarise(count = n()) %>%
  ungroup()

ottawa_police_pressers_monthly <- ottawa_police_pressers %>%
  mutate(
    year_month =
      ifelse(month(date) < 10,
             paste(year(date), "-0", month(date), "-01", sep=""),
             paste(year(date), "-", month(date), "-01", sep="")
      )
  ) %>%
  group_by(year_month) %>%
  summarise(count = n()) %>%
  ungroup() %>%
  drop_na() %>%
  mutate(
    year_month = as.Date(year_month)
  ) %>%
  filter(!is.na(year_month))
