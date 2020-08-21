#' Get common variables from a list of data frames
#'
#' @param dfs A list of data frames or a single data frame.
#'
#' @return A string or vector of strings containing the common variables.
#' @export
#'
#' @examples
#' child <- data.frame(child_id = 4, age = 12)
#' parent <- data.frame(parent_id = 3, age = 34)
#' get_common_var(list(child, parent))
get_common_var <- function(dfs){

  if(length(dfs) == 1 || is.data.frame(dfs)){
    stop("Only 1 data frame supplied: supply more than 1 data frame")
  }

  col_names <- lapply(dfs, names)

  key <- Reduce(function(x, y) intersect(x, y), col_names)

  if(length(key) == 0){
    print("Unable to locate common variables")
  }
  else{
    return(key)
  }
}
