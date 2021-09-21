if (!require('upstartr')) install.packages('upstartr'); library('upstartr')

run_config()

source(here::here("R/", "utils.R"))
source(here::here("R/", "palette.R"))
source(here::here("R/", "theme.R"))

run_process()
run_analyze()
run_visualize()

source(here::here("R/", "process_wps_release_headings.R"))
source(here::here("R/", "visualize_wps_release_types.R"))
source(here::here("R/", "visualize_wps_release_subject.R"))


run_notebook(filename="notebook-policing-missing-pio.Rmd")
