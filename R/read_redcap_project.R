#' Read in data from Redcap project via Redcap API
#'
#' @param uri A link to redcap server
#' @param token A string granting access to a REDCAP project via the REDCAP API
#' @param fields A string or a vector of strings. Indicates desired fields to query from REDCAP project.
#' @param forms A string or a vector of strings. Indicates desired forms to query from REDCAP project.
#' @param raw_or_label A string representing whether to include raw or labelled variable values. Two options: "raw" or "label"
#    Raw variable values are usually numerically encoded. Labelled variable values are usually textually encoded.
#' @param raw_or_label_headers A string representing whether to include raw or labelled variable names. Two options: "raw" or "label".
#    Raw variable names are intended for programming. Labelled variable names are best for creating a data dictionary.
#' @param list_tokens A list of tokens granting accessing to multiple REDCAP projects via the REDCAP API
#'
#' @return A data frame containing Redcap project data
#' @export
#'
#' @examples ReadProjects(token = MRABToken, raw_or_label = "label", raw_or_label_tokens = "label")
#' pregnancy_data <- map(PregnancyTokens, ~ReadProjects(token = .x, list_tokens = PregnancyTokens))
#' infant_data <- map(InfantTokens, ~ReadProjects(token = .x, list_tokens = InfantTokens))

read_redcap_project <- function(uri = "https://ci-redcap.hs.uci.edu/api/",
                                token,
                                fields = NULL,
                                forms = NULL,
                                raw_or_label = "raw",
                                raw_or_label_headers = "raw",
                                list_tokens = NULL) {


  # Exception Handling:
  # If API request successful, then no issue.
  # If API request unsuccessful, print error message but continue running the function (when using map function)
  output <- tryCatch({
    print(
      paste(
        names(Sys.getenv())[Sys.getenv() == token],
        "Project requested at:",
        Sys.time()
      )
    )
    # Read data
    REDCAPR::redcap_read_oneshot(
      redcap_uri = uri,
      token = token,
      fields = fields,
      forms = forms,
      raw_or_label = raw_or_label,
      raw_or_label_headers = raw_or_label_headers
    )$data
  },

  error = function(e){
    print(paste("There is an error: ", e))
    # Print the name of the redcap project associated with the errors
    print(
      paste(
        "Unable to load dataset from:",
        names(list_tokens)[list_tokens == token]
      )
    )
  })
  return(output)
}
