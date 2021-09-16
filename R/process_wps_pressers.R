
wps_pressers_2018_2021.raw <- read_csv(wps_pressers_2018_2021.raw.file) %>%
  clean_names() %>%
  pivot_longer(
    cols = starts_with("x"),
    names_to="date_col",
    values_to="day_of_month"
  ) %>%
  mutate(
    month_name = ifelse(month == "Augu", "August", month)
  ) %>%
  filter(!is.na(day_of_month)) %>%
  mutate(
    date_string = paste(month_name, " ", day_of_month, ", ", year, sep=""),
    date = as.Date(date_string, format="%B %d, %Y"),
    type = "Press conference"
  ) %>%
  select(
    date, type
  )

write_feather(wps_pressers_2018_2021.raw, dir_data_processed('wps_pressers_2018_2021.feather'))

