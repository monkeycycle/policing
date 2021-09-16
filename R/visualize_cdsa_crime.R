
plot_wps_cdsa_crimes <- ggplot(wps_cdsa_crimes, aes(x = year_date, y = cdsa_total, label=cdsa_total)) +
  geom_bar(data=wps_cdsa_crimes %>% filter(year_date <= as.Date("2015-01-01")), fill=nominalMuted_shade_0, stat = 'identity') +
  geom_bar(data=wps_cdsa_crimes %>% filter(year_date >= as.Date("2015-01-01")), fill=wfp_blue, stat = 'identity') +
  geom_text(
                stat="identity",
                position = "identity",
                size=3.5, hjust = .5, vjust = -1,
                color="#222222"
            ) +

  geom_text(    aes(x=as.Date("2017-05-01"), y=885),
                label=wrap_text("29.76% decrease in incidents between 2015 and 2019", 30),
                size=4, hjust = 1, vjust = 0,
                position = "identity",
                color="#222222"
            ) +
  geom_curve(
    aes(
      x=as.Date("2017-06-01"), y=920,
      xend=as.Date("2018-12-09"), yend=630
    ),
    color = "#333333",
    size = .25, curvature = -.4,
    arrow = arrow(length = unit(0.01, "npc"))
  ) +


  scale_x_date(date_breaks = "1 year", labels = date_format("%Y")) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 1000), label=comma) +
  labs(
    title = wrap_text("Annual number of drug crimes", 80),
    subtitle = "Incidents of Controlled Drugs and Substances Act (CDSA) offences",
    caption = toupper(paste("WINNIPEG FREE PRESS — SOURCE: Winnipeg Police Service Annual Reports", sep="")),
    x = "",
    y = ""
  ) +
  minimal_theme()



plot_wps_cdsa_crimes_clearance <- ggplot(wps_cdsa_crimes, aes(x = year_date, y = cdsa_clearance_rate_pct, label=cdsa_clearance_rate_pct)) +
  geom_line( colour=nominalMuted_shade_0, fill=nominalMuted_shade_0, stat = 'identity', size=1) +
  geom_point( colour=wfp_blue, fill=wfp_blue, stat = 'identity', size=2) +
  geom_text(    aes(label=format(cdsa_clearance_rate_pct, digits=0)),
                size=4, hjust = .5, vjust = -1,
                position = "identity",
                color="#222222"
            ) +
  scale_x_date(date_breaks = "1 year", labels = date_format("%Y")) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 105)) +
  labs(
    title = "Clearance rate for CDSA crimes in Winnipeg",
    subtitle = "",
    caption = toupper(paste("WINNIPEG FREE PRESS — SOURCE: Winnipeg Police Service ", sep="")),
    x = "",
    y = ""
  ) +
  minimal_theme()



wfp_wps_cdsa_crimes <- prepare_plot(plot_wps_cdsa_crimes)
ggsave_pngpdf(wfp_wps_cdsa_crimes, "wfp_wps_cdsa_crimes", width_var = 8.66, height_var = 6, dpi_var = 96, scale_var = 1, units_var = "in")

wfp_wps_cdsa_crimes_clearance <- prepare_plot(plot_wps_cdsa_crimes_clearance)
ggsave_pngpdf(wfp_wps_cdsa_crimes_clearance, "wfp_wps_cdsa_crimes_clearance", width_var = 8.66, height_var = 6, dpi_var = 96, scale_var = 1, units_var = "in")
