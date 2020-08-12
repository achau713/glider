


#' Get environment variables which match a regex pattern
#'
#' @param pattern A string representing the pattern to search for.
#'
#' @return A named vector of environment variables which match the pattern
#' @export
#'
#' @examples get_environment_vars(pattern = "^REDCAP")
#' get_environment_vars(pattern = "API_TOKEN")
get_environment_vars <- function(pattern){
  matched_environ_names <- grepl(pattern, names(Sys.getenv()))
  matched_environ_values <- Sys.getenv()[matched_environ_vars]
  return(matched_environ_values)
}
