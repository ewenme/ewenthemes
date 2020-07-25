#' [ggplot2] theme supporting the \href{https://ewen.io/}{ewen.io} site, based on
#' `theme_ipsum` from \href{https://github.com/hrbrmstr/hrbrthemes}{hrbrthemes}.
#'
#' @section Building upon `theme_ewen`:
#' The function is setup in such a way that you can customize your own one by just
#' wrapping the call and changing the parameters. See source for examples.
#'
#' There is an option `ewenthemes.loadfonts` which -- if set to `TRUE` -- will
#' call `extrafont::loadfonts()` to register non-core fonts with R PDF & PostScript
#' devices. If you are running under Windows, the package calls the same function
#' to register non-core fonts with the Windows graphics device.
#'
#' @param base_family,base_colour,base_size,base_margin,base_face base font family, colour, size, margin and face
#' @param plot_title_family,plot_title_face,plot_title_size,plot_title_margin plot title family, face, size and margi
#' @param subtitle_family,subtitle_face,subtitle_size plot subtitle family, face and size
#' @param subtitle_margin plot subtitle margin bottom (single numeric value)
#' @param strip_text_family,strip_text_face,strip_text_size facet label font family, face and size
#' @param caption_family,caption_face,caption_size,caption_margin plot caption family, face, size and margin
#' @param axis_title_family,axis_title_face,axis_title_size,axis_title_margin axis title font family, face, size and margin
#' @param axis_title_just axis title font justification, one of `[blmcrt]`
#' @param plot_margin plot margin (specify with [ggplot2::margin()])
#' @param grid_col,axis_col grid & axis colors; grid defaults to `#cccccc`, axes default to `#2b2b2b`
#' @param grid panel grid (`TRUE`, `FALSE`, or a combination of `X`, `x`, `Y`, `y`)
#' @param axis_text_family,axis_text_size axis text font family and size
#' @param axis add x or y axes? `TRUE`, `FALSE`, "`xy`"
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
#'   theme_ewen()
#' }

theme_ewen <- function(
  base_family = "Arial Narrow", base_colour = "#111111", base_size = 14,
  base_margin = 10, base_face = "plain",
  plot_title_family = "Arial Narrow", plot_title_size = 24,
  plot_title_face = "bold", plot_title_margin = 10,
  subtitle_family = base_family, subtitle_size = base_size,
  subtitle_face = base_face, subtitle_margin = base_margin,
  axis_text_family = base_family, axis_text_size = base_size,
  axis_title_family = base_family, axis_title_size = base_size,
  axis_title_face = base_face, axis_title_margin = base_margin,
  axis_title_just = "rt",
  caption_family = base_family, caption_size = base_size,
  caption_face = base_face, caption_margin = base_margin,
  strip_text_family = base_family, strip_text_size = base_size,
  strip_text_face = base_face,
  plot_margin = c(10, 10, 10, 10),
  grid_col = "#cccccc", grid = "Y",
  axis_col = "#9B9B9B", axis = "x"
  ) {

  ret <- theme_minimal(base_family=base_family, base_size=base_size)

  ret <- ret + theme(
    legend.background = element_blank(), legend.key = element_blank()
    )

  if (inherits(grid, "character") | grid == TRUE) {

    ret <- ret + theme(
      panel.grid = element_line(colour = grid_col, size = 0.2),
      panel.grid.major = element_line(colour = grid_col, size = 0.2),
      panel.grid.minor = element_line(colour = grid_col, size = 0.15)
      )

    if (inherits(grid, "character")) {
      if (regexpr("X", grid)[1] < 0) ret <- ret + theme(panel.grid.major.x = element_blank())
      if (regexpr("Y", grid)[1] < 0) ret <- ret + theme(panel.grid.major.y = element_blank())
      if (regexpr("x", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.x = element_blank())
      if (regexpr("y", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.y = element_blank())
    }

  } else {
    ret <- ret + theme(panel.grid=element_blank())
  }

  if (inherits(axis, "character") | axis == TRUE) {
    ret <- ret + theme(axis.line = element_line(colour = "#2b2b2b", size = 0.7))
    if (inherits(axis, "character")) {
      axis <- tolower(axis)
      if (regexpr("x", axis)[1] < 0) {
        ret <- ret + theme(axis.line.x = element_blank())
      } else {
        ret <- ret + theme(axis.line.x = element_line(colour = axis_col, size = 0.7))
      }
      if (regexpr("y", axis)[1] < 0) {
        ret <- ret + theme(axis.line.y = element_blank())
      } else {
        ret <- ret + theme(axis.line.y = element_line(colour = axis_col, size = 0.7))
      }
    } else {
      ret <- ret + theme(axis.line = element_line(colour = axis_col, size = 0.7))
    }
  } else {
    ret <- ret + theme(axis.line = element_blank())
  }

    ret <- ret + theme(
      axis.ticks = element_blank(), axis.ticks.x = element_blank(),
      axis.ticks.y = element_blank()
      )

  xj <- switch(tolower(substr(axis_title_just, 1, 1)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
  yj <- switch(tolower(substr(axis_title_just, 2, 2)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)

  ret <- ret + theme(

    plot.title = element_text(
      hjust=0, size=plot_title_size, margin=margin(b=plot_title_margin),
      family=plot_title_family, face=plot_title_face, colour = base_colour
      ),
    plot.title.position = "plot",
    plot.subtitle = element_text(
      hjust=0, size=subtitle_size, margin=margin(b=subtitle_margin),
      family=subtitle_family, face=subtitle_face, colour = base_colour
      ),

    axis.title = element_text(
      size = axis_title_size, family=axis_title_family, colour = base_colour,
      ),
    axis.title.x=element_text(
      hjust=xj, size=axis_title_size, family=axis_title_family, face=axis_title_face,
      margin = margin(t=axis_title_margin)
      ),
    axis.title.y=element_text(
      hjust=yj, size=axis_title_size, family=axis_title_family, face=axis_title_face,
      margin = margin(r=axis_title_margin)
      ),
    axis.title.y.right=element_text(
      hjust=yj, size=axis_title_size, angle=90, family=axis_title_family,
      face=axis_title_face, margin = margin(l=axis_title_margin)
      ),
    axis.text.x=element_text(
      size = axis_text_size, margin = margin(t=2.5), family = axis_text_family
      ),
    axis.text.y=element_text(
      size = axis_text_size, margin = margin(r=2.5), family = axis_text_family
      ),

    plot.caption=element_text(
      hjust=0, size=caption_size, margin=margin(t=caption_margin),
      family=caption_family, face=caption_face
      ),
    plot.caption.position = "plot",

    strip.text=element_text(
      hjust=0, size=strip_text_size, face=strip_text_face, family=strip_text_family
      ),

    panel.spacing=grid::unit(2, "lines"), plot.margin=margin(plot_margin)

    )

  ret

}

#' Update matching font defaults for text geoms
#'
#' Updates [ggplot2::geom_label] and [ggplot2::geom_text] font defaults
#'
#' @param family,face,size,color font family name, face, size and color
#' @export
update_geom_font_defaults <- function(family="Arial Narrow", face="plain", size=3.5,
                                      color = "#111111") {
  update_geom_defaults("text", list(family=family, face=face, size=size, color=color))
  update_geom_defaults("label", list(family=family, face=face, size=size, color=color))
}

#' @rdname ArialNarrow
#' @md
#' @title Arial Narrow font name R variable aliases
#' @description `font_an` == "`Arial Narrow`"
#' @format length 1 character vector
#' @export
font_an <- "Arial Narrow"
