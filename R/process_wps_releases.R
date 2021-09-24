
wps_releases.raw <- read_csv(wps_releases.raw.file) %>%
  clean_names()


write_feather(wps_releases.raw, dir_data_processed('wps_releases.feather'))

