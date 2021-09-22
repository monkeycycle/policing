
calgary_police_pressers.raw <- read_csv(calgary_police_pressers.raw.file) %>%
  clean_names() %>%
  mutate(
    release_date = as.Date(release_date, format="%B %d, %Y")
  ) %>%
  filter(year >= 2018)


calgary_release_monthly <- calgary_police_pressers.raw %>%
  group_by(release_date) %>%
  summarise(count = n())

calgary_release_annual <- calgary_police_pressers.raw %>%
  group_by(year) %>%
  summarise(count = n())


p_calgary_release_monthly <- ggplot(calgary_release_monthly) +
  aes(x = release_date, weight = count) +
  geom_bar(fill = wfp_blue) +
  minimal_theme() +
  labs(
    title="Monthly press releases issued by the Calgary Police",
    subtitle="Number of releases"
  )


p_calgary_release_annual <- ggplot(calgary_release_annual) +
  aes(x = year, weight = count) +
  geom_bar(fill = wfp_blue) +
  minimal_theme() +
  labs(
    title="Annual press releases issued by the Calgary Police",
    subtitle="Number of releases"

  )

