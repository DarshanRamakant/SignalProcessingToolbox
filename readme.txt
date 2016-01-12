1.a = rc2poly(k)
a = rc2poly(k) converts the reflection coefficients k corresponding to the lattice structure 
to the prediction filter polynomial a, with a(1) = 1. The output a is row vector of length length(k) + 1.

example:
k = [0.3090 0.9800 0.0031 0.0082 -0.0082];

a = rc2poly(k)
a =

    1.0000    0.6148    0.9899    0.0000    0.0032   -0.0082




2.lsf = poly2lsf(a)

lsf = poly2lsf(a) returns a vector, lsf, of line spectral frequencies from a vector, a, of prediction filter coefficients.

Example:
a = [1.0000  0.6149  0.9899  0.0000  0.0031 -0.0082];
lsf = poly2lsf(a)

lsf =

    0.7842
    1.5605
    1.8776
    1.8984
    2.3593
