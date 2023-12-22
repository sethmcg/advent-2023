library(stringi)

## part 1: extract first and last digits, concat to 2-digit number & sum

#input <- readLines("test.01.txt")
input <- readLines("input.01.txt")

digits <- gsub("[a-zA-Z]","", input)
first <- substr(digits, start=1,stop=1)
last <-  substr(stri_reverse(digits), start=1,stop=1)

paste0(first, last) |> as.numeric() |> sum() |> print()



