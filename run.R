if (!require('upstartr')) install.packages('upstartr'); library('upstartr')

run_config()

source(here::here("R/", "utils.R"))
source(here::here("R/", "palette.R"))
source(here::here("R/", "theme.R"))

run_process()
run_analyze()
run_visualize()

run_notebook(filename="notebook-policing-missing-pio.Rmd")
