cat(
  "This is a test. The time is ", 
  as.character(Sys.time()), 
  " and the working directory is ", 
  getwd(), 
  file = paste0(
    "~/repos/hoffman2-demo/output/test_output_",
    gsub(pattern = "-| | [:]", replacement = "_", x = as.character(Sys.time())), ".txt"
  )
)
