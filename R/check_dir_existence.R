

#' Check for existence of a directory.
#'
#' Highly recommend to use R Studio projects so paths are relative to the current working directory.
#' Wrapper to dir.exists
#'
#' @param ... Strings of the names within a single path
#'
#' @return Boolean that indicates if directory exists, A message displays the path to the directory.
#' If path does not exist, an error message is displayed.
#'
#' @examples
#' check_dir_existence("data", "raw")
#' check_dir_existence("data", "processed")
#' check_dir_existence("docs")
check_dir_existence <- function(...){

  # create path from character vectors
  path <- file.path(...)

  # check for directory existence
  if(!dir.exists(path)){
    stop("Can't find directory: ", path)
  }

  # print path to directory
  print(paste0("./", path, " exists!"))
  return(TRUE)

}


