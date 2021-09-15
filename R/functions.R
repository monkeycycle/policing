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




