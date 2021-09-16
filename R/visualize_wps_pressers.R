
p_pressers_2018_2021_annual <- ggplot(wps_pressers_2018_2021_annual,aes(x=year_date,y=count)) +
  geom_bar(stat="identity", fill=wfp_blue) +
  geom_text(
    aes(
      x=year_date,
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
  scale_y_continuous(expand = c(0, 0), limits = c(0, 100)) +
  labs(
    title="Press conferences held by the Winnipeg Police Service",
    subtitle="Number of press conferences",
    x="",
    y="",
    caption="WINNIPEG FREE PRESS — SOURCE: WINNIPEG POLICE SERVICE"
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


p_pressers_2018_2021_monthly <- ggplot(wps_pressers_2018_2021_monthly,aes(x=year_month,y=count)) +
  geom_bar(stat="identity", fill=wfp_blue) +
  geom_smooth(fill=NA, colour="#ffffff", size=1.4) +
  geom_smooth(fill=nominalMuted_shade_1, colour=nominalBold_shade_1, size=1) +

  scale_x_date(expand = c(0, 0),
               date_breaks = "1 year",
               labels = date_format("%Y"),
               limits=as.Date(c("2018-01-01", "2021-12-31"))) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 15)) +
  labs(
    title="Monthly press conferences held by the Winnipeg Police Service",
    subtitle="Number of press conferences",
    x="",
    y="",
    caption="WINNIPEG FREE PRESS — SOURCE: WINNIPEG POLICE SERVICE"
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

wfp_pressers_2018_2021_monthly <- prepare_plot(p_pressers_2018_2021_monthly)
ggsave_pngpdf(wfp_pressers_2018_2021_monthly, "wfp_pressers_2018_2021_monthly", width_var=8.66, height_var=6, dpi_var=96, scale_var=1, units_var="in")

wfp_pressers_2018_2021_annual <- prepare_plot(p_pressers_2018_2021_annual)
ggsave_pngpdf(wfp_pressers_2018_2021_annual, "wfp_pressers_2018_2021_annual", width_var=8.66, height_var=6, dpi_var=96, scale_var=1, units_var="in")
