#' Read in Fatality Analysis Reporting System data files
#'
#' \code{fars_read_years} will read in multiple Fatality Analysis Reporting
#'   System data files based on the years provided.
#'
#' @param years The years relating to the file names to be read in
#'
#' @return \code{fars_read_years} will search for the file names based on the
#'   years provided. For example, if 2016:2017 is provided \code{fars_read_years}
#'   will search for the following files:
#'   \itemize{
#'     \item "accident_2016.csv.bz2"
#'     \item "accident_2017.csv.bz2"
#'   }
#'   If the files exist a list containing the respective data will be returned.
#'   If the files do not exist an error will be returned stating the invalid year(s).
#'
#' @seealso \code{\link{make_filename}} for naming convention
#'
#' @examples
#' fars_read_years(2015:2016)
#'
#' @importFrom dplyr mutate
#' @importFrom dplyr select
#'
#' @export

fars_read_years <- function(years) {
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate(dat, year = year) %>%
        dplyr::select(MONTH, year)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}
