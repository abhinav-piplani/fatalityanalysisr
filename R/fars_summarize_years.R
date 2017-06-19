#' Summarize Observations by Year
#'
#' \code{fars_summarize_years} will read in multiple Fatality Analysis Reporting
#'   System data files based on the years provided and summarise the number of
#'   observations by month and year.
#'
#' @param years The years relating to the file names to be read in
#'
#' @return \code{fars_summarize_years} will return a wide-formatted data frame.
#'
#' @seealso \code{\link{fars_read_years}} to understand how the file name is created
#'
#' @examples
#' fars_summarize_years(2015:2016)
#'
#' @importFrom dplyr bind_rows
#' @importFrom dplyr group_by
#' @importFrom dplyr summarize
#' @importFrom tidyr spread
#'
#' @export

fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(year, MONTH) %>%
    dplyr::summarize(n = n()) %>%
    tidyr::spread(year, n)
}
