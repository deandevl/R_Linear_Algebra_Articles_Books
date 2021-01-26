
library(matlib)

?matlib
?solve
# Gaussian Eliminatoin
?rowadd
?rowmult
?rowswap

A <- matrix(c(2, 2, 3,  3, 5, 9,  5, 6, 7), ncol = 3, byrow = T)
# find the inverse of A via solve():
# note: solve() takes two parameters - A the coefficients of the equations; and B the vector of the right hand side of the equations
# if B is missing then solve() returns the inverse of A
A_inv_solve <- base::solve(A)
# check inverse
A_iden_solve <- A %*% A_inv_solve

# find the inverse of A via gaussianElimination() of matlib:
B <- diag(c(1,1,1))
A_inv_gauss_matlib <- matlib::gaussianElimination(A, B)
A_inv_gauss_matlib <- A_inv_gauss_matlib[,4:6]
# check inverse
A_iden_gauss_matlib <- A %*% A_inv_gauss_matlib

# find the inverse of A via Gaussian Elimination and matlib
# via row operations convert A to reduced row-echelon form
(A_inv_gauss <- cbind(A, diag(c(1,1,1))))
(A_inv_gauss <- matlib::rowmult(A_inv_gauss, 1, 1/2))
(A_inv_gauss <- matlib::rowadd(A_inv_gauss, 1, 2, -3))
(A_inv_gauss <- matlib::rowadd(A_inv_gauss, 1, 3, -5))
(A_inv_gauss <- matlib::rowmult(A_inv_gauss, 2, 1/2))
(A_inv_gauss <- matlib::rowadd(A_inv_gauss, 2, 1, -1))
(A_inv_gauss <- matlib::rowadd(A_inv_gauss, 2, 3, -1))
(A_inv_gauss <- matlib::rowmult(A_inv_gauss, 3, -1/2.75))
(A_inv_gauss <- matlib::rowadd(A_inv_gauss, 3, 1, 0.75))
(A_inv_gauss <- matlib::rowadd(A_inv_gauss, 3, 2, -2.25))
(A_inv_gauss <- A_inv_gauss[,4:6])
(A_iden_gauss <- A %*% A_inv_gauss)
