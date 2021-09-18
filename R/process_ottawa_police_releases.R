
ottawa_police_pressers.raw <- read_csv(ottawa_police_pressers.raw.file) %>%
  clean_names() %>%
  mutate(
    date_str = paste(month, " 1", ", ", year, sep=""),
    date = as.Date(date_str, format="%B %d, %Y")
  ) %>%
  select(
    -date_str, -month,
  ) %>%
  rename(
    month = date
  ) %>%
  select(
    year, month, count
  ) %>%
  filter(
    year >= 2017
  )


write_feather(ottawa_police_pressers.raw, dir_data_processed('ottawa_police_pressers.feather'))
