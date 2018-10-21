normalized_relative_to <- function (dir, file) {
  relative_to(normalizePath(dir, winslash = "/", mustWork = FALSE),
              normalizePath(file, winslash = "/", mustWork = FALSE))
}

normalize_path <- function (path) {
  if (is.null(path))
    NULL
  else normalizePath(path, winslash = "/", mustWork = FALSE)
}