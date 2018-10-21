.onAttach <- function(libname, pkgname) {

  # if (interactive()) {
  #   packageStartupMessage(paste0("ewenthemes is under *active* development. ",
  #                                "See https://github.com/ewenme/ewenthemes for info/news."))
  # }

  # Suggestion by @alexwhan

  if (.Platform$OS.type == "windows")  { # nocov start
    if (interactive()) packageStartupMessage("Registering Windows fonts with R")
    extrafont::loadfonts("win", quiet = TRUE)
  }

  if (getOption("ewenthemes.loadfonts", default = FALSE)) {
    if (interactive()) packageStartupMessage("Registering PDF & PostScript fonts with R")
    extrafont::loadfonts("pdf", quiet = TRUE)
    extrafont::loadfonts("postscript", quiet = TRUE)
  }

  fnt <- extrafont::fonttable()
  if (!any(grepl("Work[ ]Sans|Spectral", fnt$FamilyName))) {
    packageStartupMessage("NOTE: Either Work Sans or Spectral fonts are required to use these themes.")
    packageStartupMessage("      Please use ewenthemes::import_work_sans() to install Work Sans and")
    packageStartupMessage("      ewenthemes::import_spectral() to install Spectral.")
  } # nocov end

}
