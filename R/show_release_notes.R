#' @name show_release_notes
#' @export

show_release_notes <- function() {
  # Read the release notes from NEWS.md
  release_notes <- readLines("NEWS.md")
  
  # Print the release notes to the console
  cat(paste(release_notes, collapse = "\n"))
}

# When the package is loaded, display the release notes
.onAttach <- function(libname, pkgname) {
  cat("Package '", pkgname, "' has been loaded.\n")
  cat("Release Notes:\n")
  show_release_notes()
}
