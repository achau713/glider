#' Compute sum and average scores
#'
#' @param df A data frame
#' @param pattern A regex string specifying which variables to compute summary scores on.
#' @param score_name The name of the score variable. Specify as string.
#' @param score_type The name of the score type. Currently supports: {average, sum}
#'
#' @return A data frame with new summary score column. The new column name is score_name
#' @export
#' @examples compute_summary_score(stress_questionnaire, score_name = "physical_stress_average", score_type = "average")

compute_summary_score <- function(df,
                                  pattern,
                                  score_name,
                                  score_type = "average") {

  if (score_type == "average"){
    df[[score_name]] <- rowMeans(subset_column(df, pattern = pattern), na.rm = TRUE)
  }

  if (score_type == "sum"){
    df[[score_name]] <- rowSums(subset_column(df, pattern = pattern), na.rm = TRUE)
  }

  return(df)

}
