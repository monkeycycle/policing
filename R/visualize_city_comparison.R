

calgary_release_annual_2stack <- calgary_release_annual %>% mutate(city="Calgary")
ottawa_police_pressers_annual_2stack <- ottawa_police_pressers_annual %>% select(year, total_count) %>% mutate(city="Ottawa") %>% rename(count = total_count)
regina_release_annual_2stack <- regina_release_annual %>% mutate(city="Regina")
saskatoon_release_annual_2stack <- saskatoon_release_annual %>% mutate(city="Saskatoon") %>%  rename( year = release_year) %>%  mutate(year = year(year))
winnipeg_release_annual_2stack <- wps_unstacked_releases_annual %>% rename(year = date_year) %>%  mutate(year = year(year)) %>% mutate(city="Winnipeg")

city_compare_releases <- rbind(
  calgary_release_annual_2stack,
  ottawa_police_pressers_annual_2stack,
  regina_release_annual_2stack,
  saskatoon_release_annual_2stack,
  winnipeg_release_annual_2stack
) %>%
filter(year != 2017) %>%
mutate(
  year = paste(year, "-01-01", sep=""),
  year = as.Date(year)
)


wfpPaletteNominalBold <- c(
  nominalBold_shade_0,
  nominalBold_shade_1,
  nominalBold_shade_2,
  nominalBold_shade_3,
  wfp_blue
)

wfpPaletteNominalMuted <- c(
  nominalMuted_shade_0,
  nominalMuted_shade_1,
  nominalMuted_shade_2,
  nominalMuted_shade_3,
  wfp_blue
)


p_city_compare_releases <- ggplot(city_compare_releases %>% filter(year > as.Date("2017-12-01"))) +
  aes(x = year, y = count, fill=city) +
  geom_bar(aes(x = year, y = count, fill=city),
           stat="identity", position="dodge") +
  # geom_text(aes(x = year, y = count, label=count), colour="#000000",
  #           size=4, vjust=-.5) +
  scale_x_date(expand = c(0, 0),
               date_breaks = "1 year",
               labels = date_format("%Y"),
               # limits=as.Date(c("2017-12-01", "2021-12-31"))
               ) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 1250), labels=scales::comma) +
  scale_fill_manual(values=wfpPaletteNominalMuted) +
  labs(
    title="How WPS press release rate compares to other cities",
    subtitle="",
    x="",
    y="",
    fill="",
    caption = paste("Note: 2021 data is year to date", "\n", "WINNIPEG FREE PRESS — SOURCE: POLICE SERVICES", sep="")
  ) +
  minimal_theme() +
  theme(
    strip.background=ggplot2::element_blank(),
    strip.text=ggplot2::element_text(size =13, hjust=0, face="bold"),
    panel.border=ggplot2::element_blank()
  )



p_city_compare_releases_print <- p_city_compare_releases +
  minimal_theme_print() +
  theme(
    strip.background=ggplot2::element_blank(),
    strip.text=ggplot2::element_text(size =13, hjust=0, face="bold"),
    panel.border=ggplot2::element_blank()
  )

wfp_city_compare_releases <- prepare_plot(p_city_compare_releases)
wfp_city_compare_releases_print <- prepare_plot(p_city_compare_releases_print)

ggsave_pngpdf(wfp_city_compare_releases, "wfp_city_compare_releases", width_var=8.66, height_var=6, dpi_var=96, scale_var=1, units_var="in")
ggsave_pngpdf(wfp_city_compare_releases_print, "wfp_city_compare_releases_print", width_var=8.66, height_var=6, dpi_var=96, scale_var=1, units_var="in")




p_city_compare_releases_facet <- ggplot(city_compare_releases %>% filter(year > as.Date("2017-12-01"))) +
  aes(x = year, y = count) +
  geom_bar(stat="identity", fill=wfp_blue) +
  geom_text(aes(x = year, y = count, label=count), colour="#000000",
            size=4, vjust=-.5) +
  scale_x_date(expand = c(0, 0),
               date_breaks = "1 year",
               labels = date_format("%Y"),
               # limits=as.Date(c("2017-12-01", "2021-12-31"))
  ) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 1250), labels=scales::comma) +
  labs(
    title="Police service press releases",
    subtitle="Number of press releases",
    x="",
    y="",
    caption = paste("Note: 2021 data is year to date", "\n", "WINNIPEG FREE PRESS — SOURCE: POLICE SERVICES", sep="")
  ) +
  minimal_theme() +
  theme(
    strip.background=ggplot2::element_blank(),
    strip.text=ggplot2::element_text(size =13, hjust=0, face="bold"),
    panel.border=ggplot2::element_blank()
  ) +
  facet_wrap(vars(city))



p_city_compare_releases_facet_print <- p_city_compare_releases_facet +
  minimal_theme_print() +
  theme(
    strip.background=ggplot2::element_blank(),
    strip.text=ggplot2::element_text(size =13, hjust=0, face="bold"),
    panel.border=ggplot2::element_blank()
  )

wfp_city_compare_releases_facet <- prepare_plot(p_city_compare_releases_facet)
wfp_city_compare_releases_facet_print <- prepare_plot(p_city_compare_releases_facet_print)

ggsave_pngpdf(wfp_city_compare_releases_facet, "wfp_city_compare_releases_facet", width_var=8.66, height_var=6, dpi_var=96, scale_var=1, units_var="in")
ggsave_pngpdf(wfp_city_compare_releases_facet_print, "wfp_city_compare_releases_facet_print", width_var=8.66, height_var=6, dpi_var=96, scale_var=1, units_var="in")


