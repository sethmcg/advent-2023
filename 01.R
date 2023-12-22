library(stringi)

### BAD SOLUTION: The right calibration values for string "eighthree"
### is 83 and for "sevenine" is 79.  The examples do not cover such
### cases.

####  part 2: same as part 1 (below), but some digits spelled out

#input2 <- readLines("test2.01.txt")
input2 <- readLines("input.01.txt")

nnums <- 1:9
snums <- c("one","two","three","four","five", "six","seven","eight","nine")

## have to apply subs from left to right within string...
unspell <- function(x){
    firsts <- stri_locate_first_fixed(x, snums)[,1]
    if(any(!is.na(firsts))){
        i <- which.min(firsts)
        x <- sub(snums[i], nnums[i], x) |> unspell()
    }
    return(x)
}

input <- sapply(input2, unspell)

## part 1: extract first and last digits, concat to 2-digit number & sum

#input <- readLines("test.01.txt")
#input <- readLines("input.01.txt")

digits <- gsub("[a-zA-Z]","", input)
first <- substr(digits, start=1,stop=1)
last <-  substr(stri_reverse(digits), start=1,stop=1)

paste0(first, last) |> as.numeric() |> sum() |> print()

