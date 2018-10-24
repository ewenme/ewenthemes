
## ewenthemes: Beautiful Themes and Theme Components for ‘ggplot2’

[![Travis-CI Build
Status](https://travis-ci.org/ewenme/ewenthemes.svg?branch=master)](https://travis-ci.org/ewenme/ewenthemes)

Typography-centric themes and theme components for ggplot2. Standing on
the shoulders of [hrbrthemes](https://github.com/hrbrmstr/hrbrthemes).

The core theme, `theme_ewen`, uses Arial Narrow which should be
installed on practically any modern system. Variations on this theme use
widely available typefaces e.g. [Work
Sans](https://github.com/weiweihuanghuang/Work-Sans) by Wei Huang.

Core themes:

  - `theme_ewen`: Arial Narrow-based theme
  - `theme_ewen_ws`: Work Sans-based theme

These global variables are also made available:

  - `font_an`: a short global alias for “`Arial Narrow`”
  - `font_ws`: a short global alias for “`Work Sans`”
  - `font_ws_light`: a short global alias for “`Work Sans Light`”
  - `font_ws_extra_light`: a short global alias for “`Work Sans
    ExtraLight`”
  - `font_ws_bold`: a short global alias for “`Work Sans Bold`”

### Installation

``` r
devtools::install_github("ewenme/ewenthemes")
```

### Usage

``` r
library(ewenthemes)
library(ggplot2)

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
  # apply theme
  theme_ewen()
```

<img src="README_figs/README-unnamed-chunk-5-1.png" width="672" />

### Work Sans theme

``` r
ggplot(mtcars, aes(mpg, wt)) +
  geom_point() +
  labs(x="Fuel efficiency (mpg)", y="Weight (tons)",
       title="Seminal ggplot2 scatterplot example",
       subtitle="A plot that is only useful for demonstration purposes",
       caption="Brought to you by the letter 'g'") + 
  # apply theme
  theme_ewen_ws()
```

<img src="README_figs/README-unnamed-chunk-6-1.png" width="672" />

### Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
