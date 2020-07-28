

data.list <- function(x) UseMethod('data.list')
data.list.list <- function(x){
  return(structure(x,class = c('data.list', 'list')))
}

extract_feature <- function(x, feature) UseMethod('extract_feature')
extract_feature.data.list <- function(x, feature) {
  lapply(X = x, FUN = function(y) y[[feature]])
}

# library(jsonlite)
# tmp <- fromJSON(txt = '{
#         "data": [{
#           "launch_date": "2020-07-01",
#            "keywords": [
#            "data analytics services",
#            "data analytics consulting company",
#            "data analytics solutions",
#            "business analytics consulting"
#            ],
#            "title": "Data Analytics Services | Business Analytics Consulting",
#            "description": "Cosmic Lens Consulting specializes in data analytics services. We helped small businesses by providing cost-effective data analytics solutions. Call us now 512-920-3134."
#          }]}', simplifyVector = F)
# tmp2 <- data.list(tmp[['data']])
# extract_feature(tmp2, 'launch_date')
