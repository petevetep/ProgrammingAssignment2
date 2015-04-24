## These functions allow to save CPU time on the second 
## and the following requests to calculate inverted matrix
## for the same original matrix
##
## No magic here. Just using two environment variables:
## cached_matrix     for the original matrix
## and 
## inverted_matrix   for saving inverted matrix value


## makeCacheMatrix function just saves the original matrix
## and initializes the cache 

makeCacheMatrix <- function(x = matrix()) {

  inverted_matrix <<- NULL
  original_matrix <<- x
  return (x)
}


## cachSolve function either computes an inverted matrix
## or just returns it from the cache
##

cacheSolve <- function(x, ...) {
        ## Just solve a matrix that is not assumed to be cached
  if (!identical(x, original_matrix) ) {
    return(solve(x))
  } else {   
    ## Check whether cache is still empty
    if ( is.null(inverted_matrix) ) {
      inverted_matrix <<- solve(x)
    }
     ## Return the value from cache
    return(inverted_matrix) 
  }
}
