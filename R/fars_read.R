#' \code{fars_read} reads in the US National Highway Traffic Safety
#'   Administration's Fatality Analysis Reporting System data.
#'
#' @param filename csv file containing data
#'
#' @return \code{fars_read} will search within the specified path for the
#'   filename provided. If the file exists, it will be imported and returned as
#'   a data frame tbl.  If it does not exist an error message will be returned.
#'

#' @usage data(data1)
#' data(data1)
#' @importFrom readr read_csv
#' @importFrom dplyr tbl_df
#'
#' @export

fars_read <- function(filename) {
  if (!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}
