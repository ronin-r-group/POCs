


# 
mockConnection <- function(x) {
  return(structure(
    list(
      "df" = read.csv(file = x, stringsAsFactors = F)
    ),
    class = "mockConnection"
  ))
}

setMethod(f = dbGetQuery, signature = "mockConnection", definition = function(conn, statement) {
  tmp_env <- new.env()
  tmp_env$df <- conn$df
  from_orig <- strsplit(
    strsplit(statement, split = "[Ff][Rr][Oo][Mm]")[[1]][2],
    " ")[[1]][2]
  new_statement <- gsub(pattern = from_orig, replacement = "df", x = statement, fixed = T)
  tmp <- sqldf(x = new_statement, stringsAsFactors = F, envir = tmp_env)
  return(tmp)
})