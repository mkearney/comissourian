
run_stream <- function(secs, file_name = NULL) {
  if (is.null(file_name)) {
    file_name <- tempfile(fileext = ".json")
    message("Writing to the following file:\n", file_name)
  }
  tmps <- tempfile(fileext = ".R")
  #'como_box_coords <- c(-92.6, 38.7, -92.05, 40.0)\n'
  s <- paste0('como_box_coords <- c(-92.7, 38.6, -91.9, 40.1)\n',
  'rtweet::stream_tweets(como_box_coords, verbose = FALSE, timeout = ',
    tfse::psub('{secs}, file_name = "{file_name}", parse = FALSE)',
      secs = secs, file_name = file_name))
  writeLines(s, tmps)
  system(paste0("Rscript ", tmps, " &"))
  invisible(file_name)
}








como_mid_coords <- c(38.949228, -92.341214)
como_box_coords <- c(-92.492852, 38.771074, -92.144189, 39.076634)
mu_mid_coords <- c(38.941649, -92.327442)

cm3 <- rtweet::stream_tweets(como_box_coords)
cm3$text

cm1 <- rtweet::search_tweets(
  geocode = paste0(paste(como_mid_coords, collapse = ","), ",20mi"))
}
mu_campus <- rtweet::search_tweets(
  geocode = paste0(paste(mu_mid_coords, collapse = ","), ",2km"))

cm1 <- rtweet::lat_lng(cm1)
