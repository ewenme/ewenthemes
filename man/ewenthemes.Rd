% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ewenthemes-package.R
\docType{package}
\name{ewenthemes}
\alias{ewenthemes}
\title{Minimal, typography-centric themes and aesthetic helpers for ggplot2}
\description{
The core theme: \code{theme_ewen} ("ipsum" is Latin for "precise") uses Arial Narrow
which should be installed on practically any modern system, so it's "free"-ish.
}
\details{
There is an option \code{ewenthemes.loadfonts} which -- if set to \code{TRUE} -- will
call \code{extrafont::loadfonts()} to register non-core fonts with R PDF & PostScript
devices. If you are running under Windows, the package calls the same function
to register non-core fonts with the Windows graphics device.
}
