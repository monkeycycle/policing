
ottawa_police_pressers <- read_feather(dir_data_processed('ottawa_police_pressers.feather'))


ottawa_police_pressers_annual <- ottawa_police_pressers %>%
  group_by(year) %>%
  summarise(total_count = sum(count)) %>%
  ungroup() %>%
  mutate(
    year_date = paste(year, "-01-01", sep=""),
    year_date = as.Date(year_date)
  )



