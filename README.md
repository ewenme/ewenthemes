
## ewenthemes: Beautiful Themes and Theme Components for ‘ggplot2’

[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active)
[![Travis-CI Build
Status](https://travis-ci.org/ewenme/ewenthemes.svg?branch=master)](https://travis-ci.org/ewenme/ewenthemes)

-----

This is a very focused package that provides typography-centric themes
and theme components for ggplot2. The core theme: `theme_ewen` uses
Arial Narrow which should be installed on practically any modern system,
so it’s “free”-ish.

The following functions are implemented/objects are exported:

Core themes & scales:

  - `theme_ewen`: Arial Narrow-based theme
  - `theme_ewen_ws`: Work Sans-based theme
  - `theme_ipsum_sp`: Spectral-based theme
  - `scale_color_ipsum` / `scale_fill_ipsum` / `ipsum_pal`: A muted
    discrete color palette with 9 colors

Utilities:

  - `update_geom_font_defaults`: Update font defaults for text geoms
    (the default is — unsurprisingly — Arial Narrow)

The following global variables are now in your namespace:

  - `font_an`: a short global alias for “`Arial Narrow`”
  - `font_ws`: a short global alias for “`Work Sans`”
  - `font_ws_light`: a short global alias for “`Work Sans Light`”
  - `font_ws_bold`: a short global alias for “`Work Sans Bold`”
  - `font_sp`: a short global alias for “`Spectral`”
  - `font_sp_light`: a short global alias for “`Spectral Light`”
  - `font_sp_bold`: a short global alias for “`Spectral Bold`”

### Installation

``` r
devtools::install_github("ewenme/ewenthemes")
```

### Usage

``` r
library(ewenthemes)
library(gcookbook)
library(tidyverse)

# current verison
packageVersion("ewenthemes")
## [1] '1.0.0'
```

### Base theme (Arial Narrow)

``` r
ggplot(mtcars, aes(mpg, wt)) +
  geom_point() +
  labs(x="Fuel efficiency (mpg)", y="Weight (tons)",
       title="Seminal ggplot2 scatterplot example",
       subtitle="A plot that is only useful for demonstration purposes",
       caption="Brought to you by the letter 'g'") + 
  theme_ewen()
```

<img src="README_figs/README-unnamed-chunk-5-1.png" width="672" />

### Work Sans

``` r
ggplot(mtcars, aes(mpg, wt)) +
  geom_point() +
  labs(x="Fuel efficiency (mpg)", y="Weight (tons)",
       title="Seminal ggplot2 scatterplot example",
       subtitle="A plot that is only useful for demonstration purposes",
       caption="Brought to you by the letter 'g'") + 
  theme_ewen_ws()
```

<img src="README_figs/README-unnamed-chunk-6-1.png" width="672" />

### Spectral

``` r
ggplot(mpg, aes(displ, hwy)) +
  geom_jitter(aes(color=class, fill=class), size=3, shape=21, alpha=1/2) +
  scale_x_continuous(expand=c(0,0), limits=c(1, 8), breaks=1:8) +
  scale_y_continuous(expand=c(0,0), limits=c(10, 50)) +
  scale_color_ipsum() +
  scale_fill_ipsum() +
  facet_wrap(~class, scales="free") +
  labs(
    title="Spectral Test",
    subtitle="This is a subtitle to see the how it looks in Spectral",
    caption="Source: ewenthemes"
  ) +
  theme_ewen_sp()
```

<img src="README_figs/README-unnamed-chunk-7-1.png" width="960" />

### Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
