library("microbenchmark")

dfCounties <- read.csv("counties.csv")
dfCounties <- dfCounties[, ]
dfCounties <- na.omit(dfCounties)

args <- commandArgs(trailingOnly = TRUE)
nProcs <- as.integer(args[1])

head(dfCounties)
mCounties <- as.matrix(dfCounties[, 1:2])


library("foreach")
library("doParallel")
cl <- makeCluster(spec = nProcs, type = "PSOCK")
registerDoParallel(cl)


mRanges <- matrix(NA, nrow = nProcs, ncol = 3)
## initial #/per worker
mRanges[, 3] <- floor(nrow(dfCounties)/nProcs)
## number short
nShort <- nrow(dfCounties) - sum(mRanges[, 3])
## adj #/per worker
mRanges[, 3] <- mRanges[, 3] +
  c(rep(1, nShort), rep(0, nProcs - nShort))
## worker end points
mRanges[, 2] <- cumsum(mRanges[, 3])
## worker start points
mRanges[, 1] <- mRanges[, 2] - mRanges[, 3] + 1

print(mRanges)

calcPWDfe <- function(mat) {
  mOut <- foreach(i = 1:nProcs,
                  .combine = rbind, .noexport = "dfCounties",
                  .export = c("mRanges", "mCounties")) %dopar% {
                    mTmp <- matrix(NA,
                                   nrow = mRanges[, 3],
                                   ncol = nrow(mat)
                    )
                    for(j in mRanges[i, 1]:mRanges[i, 2]) {
                      mTmp[i, ] <- sqrt((mat[i, 1]  - mat[, 1]) ^ 2 +
                                          (mat[i, 2]  - mat[, 2]) ^ 2
                      )
                    }
                    return(mTmp)
                  }
  return(mOut)
}


microbenchmark("parloop" = calcPWDfe(mCounties),
               times = 5
)

