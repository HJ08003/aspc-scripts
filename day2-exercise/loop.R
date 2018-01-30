library("microbenchmark")

dfCounties <- read.csv("counties.csv")
dfCounties <- dfCounties[, ]
dfCounties <- na.omit(dfCounties)

head(dfCounties)
mCounties <- as.matrix(dfCounties[, 1:2])

calcPWDv <- function(mat) {
  out <- matrix(data = NA,
                nrow = nrow(mat),
                ncol = nrow(mat)
  )

  for (row in 1:nrow(out)) {
    ## no loop over columns
    ## one row elem vs *all* col elems
    out[row, ] <- sqrt(((mat[row, 1] - mat[, 1]) ^ 2 +
                          ##                !^!
                          (mat[row, 2] - mat[, 2]) ^ 2
                        ##                !^!
    )
    )
  }
  return(out)
}

microbenchmark("loop" = calcPWDv(mCounties),
               times = 5
)


