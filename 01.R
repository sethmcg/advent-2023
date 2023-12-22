library(stringi)

## NOTE: in part 2, the string "eighthree" should be converted to "83"

## This corner case isn't covered in the examples, and it breaks
## approaches based on substitution.

input <- readLines("test.01.txt")
input <- readLines("test2.01.txt")
input <- readLines("input.01.txt")

#########
## part 1: find first & last digits in strings, concat & sum

finder <- function(x, mode=c("first","last"), pats=0:9){
    locs <- stri_locate(str=x, fixed=pats, mode=mode)[,"start"]
    if(mode=="first"){return(pats[which.min(locs)])}
    if(mode=="last" ){return(pats[which.max(locs)])}
}

firsts <-  sapply(input, finder, mode="first", pats=0:9)
lasts  <-  sapply(input, finder, mode="last",  pats=0:9)

paste0(firsts, lasts) |> as.numeric() |> sum() |> print()

############
####  part 2: same as part 1, but some digits spelled out

nums <- c(1:9, 0:9)
names(nums) <- c("one","two","three","four","five",
                 "six","seven","eight","nine", 0:9)

firsts <-  sapply(input, finder, mode="first", pats=names(nums))
lasts  <-  sapply(input, finder, mode="last",  pats=names(nums))

paste0(nums[firsts], nums[lasts]) |> as.numeric() |> sum() |> print()

