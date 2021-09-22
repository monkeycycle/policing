
saskatoon_police_pressers.raw <- read_csv(saskatoon_police_pressers.raw.file) %>%
  clean_names() %>%
  mutate(
    date = paste(day, ", ", year, sep=""),
    release_date = as.Date(date, format="%B %d, %Y"),
    release_month = ifelse(month(release_date) < 10,
                                paste(year(release_date), "-0", month(release_date), "-01", sep=""),
                                paste(year(release_date), "-", month(release_date), "-01", sep="")
                              ),

    release_year = paste(year(release_date), "-01-01", sep=""),
    release_month = as.Date(release_month),
    release_year = as.Date(release_year)
  ) %>%
  filter(year >= 2018)


saskatoon_release_monthly <- saskatoon_police_pressers.raw %>%
  group_by(release_month) %>%
  summarise(count = n())

saskatoon_release_annual <- saskatoon_police_pressers.raw %>%
  group_by(release_year) %>%
  summarise(count = n())


p_saskatoon_release_monthly <- ggplot(saskatoon_release_monthly) +
  aes(x = release_month, weight = count) +
  geom_bar(fill = wfp_blue) +
  minimal_theme() +
  labs(
    title="Monthly press releases issued by the saskatoon Police",
    subtitle="Number of releases"
  )


p_saskatoon_release_annual <- ggplot(saskatoon_release_annual) +
  aes(x = release_year, weight = count) +
  geom_bar(fill = wfp_blue) +
  minimal_theme() +
  labs(
    title="Annual press releases issued by the saskatoon Police",
    subtitle="Number of releases"

  )



