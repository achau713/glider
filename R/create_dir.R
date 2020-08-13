
#' Create a directory.
#'
#' Highly recommend to use R Studio projects so paths are relative to the current working directory.
#' Wrapper to dir.create.
#'
#' @param ... Strings of the names within a single path
#'
#' @return Create a new directory at the specified path
#' @export
#'
#' @examples
#' create_dir("data", "raw")
#' create_dir("data", "processed")
create_dir <- function(...){

  # create path from character vectors
  path <- file.path(...)

  # create directory
  dir.create(file.path(path))

  # print directory path that has been created
  print(paste0("A new directory has been created at", "./", path))

}
