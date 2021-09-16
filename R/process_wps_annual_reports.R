wps_annual_reports.raw <- read_xlsx(wps_annual_reports.raw.file, sheet = "annual-reports") %>%
  clean_names()

write_feather(wps_annual_reports.raw, dir_data_processed("wps_annual_reports.feather"))
