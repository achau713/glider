#' Join a list of data frame
#'
#' A wrapper to Reduce and merge in base R. Generalize to handle a list of data frames.
#' Currently, there is an assumption that the name of the key column is the same for all data frames in the list
#'
#' @param dfs A list of data frames.
#' @param key A character vector to specify which column(s) to use as join key(s).
#' @param join_type A string that specifies the join type. The options are:
#' inner, left, right, outer
#'
#' @return A single data frame after joining each individual data frame in dfs.
#' @export
#'
#' @examples
#' join_multiple_data_frame(list(df1, df2, df3), key = "sale_id", join_type = "inner")
join_multiple_data_frame <- function(dfs, key, join_type){


  if(join_type == "inner"){
    return(Reduce(function(x, y) merge(x, y, by = key, all = FALSE), dfs))
  }
  if(join_type == "left"){
    return(Reduce(function(x, y) merge(x, y, by = key, all.x = TRUE), dfs))
  }
  if(join_type == "right"){
    return(Reduce(function(x, y) merge(x, y, by = key, all.y = TRUE), dfs))
  }
  if(join_type == "outer"){
    return(Reduce(function(x, y) merge(x, y, by = key, all = TRUE), dfs))
  }

}
