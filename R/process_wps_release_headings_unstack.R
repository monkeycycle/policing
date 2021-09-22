
wps_release_headings_stacked_prs <- read_csv(wps_release_headings.raw.file) %>%
  clean_names() %>%
  rename(
    date = heading_2
  ) %>%
  mutate(
    date = gsub(" Media Releases", "", date, fixed=TRUE),
    date = gsub(" Media Release", "", date, fixed=TRUE),
    date = as.Date(date, format="%B %d, %Y")
  ) %>%
  select(
    -url
  ) %>%
  pivot_longer(
    -date,
    names_to="release_number",
    values_to="subject"
  ) %>%
  filter(!is.na(subject)) %>%
  filter(!is.na(date)) %>%
  mutate(
    date_month = paste(year(date), "-", month(date), "-01", sep=""),
    date_year = paste(year(date), "-01-01", sep="")
  )


wps_unstacked_releases_monthly <- wps_release_headings_stacked_prs %>%
  group_by(date_month) %>%
  summarise(count = n())


wps_unstacked_releases_monthly_wide <- wps_unstacked_releases_monthly %>%
  mutate(
    year = year(date_month),
    month = month(date_month)
  ) %>%
  select(
    -date_month
  ) %>%
  pivot_wider(
              names_from="month",
              names_prefix="month_",
              values_from="count"
            ) %>%
  select(
    year, month_1, month_2, month_3, month_4, month_5, month_6, month_7, month_8, month_9, month_10, month_11, month_12
  )


wps_unstacked_releases_annual <- wps_release_headings_stacked_prs %>%
  group_by(date_year) %>%
  summarise(count = n()) %>%
  ungroup() %>%
  mutate(
    date_year = as.Date(date_year)
  )



p_releases_2018_2021_annual_unstacked <- ggplot(wps_unstacked_releases_annual,aes(x=date_year,y=count)) +
  geom_bar(stat="identity", fill=wfp_blue) +
  geom_text(
    aes(
      x=date_year,
      y=count,
      label = paste(count, sep = "")
    ),
    vjust=-1,
    # fontface="bold",
    size=4
  ) +
  scale_x_date(expand = c(0, 0),
               date_breaks = "1 year",
               labels = date_format("%Y"),
               limits=as.Date(c("2017-01-31", "2021-12-31"))) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, 750)
  ) +
  labs(
    title="UNSTACKED Press releases issued by the Winnipeg Police Service",
    subtitle="Number of press releases",
    x="",
    y="",
    caption = paste("Note: The 2018 releases are limited to October through December.",
                    "\n",
                    "WINNIPEG FREE PRESS — SOURCE: WINNIPEG POLICE SERVICE", sep="")
  ) +
  minimal_theme() +
  theme(
    # axis.line = ggplot2::element_blank(),
    # axis.line.x = ggplot2::element_blank(), # ggplot2::element_line(color="#777777"),
    # axis.line.y = ggplot2::element_blank(),
    panel.grid.major.x = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_blank(),
    panel.grid.minor.x = ggplot2::element_blank(),
    panel.grid.minor.y = ggplot2::element_blank()
  )

