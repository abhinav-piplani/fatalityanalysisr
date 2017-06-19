#' Map State Accidents
#'
#' \code{fars_map_state} will plot the accidents on a map for a given state
#'   and year.
#'
#' @param state.num State number
#' @param years The year of concern
#'
#' @return \code{fars_map_state} will return a map plot of accidents for the given
#'   state and year. If no accidents occurred in that state for that year a
#'   notification will be provided and if an invalid state number is provided
#'   an error will be returned.
#'
#' @seealso
#' \code{\link{make_filename}} to understand how the file name is created
#' \code{\link{fars_read}} to understand how the file is read in
#'
#'
#' @importFrom dplyr filter
#' @importFrom maps map
#' @importFrom graphics points
#'
#' @export

fars_map_state <- function(state.num, year) {
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)

  if (!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter_(data, STATE == state.num)
  if (nrow(data.sub) == 0L) {
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map(
      "state",
      ylim = range(LATITUDE, na.rm = TRUE),
      xlim = range(LONGITUD, na.rm = TRUE)
    )
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}
