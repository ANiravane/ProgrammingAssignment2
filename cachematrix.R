## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(m = matrix()) {
    i <- NULL
    set <- function(mat) {
        m <<- mat
        i <<- NULL
    }
    get <- function() m
    setinv <- function(inv) i <<- inv
    getinv <- function() i
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


cacheSolve <- function(f, ...) {
    m <- f$getinv()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- f$get()
    i <- solve(data)
    f$setinv(i)
    i
}