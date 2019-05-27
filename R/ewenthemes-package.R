#' Minimal, typography-centric themes and aesthetic helpers for ggplot2
#'
#' The core theme: `theme_ewen` ("ipsum" is Latin for "precise") uses Arial Narrow
#' which should be installed on practically any modern system, so it's "free"-ish.
#'
#' There is an option `ewenthemes.loadfonts` which -- if set to `TRUE` -- will
#' call `extrafont::loadfonts()` to register non-core fonts with R PDF & PostScript
#' devices. If you are running under Windows, the package calls the same function
#' to register non-core fonts with the Windows graphics device.
#'
#' @md
#' @name ewenthemes
#' @docType package
#' @author Ewen Henderson (ewenhenderson@@gmail.com)
#' @import ggplot2 grid extrafont grDevices
#' @import rmarkdown knitr
#' @importFrom tools file_path_sans_ext
NULL
