# another dependency manager
# closer to pip or npm

# i feel packrat and checkpoint can be improved on
# what something not so tied to RStudio

# something that works seemless between dev and production



library_dir = "./library"
cran <- "http://cran.r-project.org/src/contrib/Archive/"
dependencies <- list(
  list('package'= "DBI", "version"="0.8", "source" = "CRAN")
)
# library(dplyr)
# library(tidyr)
# library(purrr)
# library(xgboost)
# library(tibble)
lapply(X = dependencies, FUN = function(x){
  if(x$source == "CRAN") {
    install.packages(
      pkgs = paste0(cran, x$package,"/",x$package,"_", x$version, ".tar.gz"), 
      lib = library_dir,
      repos = NULL)
    # if current version - won't find so try again
  } else {
    if(x$source == "Github") {
      
    } else {
      warning(paste("CANT INTALL", x$package))
    }
  }
})

# not available for this R version
# can't find

# make sure something else handles R version

# ideally each package will have dependencies install in subdirectory under them 
# BUT this isn't how R works so I'll have to table this