#' Path to current file
#'
#' This function will return the path to the current file it
#' is called from. Will work either script is run from Rscript
#' or is sourced. Why the F* is this so hard in R
#' @export
#' thisFile

thisFile <- function() {
        cmdArgs <- commandArgs(trailingOnly = FALSE)
        needle <- "--file="
        match <- grep(needle, cmdArgs)
        if (length(match) > 0) {
                # Rscript
                return(normalizePath(sub(needle, "", cmdArgs[match])))
        } else {
                # 'source'd via R console
                return(normalizePath(sys.frames()[[1]]$ofile))
        }
}
