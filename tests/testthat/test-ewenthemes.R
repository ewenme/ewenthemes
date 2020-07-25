context("core theme components work")
test_that("we can do something", {

  th <- theme_ewen(grid="XY", axis="xy")
  expect_that(th$plot.title$family, equals("Arial Narrow"))

  thrc <- theme_ewen_ws(grid="XY", axis="xy")
  expect_that(thrc$plot.title$family, equals("Work Sans"))

  invisible(theme_ewen(grid=FALSE))
  invisible(theme_ewen_ws(grid=FALSE))
  invisible(theme_ewen(grid="XY"))
  invisible(theme_ewen_ws(grid="XY"))
  invisible(theme_ewen(grid="xy"))
  invisible(theme_ewen_ws(grid="xy"))

  invisible(theme_ewen(axis=TRUE))
  invisible(theme_ewen_ws(axis=TRUE))

  invisible(theme_ewen(axis=FALSE))
  invisible(theme_ewen_ws(axis=FALSE))
  invisible(theme_ewen(axis="xy"))
  invisible(theme_ewen_ws(axis="xy"))
  invisible(theme_ewen(axis=""))
  invisible(theme_ewen_ws(axis=""))

  testthat::skip_on_cran()
  invisible(import_work_sans())

})
