#' A precise & pristine [ggplot2] theme with an emphasis on typography,
#' supporting the \href{https://ewen.io/}{ewen.io} site, based on
#' `theme_ipsum` from \code{\href{https://github.com/hrbrmstr/hrbrthemes}{hrbrthemes}}.
#'
#' You should [import_work_sans]() first and also install the fonts on your
#' system before trying to use this theme.
#'
#' There is an option `ewenthemes.loadfonts` which -- if set to `TRUE` -- will
#' call `extrafont::loadfonts()` to register non-core fonts with R PDF & PostScript
#' devices. If you are running under Windows, the package calls the same function
#' to register non-core fonts with the Windows graphics device.
#'
#' @md
#' @param base_family,base_size base font family and size
#' @param plot_title_family,plot_title_face,plot_title_size,plot_title_margin plot title family, face, size and margi
#' @param subtitle_family,subtitle_face,subtitle_size plot subtitle family, face and size
#' @param subtitle_margin plot subtitle margin bottom (single numeric value)
#' @param strip_text_family,strip_text_face,strip_text_size facet label font family, face and size
#' @param caption_family,caption_face,caption_size,caption_margin plot caption family, face, size and margin
#' @param axis_title_family,axis_title_face,axis_title_size axis title font family, face and size
#' @param axis_title_just axis title font justification, one of `[blmcrt]`
#' @param plot_margin plot margin (specify with [ggplot2::margin()])
#' @param grid_col,axis_col grid & axis colors; grid defaults to `#cccccc`, axes default to `#2b2b2b`
#' @param grid panel grid (`TRUE`, `FALSE`, or a combination of `X`, `x`, `Y`, `y`)
#' @param axis_text_size font size of axis text
#' @param axis add x or y axes? `TRUE`, `FALSE`, "`xy`"
#' @export
#' @examples \dontrun{
#' library(ggplot2)
#' library(dplyr)
#'
#' # seminal scatterplot
#' ggplot(mtcars, aes(mpg, wt)) +
#'   geom_point() +
#'   labs(x="Fuel efficiency (mpg)", y="Weight (tons)",
#'        title="Seminal ggplot2 scatterplot example",
#'        subtitle="A plot that is only useful for demonstration purposes",
#'        caption="Brought to you by the letter 'g'") +
#'   theme_ewen_ws()
#'
#' # seminal bar chart
#'
#' update_geom_font_defaults()
#'
#' count(mpg, class) %>%
#'   ggplot(aes(class, n)) +
#'   geom_col() +
#'   geom_text(aes(label=n), nudge_y=3) +
#'   labs(x="Fuel efficiency (mpg)", y="Weight (tons)",
#'        title="Seminal ggplot2 bar chart example",
#'        subtitle="A plot that is only useful for demonstration purposes",
#'        caption="Brought to you by the letter 'g'") +
#'   theme_ewen_ws() +
#'   theme(axis.text.y=element_blank()) +
#'   scale_y_continuous(expand=c(0, 0))
#' }
theme_ewen_ws <- function(base_family="Work Sans", base_size = 11.5,
                       plot_title_family=if (.Platform$OS.type == "windows") "Work Sans" else "Work Sans Bold",
                       plot_title_size = 18,
                       plot_title_face="bold", plot_title_margin = 10,
                       subtitle_family=if (.Platform$OS.type == "windows") "Work Sans" else "Work Sans Light",
                       subtitle_size = 12,
                       subtitle_face = "plain", subtitle_margin = 15,
                       strip_text_family = base_family, strip_text_size = 12,
                       strip_text_face = "plain",
                       caption_family = if (.Platform$OS.type == "windows") "Work Sans" else "Work Sans Light",
                       caption_size = 10,
                       caption_face = "plain", caption_margin = 15,
                       axis_text_size = base_size,
                       axis_title_family = subtitle_family,
                       axis_title_size = base_size,
                       axis_title_face = "plain", axis_title_just = "rt",
                       plot_margin = margin(10, 10, 10, 10),
                       grid_col = "#cccccc", grid = "Y",
                       axis_col = "#2b2b2b", axis = "x"
) {

  ret <- ggplot2::theme_minimal(base_family=base_family, base_size=base_size)

  ret <- ret + theme(legend.background=element_blank())
  ret <- ret + theme(legend.key=element_blank())

  if (inherits(grid, "character") | grid == TRUE) {

    ret <- ret + theme(panel.grid=element_line(color=grid_col, size=0.2))
    ret <- ret + theme(panel.grid.major=element_line(color=grid_col, size=0.2))
    ret <- ret + theme(panel.grid.minor=element_line(color=grid_col, size=0.15))

    if (inherits(grid, "character")) {
      if (regexpr("X", grid)[1] < 0) ret <- ret + theme(panel.grid.major.x=element_blank())
      if (regexpr("Y", grid)[1] < 0) ret <- ret + theme(panel.grid.major.y=element_blank())
      if (regexpr("x", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.x=element_blank())
      if (regexpr("y", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.y=element_blank())
    }

  } else {
    ret <- ret + theme(panel.grid=element_blank())
  }

  if (inherits(axis, "character") | axis == TRUE) {
    ret <- ret + theme(axis.line=element_line(color="#2b2b2b", size=0.5))
    if (inherits(axis, "character")) {
      axis <- tolower(axis)
      if (regexpr("x", axis)[1] < 0) {
        ret <- ret + theme(axis.line.x=element_blank())
      } else {
        ret <- ret + theme(axis.line.x=element_line(color=axis_col, size=0.5))
      }
      if (regexpr("y", axis)[1] < 0) {
        ret <- ret + theme(axis.line.y=element_blank())
      } else {
        ret <- ret + theme(axis.line.y=element_line(color=axis_col, size=0.5))
      }
    } else {
      ret <- ret + theme(axis.line.x=element_line(color=axis_col, size=0.5))
      ret <- ret + theme(axis.line.y=element_line(color=axis_col, size=0.5))
    }
  } else {
    ret <- ret + theme(axis.line=element_blank())
  }

  ret <- ret + theme(axis.ticks = element_blank())
  ret <- ret + theme(axis.ticks.x = element_blank())
  ret <- ret + theme(axis.ticks.y = element_blank())

  xj <- switch(tolower(substr(axis_title_just, 1, 1)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  yj <- switch(tolower(substr(axis_title_just, 2, 2)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)

  ret <- ret + theme(axis.text.x=element_text(size=axis_text_size, margin=margin(t=0)))
  ret <- ret + theme(axis.text.y=element_text(size=axis_text_size, margin=margin(r=0)))
  ret <- ret + theme(axis.title=element_text(size=axis_title_size, family=axis_title_family))
  ret <- ret + theme(axis.title.x=element_text(hjust=xj, size=axis_title_size,
                                               family=axis_title_family, face=axis_title_face))
  ret <- ret + theme(axis.title.y=element_text(hjust=yj, size=axis_title_size,
                                               family=axis_title_family, face=axis_title_face))
  ret <- ret + theme(axis.title.y.right=element_text(hjust=yj, size=axis_title_size, angle=90,
                                                     family=axis_title_family, face=axis_title_face))
  ret <- ret + theme(strip.text=element_text(hjust=0, size=strip_text_size,
                                             face=strip_text_face, family=strip_text_family))
  ret <- ret + theme(panel.spacing=grid::unit(2, "lines"))
  ret <- ret + theme(plot.title=element_text(hjust=0, size=plot_title_size,
                                             margin=margin(b=plot_title_margin),
                                             family=plot_title_family, face=plot_title_face))
  ret <- ret + theme(plot.subtitle=element_text(hjust=0, size=subtitle_size,
                                                margin=margin(b=subtitle_margin),
                                                family=subtitle_family, face=subtitle_face))
  ret <- ret + theme(plot.caption=element_text(hjust=1, size=caption_size,
                                               margin=margin(t=caption_margin),
                                               family=caption_family, face=caption_face))
  ret <- ret + theme(plot.margin=plot_margin)

  ret

}


#' Import Work Sans font for use in charts
#'
#' There is an option `ewenthemes.loadfonts` which -- if set to `TRUE` -- will
#' call `extrafont::loadfonts()` to register non-core fonts with R PDF & PostScript
#' devices. If you are running under Windows, the package calls the same function
#' to register non-core fonts with the Windows graphics device.
#'
#' @md
#' @note This will take care of ensuring PDF/PostScript usage. The location of the
#'   font directory is displayed after the base import is complete. It is highly
#'   recommended that you install them on your system the same way you would any
#'   other font you wish to use in other programs.
#' @export
import_work_sans <- function() {

  ws_font_dir <- system.file("fonts", "work-sans", package="ewenthemes")

  suppressWarnings(suppressMessages(extrafont::font_import(ws_font_dir, prompt=FALSE)))

  message(
    sprintf(
      "You will likely need to install these fonts on your system as well.\n\nYou can find them in [%s]",
      ws_font_dir)
  )

}

#' @rdname WorkSans
#' @md
#' @title Work Sans font name R variable aliases
#' @description `font_ws` == "`Work Sans`"
#' @format length 1 character vector
#' @export
font_ws <- "Work Sans"

#' @rdname WorkSans
#' @md
#' @note `font_ws_bold` (a.k.a. "`Work Sans Bold`") is not available on
#'     Windows and will throw a warning if used in plots.
#' @description `font_tw_bold` == "`Work Sans Bold`"
#' @export
font_ws_bold <- "Work Sans Bold"

#' @rdname WorkSans
#' @md
#' @note `font_ws_light` (a.k.a. "`Work Sans Light`") is not available on
#'     Windows and will throw a warning if used in plots.
#' @description `font_ws_light` == "`Work Sans Light`"
#' @export
font_ws_light <- "Work Sans Light"

