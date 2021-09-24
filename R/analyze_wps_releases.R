
wps_releases <- read_feather(dir_data_processed('wps_releases.feather'))



wps_releases_annual <- wps_releases %>%
  mutate(
    year = year(date),
    year_date = paste(year(date), "-01-31", sep="")
  ) %>%
  filter(!is.na(year_date)) %>%
  group_by(year_date) %>%
  summarise(count = n()) %>%
  ungroup() %>%
  mutate(
    year_date = as.Date(year_date)
  ) %>%
  filter(!is.na(year_date))

wps_releases_monthly <- wps_releases %>%
  mutate(
    year_month = paste(year(date), "-", month(date), "-01", sep = "")
  ) %>%
  filter(!is.na(year_month)) %>%
  filter(year_month != "") %>%
  group_by(year_month) %>%
  summarise(count = n()) %>%
  ungroup() %>%
  drop_na() %>%
  mutate(
    year_month = as.Date(year_month)
  ) %>%
  filter(!is.na(year_month))


wps_releases_monthly_wide <- wps_releases_monthly %>%
  separate(year_month, c("year", "month", "dayTOSS")) %>%
  select(-dayTOSS) %>%
  pivot_wider(names_from="year", names_prefix="year_", values_from="count" ) %>%
  mutate(
    month_name = case_when(
      month == "01" ~ "January",
      month == "02" ~ "February",
      month == "03" ~ "March",
      month == "04" ~ "April",
      month == "05" ~ "May",
      month == "06" ~ "June",
      month == "07" ~ "July",
      month == "08" ~ "August",
      month == "09" ~ "September",
      month == "10" ~ "October",
      month == "11" ~ "November",
      month == "12" ~ "December"
    ),
    month_name = factor(month_name, c(
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ))
  ) %>%
    select(
      month,
      month_name,
      year_2018,
      year_2019,
      year_2020,
      year_2021
    )
