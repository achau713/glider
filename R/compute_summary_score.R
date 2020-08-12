#' Compute sum and average scores
#'
#' @param df A data frame
#' @param var_affix A string forming the variable name pattern. Specifies which columns to use to compute a score
#' @param score_name The name of the score variable
#' @param average_score Boolean. If true, compute the average score. Otherwise, compute the sum score.
#'
#' @return A data frame with new column of subscale scores. The new column name is concatanation of score_name and "_score"
#' @export
#' @examples compute_summary_score(stress_questionnaire, var_affix = "physical_stress", score_name = "physical_stress_sum")

compute_summary_score <- function(df,
                                  var_affix,
                                  score_name,
                                  average_score = TRUE) {

  # Append with informative suffix
  score_name <- paste0(score_name, "_score")


  # Subset data frame by relevant columns to use in score computation
  df <- subset_column(df, var_affix)

  # compute average score
  if (average_score){
    df[[score_name]] <- rowMeans(df, na.rm = TRUE)

  # compute sum score
  } else{
    df[[score_name]] <- rowSums(df, na.rm = TRUE)

  }

  return(df)

}
