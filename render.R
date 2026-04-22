.libPaths(c("r-lib", .libPaths()))

if (!dir.exists("docs")) {
  dir.create("docs", recursive = TRUE)
}

if (Sys.which("pandoc") == "") {
  rstudio_pandoc <- "C:/Program Files/RStudio/resources/app/bin/quarto/bin/tools"
  if (dir.exists(rstudio_pandoc)) {
    Sys.setenv(RSTUDIO_PANDOC = rstudio_pandoc)
  }
}

rmarkdown::render(
  input = "presentation.Rmd",
  output_file = "index.html",
  output_dir = "docs",
  quiet = TRUE,
  envir = new.env(parent = globalenv())
)

message("Rendered presentation to docs/index.html")
