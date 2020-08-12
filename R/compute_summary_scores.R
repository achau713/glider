#' Compute sum and average scores
#'
#' @param dataset a data frame
#' @param var_prefix a string forming the variable name pattern
#' @param indices a vector of numeric indices. Indicates questions relevant to a subscale
#' @param subscale_name name of the subscale (ie: tangible)
#' @param average_score boolean. if true, compute the average score. otherwise, compute the sum of individual scores
#'
#' @return a data frame with new column of subscale scores. The new column name is concatanation of subscale_name and "_score"
#'
#' @examples computeSummaryScore(pedimet, var_prefix = "ped_support_often_", indices = c(1, 3, 4, 5, 15, 14, 13), subscale_name = "positive")

compute_summary_scores <- function(dataset,
                                   var_prefix,
                                   indices,
                                   subscale_name,
                                   average_score = TRUE) {


  # Create custom name for Subscale score
  # as_label transforms a quoted expression to a column name (string). quosure -> string
  # enquo quotes the argument
  subscale_name <- as_label(enquo(subscale_name))

  # Append with informative suffix
  subscale_name <- paste0(subscale_name, "_score")

  # create regex to search for relevant variables
  regex <- paste0(var_prefix, indices, "$|", collapse = "") %>%
    # remove additional | at the end of the regex string
    stringr::str_replace(., pattern = "\\|$", replacement = "")

  # subset data by regex
  subscale_data <- dataset %>%
    dplyr::select(., matches(regex)) %>%
    # convert factors to numeric
    dplyr::mutate_all(factorToNumeric)


  # compute average score
  if (average_score){
    subscale_score_column <-
      subscale_data %>%
      dplyr::mutate(!!subscale_name := rowMeans(., na.rm = TRUE))

    # compute sum
  } else{
    subscale_score_column <-
      subscale_data %>%
      dplyr::mutate(!!subscale_name := rowSums(., na.rm = TRUE))
  }

  subscale_score_column <-
    subscale_score_column %>%
    dplyr::select(all_of(subscale_name))

  # bind back to original dataset
  dataset <- cbind(dataset, subscale_score_column)

  return(dataset)

}
