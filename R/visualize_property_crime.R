
plot_wps_property_crimes <- ggplot(wps_property_crimes, aes(x = year_date, y = property_crimes_total, label=property_crimes_clearance_rate_pct)) +
  geom_bar(data=wps_property_crimes %>% filter(year_date <= as.Date("2015-01-01")), fill=nominalMuted_shade_0, stat = 'identity') +
  geom_bar(data=wps_property_crimes %>% filter(year_date >= as.Date("2015-01-01")), fill=wfp_blue, stat = 'identity') +
  geom_text(data=wps_property_crimes,
                aes(label=comma(property_crimes_total)),
                size=3.5, hjust = .5, vjust = -1,
                position = "identity",
                color="#222222"
            ) +
  geom_text(    aes(x=as.Date("2015-02-01"), y=42500),
                label=wrap_text("143% increase in incidents between 2015 and 2019", 30),
                size=4, hjust = 1, vjust = 0,
                position = "identity",
                color="#222222"
            ) +
  geom_curve(
    aes(
      x=as.Date("2014-04-01"), y=49000,
      xend=as.Date("2018-09-01"), yend=54800
    ),
    color = "#333333",
    size = .25, curvature = -.3,
    arrow = arrow(length = unit(0.01, "npc"))
  ) +

  scale_x_date(date_breaks = "1 year", labels = date_format("%Y")) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 60000), label=comma) +
  labs(
    title = "Annual incidents of property crimes in Winnipeg",
    subtitle = " ",
    caption = toupper(paste("WINNIPEG FREE PRESS — SOURCE: Winnipeg Police Service Annual Reports", sep="")),
    x = "",
    y = ""
  ) +
  minimal_theme()



plot_wps_property_crimes_clearance <- ggplot(wps_property_crimes, aes(x = year_date, y = property_crimes_clearance_rate_pct, label=property_crimes_clearance_rate_pct)) +
  geom_line( colour=nominalMuted_shade_0, fill=nominalMuted_shade_0, stat = 'identity', size=1) +
  geom_point( colour=wfp_blue, fill=wfp_blue, stat = 'identity', size=2) +
  geom_text(
                aes(label=ifelse(is.na(property_crimes_clearance_rate_pct), "", paste(round(property_crimes_clearance_rate_pct, digits = 2), "%", sep=""))),
                size=4, hjust = .5, vjust = -1,
                position = "identity",
                color="#222222"
            ) +
  scale_x_date(date_breaks = "1 year", labels = date_format("%Y")) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 100)) +
  labs(
    title = "Clearance rate for property crimes in Winnipeg",
    subtitle = "",
    caption = toupper(paste("WINNIPEG FREE PRESS — SOURCE: Winnipeg Police Service ", sep="")),
    x = "",
    y = ""
  ) +
  minimal_theme()



wfp_wps_property_crimes <- prepare_plot(plot_wps_property_crimes)
ggsave_pngpdf(wfp_wps_property_crimes, "wfp_wps_property_crimes", width_var = 8.66, height_var = 6, dpi_var = 96, scale_var = 1, units_var = "in")

wfp_wps_property_crimes_clearance <- prepare_plot(plot_wps_property_crimes_clearance)
ggsave_pngpdf(wfp_wps_property_crimes_clearance, "wfp_wps_property_crimes_clearance", width_var = 8.66, height_var = 6, dpi_var = 96, scale_var = 1, units_var = "in")
