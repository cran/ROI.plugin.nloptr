\name{Example-1}
\alias{Example-1}
\title{NLP 1}

\description{
The following example solves the Rosenbrock function (\url{https://en.wikipedia.org/wiki/Rosenbrock_function}).
\deqn{minimize \ f(x) = 100 (x_2 - x_1^2)^2 + (1 - x_1)^2}
}

\examples{

library(ROI)

f <- function(x) {
    return( 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2 )
}

f.gradient <- function(x) {
    return( c( -400 * x[1] * (x[2] - x[1] * x[1]) - 2 * (1 - x[1]),
               200 * (x[2] - x[1] * x[1])) )
}

x <- OP( objective = F_objective(f, n = 2L, G = f.gradient), 
         bounds = V_bound(ld = -3, ud= 3, nobj = 2L) )

nlp <- ROI_solve(x, solver = "nloptr.lbfgs", start = c(-1.2, 1))
nlp
## Optimal solution found.
## The objective value is: 1.189412e-15
solution(nlp)
## [1] 1 1

}

