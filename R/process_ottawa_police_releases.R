
ottawa_police_pressers.raw <- read_csv(ottawa_police_pressers.raw.file) %>%
  clean_names() %>%
  mutate(
    date_str = paste(month, " ", day, ", ", year, sep=""),
    date = as.Date(date_str, format="%B %d, %Y")
  )


write_feather(ottawa_police_pressers.raw, dir_data_processed('ottawa_police_pressers.feather'))
