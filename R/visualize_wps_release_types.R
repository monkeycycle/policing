
# The palette with grey:
palette_colourblind_13 <- c('#a6cee3','#1f78b4','#b2df8a','#33a02c','#fb9a99','#e31a1c','#fdbf6f','#ff7f00','#cab2d6','#6a3d9a','#ffff99','#b15928', '#999999', '#555555')


p_releases_2018_2021_annual_type <- ggplot(wps_release_headings_annual_type) +
  aes(x=date_year, y=count, fill=type) +
  geom_bar(aes(x=date_year, y=count, fill=type), stat="identity") +
  scale_fill_manual(values=palette_colourblind_13) +
  scale_x_date(expand = c(0, 0),
               date_breaks = "1 year",
               labels = date_format("%Y"),
               limits=as.Date(c("2017-01-31", "2021-12-31"))) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, 500)
  ) +
  labs(
    title="Types of press releases issued by the Winnipeg Police Service",
    subtitle="Includes releases containing multiple subjects",
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
    panel.grid.minor.y = ggplot2::element_blank(),
    legend.position = "right"
  )

wfp_releases_2018_2021_annual_type <- prepare_plot(p_releases_2018_2021_annual_type)
ggsave_pngpdf(wfp_releases_2018_2021_annual_type, "wfp_releases_2018_2021_annual_type", width_var=8.66, height_var=6, dpi_var=96, scale_var=1, units_var="in")




p_releases_2018_2021_monthly_type <- ggplot(wps_release_headings_monthly_type) +
  aes(x=date_month, y=count, fill=type) +
  geom_bar(aes(x=date_month, y=count, fill=type), stat="identity") +
  scale_fill_hue(direction = 1) +
  scale_x_date(expand = c(0, 0),
               date_breaks = "1 year",
               labels = date_format("%Y"),
               limits=as.Date(c("2018-01-01", "2021-12-31"))) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, 100)
  ) +
  labs(
    title="Types of press releases issued by the Winnipeg Police Service",
    subtitle="Includes releases containing multiple subjects",
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
    panel.grid.minor.y = ggplot2::element_blank(),
    legend.position = "right"
  )

wfp_releases_2018_2021_monthly_type <- prepare_plot(p_releases_2018_2021_monthly_type)

ggsave_pngpdf(wfp_releases_2018_2021_monthly_type, "wfp_releases_2018_2021_monthly_type", width_var=8.66, height_var=6, dpi_var=96, scale_var=1, units_var="in")

