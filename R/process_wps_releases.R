
wps_releases_2018_2021.raw <- read_csv(wps_releases_2018_2021.raw.file) %>%
  clean_names()


write_feather(wps_releases_2018_2021.raw, dir_data_processed('wps_releases_2018_2021.feather'))

