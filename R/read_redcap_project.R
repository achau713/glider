#' Read in data from Redcap project via Redcap API
#'
#' @param uri A link to a Redcap server.
#' @param token_name Name of the environment variable that stores the API key which grants access to a REDCAP project.
#' @param fields A string or a vector of strings. Indicates desired fields to query from REDCAP project.
#' @param forms A string or a vector of strings. Indicates desired forms to query from REDCAP project.
#' @param raw_or_label A string representing whether to include raw or labelled variable values. Two options: "raw" or "label"
#    Raw variable values are usually numerically encoded. Labelled variable values are usually textually encoded.
#' @param raw_or_label_headers A string representing whether to include raw or labelled variable names. Two options: "raw" or "label".
#    Raw variable names are intended for programming. Labelled variable names are best for creating a data dictionary.
#'
#' @return A data frame containing Redcap project data
#' @export
#'
#' @examples read_redcap_project(uri = "path/to/Redcap/API/Server", token_name = "NAME_OF_token_name_IN_RENVIRON", raw_or_label = "label", raw_or_label_token_names = "label")
#' lapply(get_environment_vars("^REDCAP") read_redcap_project(uri = "path/to/Redcap/API/Server", token_name = .x))

read_redcap_project <- function(uri,
                                token_name,
                                fields = NULL,
                                forms = NULL,
                                raw_or_label = "raw",
                                raw_or_label_headers = "raw") {

  api_token <- Sys.getenv(token_name)

  output <- tryCatch({
    print(
      paste(
        token_name,
        "project requested at:",
        Sys.time()
      )
    )
    REDCapR::redcap_read(
      redcap_uri = uri,
      token = api_token,
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
        token_name
      )
    )
  })
  return(output)
}
