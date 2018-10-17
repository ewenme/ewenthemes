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

  if (getOption("hrbrthemes.loadfonts", default = FALSE)) {
    if (interactive()) packageStartupMessage("Registering PDF & PostScript fonts with R")
    extrafont::loadfonts("pdf", quiet = TRUE)
    extrafont::loadfonts("postscript", quiet = TRUE)
  }

  fnt <- extrafont::fonttable()
  if (!any(grepl("Arial[ ]Narrow|Roboto[ ]Condensed", fnt$FamilyName))) {
    packageStartupMessage("NOTE: Either Arial Narrow or Roboto Condensed fonts are required to use these themes.")
    packageStartupMessage("      Please use ewenthemes::import_roboto_condensed() to install Roboto Condensed and")
    packageStartupMessage("      if Arial Narrow is not on your system, please see http://bit.ly/arialnarrow")
  } # nocov end

}
