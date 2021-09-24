
wps_release_headings_stacked_prs_ref <- read_csv(wps_release_headings.raw.file) %>%
  clean_names() %>%
  mutate(
    date = gsub(" Media Releases", "", date, fixed=TRUE),
    date = gsub(" Media Release", "", date, fixed=TRUE),
    date = as.Date(date, format="%B %d, %Y")
  )

wps_release_headings_stacked_prs <- read_csv(wps_release_headings.raw.file) %>%
  clean_names() %>%
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
  filter(subject != "Was this information helpful?") %>%
  filter(subject != "How can we make this web page better?") %>%
  filter(subject != "Ces renseignements sont-ils utiles?") %>%
  filter(subject != "Comment pourrait-on améliorer cette page Web?") %>%
  filter(subject != "ARRESTED") %>%
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
      label = ifelse(date_year == as.Date("2021-01-01"),
        paste(count, " (YTD)", sep = ""),
        paste(count, sep = "")
      )
    ),
    vjust=-1,
    # fontface="bold",
    size=4
  ) +
  scale_x_date(expand = c(0, 0),
               date_breaks = "1 year",
               labels = date_format("%Y")
               # limits=as.Date(c("2016-01-31", "2021-12-31"))
               ) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, 800)
  ) +
  labs(
    title="Press releases issued by the Winnipeg Police Service",
    subtitle="",
    x="",
    y="",
    caption = paste("Note: 2021 data is year to date", "\n", "WINNIPEG FREE PRESS — SOURCE: WINNIPEG POLICE SERVICE", sep="")
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

p_releases_2018_2021_annual_unstacked_print <- p_releases_2018_2021_annual_unstacked +
  minimal_theme_print()

wfp_releases_2018_2021_annual_unstacked <- prepare_plot(p_releases_2018_2021_annual_unstacked)
wfp_releases_2018_2021_annual_unstacked_print <- prepare_plot(p_releases_2018_2021_annual_unstacked_print)

ggsave_pngpdf(wfp_releases_2018_2021_annual_unstacked, "wfp_releases_2018_2021_annual", width_var=8.66, height_var=6, dpi_var=96, scale_var=1, units_var="in")
ggsave_pngpdf(wfp_releases_2018_2021_annual_unstacked_print, "wfp_releases_2018_2021_annual_unstacked_print", width_var=8.66, height_var=6, dpi_var=96, scale_var=1, units_var="in")


