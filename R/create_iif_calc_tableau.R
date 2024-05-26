#' create a basic IIF calculation in Tableau.
#'
#' @param calc_name name for the calculation.  This should be the same as
#' @param value_col column used as a value
#' @param names_col column used as a name (e.g.  indicator or disaggregate)
#'
#' @return calculations
#' @export
#'
#' @examples
#'  \dontrun{
#'    create_calc_template(csv_file)
#' }

create_simple_indicator_val_twb <- function(calc_name, names_col, value_col){

    a_twb_cal <- paste0("IIF(", names_col, " = ", calc_name, ", ", value_col, ", null)")

    return(a_twb_cal)
}

