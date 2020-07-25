#' [ggplot2] theme supporting the \href{https://ewen.io/}{ewen.io} site, based on
#' `theme_ipsum` from \href{https://github.com/hrbrmstr/hrbrthemes}{hrbrthemes}.
#'
#' You should [import_recursive]() first and also install the fonts on your
#' system before trying to use this theme.
#'
#' There is an option `ewenthemes.loadfonts` which -- if set to `TRUE` -- will
#' call `extrafont::loadfonts()` to register non-core fonts with R PDF & PostScript
#' devices. If you are running under Windows, the package calls the same function
#' to register non-core fonts with the Windows graphics device.
#'
#' @inheritParams theme_ewen
#'
#' @export
#'
#' @examples \dontrun{
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(mpg, wt)) +
#'   geom_point() +
#'   labs(x="Fuel efficiency (mpg)", y="Weight (tons)",
#'        title="Seminal ggplot2 scatterplot example",
#'        subtitle="A plot that is only useful for demonstration purposes",
#'        caption="Brought to you by the letter 'g'") +
#'   theme_ewen_rs()
#' }

theme_ewen_rs <- function(
  base_family = "Recursive Regular", base_colour = "#111111", base_size = 14,
  base_margin = 10, base_face = "plain",
  plot_title_family = "Recursive Black", plot_title_size = 24,
  plot_title_face = "plain", plot_title_margin = 10,
  subtitle_family = base_family, subtitle_size = base_size,
  subtitle_face = base_face, subtitle_margin = base_margin,
  axis_text_family = base_family, axis_text_size = base_size,
  axis_title_family = base_family, axis_title_size = base_size,
  axis_title_face = base_face, axis_title_margin = base_margin,
  axis_title_just = "rt",
  caption_family = "Recursive Light", caption_size = base_size,
  caption_face = base_face, caption_margin = base_margin,
  strip_text_family = base_family, strip_text_size = base_size,
  strip_text_face = base_face,
  plot_margin = c(10, 10, 10, 10),
  grid_col = "#cccccc", grid = "Y",
  axis_col = "#9B9B9B", axis = "x"
  ) {

  theme_ewen(
    base_family = base_family, base_colour = base_colour, base_size = base_size,
    base_margin = base_margin, base_face = base_face,
    plot_title_family = plot_title_family, plot_title_size = plot_title_size,
    plot_title_face = plot_title_face, plot_title_margin = plot_title_margin,
    subtitle_family = subtitle_family, subtitle_size = subtitle_size,
    subtitle_face = subtitle_face, subtitle_margin = subtitle_margin,
    axis_text_family = axis_text_family, axis_text_size = axis_text_size,
    axis_title_family = axis_title_family, axis_title_size = axis_title_size,
    axis_title_face = axis_title_face, axis_title_margin = axis_title_margin,
    axis_title_just = axis_title_just,
    caption_family = caption_family, caption_size = caption_size,
    caption_face = caption_face, caption_margin = caption_margin,
    strip_text_family = strip_text_family, strip_text_size = strip_text_size,
    strip_text_face = strip_text_face,
    plot_margin = plot_margin,
    grid_col = grid_col, grid = grid,
    axis_col = axis_col, axis = axis
    )

}


#' Import Recursive font for use in charts
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
import_recursive <- function() {

  rec_font_dir <- system.file("fonts", "recursive", package="ewenthemes")

  suppressWarnings(suppressMessages(extrafont::font_import(rec_font_dir, prompt=FALSE)))

  message(
    sprintf(
      "You will likely need to install these fonts on your system as well.\n\nYou can find them in [%s]",
      rec_font_dir
      )
  )

}

#' @rdname Recursive
#' @md
#' @title Recursive font name R variable aliases
#' @description `font_rs` == "`Recursive`"
#' @format length 1 character vector
#' @export
font_rs <- "Recursive"

#' @rdname Recursive
#' @md
#' @note `font_rs_light` (a.k.a. "`Recursive Light`") is not available on
#'     Windows and will throw a warning if used in plots.
#' @description `font_ws_light` == "`Recursive Light`"
#' @export
font_rs_light <- "Recursive Light"

#' @rdname Recursive
#' @md
#' @note `font_rs_extra_light` (a.k.a. "`Recursive ExtraLight`") is not available on
#'     Windows and will throw a warning if used in plots.
#' @description `font_ws_extra_light` == "`Recursive ExtraLight`"
#' @export
font_rs_extra_light <- "Recursive ExtraLight"

