
regina_police_pressers.raw <- read_csv(regina_police_pressers.raw.file) %>%
  clean_names() %>%
  mutate(
    release_date = ifelse(month < 10,
                          paste(year, "-0", month, "-01", sep=""),
                          paste(year, "-", month, "-01", sep="")
                    ),
    release_date = as.Date(release_date)
  ) %>%
  filter(year >= 2018)


regina_release_monthly <- regina_police_pressers.raw %>%
  group_by(release_date) %>%
  summarise(count = n())

regina_release_annual <- regina_police_pressers.raw %>%
  group_by(year) %>%
  summarise(count = n())


p_regina_release_monthly <- ggplot(regina_release_monthly) +
  aes(x = release_date, weight = count) +
  geom_bar(fill = wfp_blue) +
  minimal_theme() +
  labs(
    title="Monthly press releases issued by the Regina Police",
    subtitle="Number of releases"
  )


p_regina_release_annual <- ggplot(regina_release_annual) +
  aes(x = year, weight = count) +
  geom_bar(fill = wfp_blue) +
  minimal_theme() +
  labs(
    title="Annual press releases issued by the Regina Police",
    subtitle="Number of releases"

  )



