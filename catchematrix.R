# Repeated computations of matrix inversions can be very time-consuming.
# Catching the inverse of a matrix using functions will eliminate excessive time spent. 
# makeCacheMatrix makes a list consisting of a function to 

# Set and Get the value of the matrix
# Set and Get the inverse of the matrix



makeCacheMatrix <- function(x = matrix()) {
  k <- NULL
  set <- function(y) {
    x <<- y
    k <<- NULL
  }
  get <- function()x
  setinverse <- function(inverse) k <<- inverse
  getinverse <- function() k
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


cacheSolve <- function(x, ...) {
  k <- x$getinverse()
  if(!is.null(k)) {
    message("getting cached data.")
    return(k)
  }
  data <- x$get()
  k <- solve(data)
  x$setinverse(k)
  k
}
x = rbind(c(2, -1/4), c(-1/4, 5))
j = makeCacheMatrix(x)
  
j$get()
cacheSolve(j)

cacheSolve(j)
  

                             
