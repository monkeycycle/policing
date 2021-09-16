

plot_wps_calls_comms_centre <- ggplot(wps_calls_events, aes(x = year_date, y = calls_to_communication_centre, label=calls_to_communication_centre)) +
  geom_bar(colour = 'white', fill=wfp_blue, stat = 'identity') +
  geom_text(
                stat="identity",
                position = "identity",
                size=4, hjust = .5, vjust = -1,
                color="#222222"
            ) +
  scale_x_date(date_breaks = "1 year", labels = date_format("%Y")) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 700000), label=comma) +
  labs(
    title = "Number of calls to WPS communication centre",
    subtitle = "",
    caption = toupper(paste("WINNIPEG FREE PRESS — SOURCE: Winnipeg Police Service ", sep="")),
    x = "",
    y = ""
  ) +
  minimal_theme()




plot_wps_police_citizen_dispatched <- ggplot(wps_calls_events_counts_tall, aes(x = year_date, y = value, fill=name)) +
  geom_bar(position='dodge', stat = 'identity') +
  scale_x_date(date_breaks = "1 year", labels = date_format("%Y")) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 200000), label=comma) +
  scale_fill_manual(
    values = c(
      police_initiated_displatched_events =  nominalMuted_shade_1,
      citizen_generated_dispatched_events =  nominalMuted_shade_0,
      labels = c("Police initiated", "Citizen generated")
    ),
  ) +
  labs(
    title = "Police initiated and citizen generated dispatched events",
    subtitle = "",
    caption = toupper(paste("WINNIPEG FREE PRESS — SOURCE: Winnipeg Police Service ", sep="")),
    x = "",
    y = "",
    fill = "Dispatch events"

  ) +
  minimal_theme() +
  theme(legend.position = "right")



plot_wps_police_citizen_pct_change <- ggplot(wps_calls_events_pct_chg_tall, aes(x = year_date, y = value, color=name, fill=name)) +
  geom_line( aes(color=name), stat = 'identity', size=1) +
  geom_point( aes(color=name, fill=name), stat = 'identity', size=2) +
  geom_text(data=wps_calls_events_pct_chg_tall,
                aes(label=ifelse(is.na(value), "", paste(round(value, digits = 2), "%", sep=""))),
                size=4, hjust = .5, vjust = -1,
                position = "identity",
                color="#222222"
            ) +
  scale_colour_manual(
    values = c(
      "police_initiated_pct_change" =  nominalMuted_shade_0,
      "citizen_generated_pct_change" =  nominalMuted_shade_1
    ),
    labels = c("police initiate", "citizen generated")

  ) +
  scale_x_date(date_breaks = "1 year", labels = date_format("%Y")) +
  scale_y_continuous(expand = c(0, 0), limits = c(-15, 40)) +
  labs(
    title = "Year over year percentage change for police initiated and citizen generated dispatched events",
    subtitle = "",
    caption = toupper(paste("WINNIPEG FREE PRESS — SOURCE: Winnipeg Police Service ", sep="")),
    x = "",
    y = ""
  ) +
  minimal_theme() +
  theme(legend.position = "right")


wfp_wps_calls_comms_centre <- prepare_plot(plot_wps_calls_comms_centre)
ggsave_pngpdf(wfp_wps_calls_comms_centre, "wfp_wps_calls_comms_centre", width_var = 8.66, height_var = 6, dpi_var = 96, scale_var = 1, units_var = "in")

wfp_wps_police_citizen_dispatched <- prepare_plot(plot_wps_police_citizen_dispatched)
ggsave_pngpdf(wfp_wps_police_citizen_dispatched, "wfp_wps_police_citizen_dispatched", width_var = 8.66, height_var = 6, dpi_var = 96, scale_var = 1, units_var = "in")

wfp_wps_police_citizen_pct_change <- prepare_plot(plot_wps_police_citizen_pct_change)
ggsave_pngpdf(wfp_wps_police_citizen_pct_change, "wfp_wps_police_citizen_pct_change", width_var = 8.66, height_var = 6, dpi_var = 96, scale_var = 1, units_var = "in")
