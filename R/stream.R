
como_stream <- function(secs, file_name = NULL) {
  if (is.null(file_name)) {
    file_name <- tempfile(fileext = ".json")
    message("Writing to the following file:\n", file_name)
  }
  tmps <- tempfile(fileext = ".R")
  s <- paste0('como_box_coords <- c(-92.492852, 38.771074, -92.144189, 39.076634)\n',
  'rtweet::stream_tweets(como_box_coords, verbose = FALSE, timeout = ',
    tfse::psub('{secs}, file_name = "{file_name}", parse = FALSE)',
      secs = secs, file_name = file_name))
  writeLines(s, tmps)
  system(paste0("Rscript ", tmps, " &"))
  invisible(file_name)
}

como_search <- function() {
  mu_mid_coords <- c(38.941649, -92.327442)
  mu_search <- paste0(paste(mu_mid_coords, collapse = ","), ",2km")
  rtweet::search_tweets(geocode = mu_search, n = 1000)
}
