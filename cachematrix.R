## This R file provides two functions for calculating the inverse of a matrix 
## and cache it for later use. 

## This function caches the inverse of matrix "x".

makeCacheMatrix <- function(x = matrix()) {
  result <- NULL
  set <- function(y) {
    x <<- y
    result <<- NULL
  }
  get <- function() {
    x
  }
  getsolve <- function() {
    result
  }
  setsolve <- function(s) {
    result <<- s
  }
  list(set = set, get = get, getsolve = getsolve, setsolve = setsolve)
}


## This fucntion calculates the inverse of matirx "x".

cacheSolve <- function(x, ...) {
  result <- x$getsolve()
  
  ## If there is a cached value, return it here.
  
  if(!is.null(result)) {
    message("Get solve from cache")
    return(result)
  }
  
  ## If there is no cached value, calculate the inverse and save it to cache.
  
  data <- x$get()
  result <- solve(data, ...)
  x$setsolve(result)
  
  ## Return a matrix that is the inverse of "x".
  
  result
}
