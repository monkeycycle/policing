############################################################
# Project-specific functions.
#
#
############################################################



`%notin%` = function(x,y) !(x %in% y)


# ggsave two for one
ggsave_pngpdf <-  function(plot_var, fileslug_var, formats="png", width_var=8.66, height_var=6, dpi_var=300, scale_var=1, units_var="in"){

  if(!is.na(formats)){
    ggsave(dir_plots(paste({{ fileslug_var }}, ".png", sep="")), plot = {{ plot_var }}, device = "png", type = "cairo", scale = {{ scale_var }}, width = {{ width_var }}, height = {{ height_var }}, units = {{ units_var }}, dpi = {{ dpi_var }}, limitsize = TRUE)
    ggsave(dir_plots(paste({{ fileslug_var }}, ".pdf", sep="")), plot = {{ plot_var }}, device = cairo_pdf, scale = {{ scale_var }}, width = {{ width_var }}, height = {{ height_var }}, units = {{ units_var }}, dpi = {{ dpi_var }}, limitsize = TRUE)
  }
  else{
    if(formats == "png"){
      ggsave(dir_plots(paste({{ fileslug_var }}, ".png", sep="")), plot = {{ plot_var }}, device = "png", type = "cairo", scale = {{ scale_var }}, width = {{ width_var }}, height = {{ height_var }}, units = {{ units_var }}, dpi = {{ dpi_var }}, limitsize = TRUE)
    }

    if(formats == "pdf"){
      ggsave(dir_plots(paste({{ fileslug_var }}, ".pdf", sep="")), plot = {{ plot_var }}, device = cairo_pdf, scale = {{ scale_var }}, width = {{ width_var }}, height = {{ height_var }}, units = {{ units_var }}, dpi = {{ dpi_var }}, limitsize = TRUE)
    }
  }

  # ggsave_instagram({{ plot_var }}, {{ fileslug_var }})

}




split_into_multiple <- function(column, pattern = ", ", into_prefix){
  cols <- str_split_fixed(column, pattern, n = Inf)
  # Sub out the ""'s returned by filling the matrix to the right, with NAs which are useful
  cols[which(cols == "")] <- NA
  cols <- as.tibble(cols)
  # name the 'cols' tibble as 'into_prefix_1', 'into_prefix_2', ..., 'into_prefix_m'
  # where m = # columns of 'cols'
  m <- dim(cols)[2]

  names(cols) <- paste(into_prefix, 1:m, sep = "_")
  return(cols)
}

