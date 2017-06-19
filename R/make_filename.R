#' Make filename
#' \code{make_file} creates a name for the accident csv file based on the
#'   year provided.
#'
#' @param year the year to add to the file name
#'
#' @return \code{make_file} will return a file name based on the year provided.
#'   For example, if 2017 is provided as the year the name that will be returned
#'   will be "accident_2017.csv.bz2".
#'
#' @usage data(data1)
#' data(data1)
#' @export

make_filename <- function(year) {
  year <- as.integer(year)
  sprintf("accident_%d.csv.bz2", year)
}
