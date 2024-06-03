
#' Create percentage calculations with one numerator and one denominator
#'
#' @param indicator indicator name
#' @param num numerator
#' @param den denominator
#' @param tool either Tableau or PowerBI
#' @param table in PowerBI the table the num/dem belongs to
#'
#' @return a tibble of all calculations
#' @export
#'
#' @examples
#'  \dontrun{
#'    create_percentage_calc(a_df)
#' }
simple_percentage_calc <- function(indicator, num, den, tool, table){

    if(tool %in% c("Tableau", "PowerBI")){

        a_calc <- dplyr::case_when(
            tool == "Tableau" ~ paste0("sum([", num, "]) / sum([", den, "])"),
            tool == "PowerBI" ~ paste0(indicator, " = DIVID('",table,"'[",num,"], '",table,"'[",den,"])"),
            .default = "wrong tool"
        )


    }
    else{
        return("Select either Tableau of PowerBI")
    }



}



