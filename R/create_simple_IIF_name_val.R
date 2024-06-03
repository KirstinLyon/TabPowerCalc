#' create a basic IIF calculation in either Tableau or PowerBi.
#'
#' @param calc_name name for the calculation.  This should be the same as
#' @param value_col column used as a value
#' @param names_col column used as a name (e.g.  indicator or disaggregate)
#' @param tool either Tableau or PowerBI
#'
#' @return calculations
#' @export
#'
#' @examples
#'  \dontrun{
#'    create_simple_IIF_name_val(a_df)
#' }

create_simple_IIF_name_val <- function(calc_name, names_col, value_col, tool){

    if(tool %in% c("Tableau", "PowerBI")){
        a_calc <- dplyr::case_when(
            tool == "Tableau" ~ paste0("IIF(", names_col, " = '", calc_name, "', ", value_col, ", null)"),
            tool == "PowerBI" ~ paste0(calc_name, " = CALCULATE(sum(db_dsf[", value_col, "]), filter(db_dsf, db_dsf[", names_col, "]='", calc_name, "'))"),
            .default =  "wrong tool"
        )

    }

     else{

         return("Select either Tableau of PowerBI")
     }

}
