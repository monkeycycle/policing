
wps_releases_pressers <- full_join(
  wps_pressers_2018_2021,
  wps_releases,
  by=c("date"="date")
)
