//author: Darshan Ramakant Bhat
//a = rc2poly(k) converts the reflection coefficients k corresponding to the lattice structure to the prediction filter polynomial a, with a(1) = 1. The output a is row vector of length length(k) + 1.
function a =rc2poly(k)
if ~isreal(k),
error('Line spectral frequencies are not defined for complex polynomials.');
end
    i =1;
    a = k(i);
    for i =2:length(k)
        a = [a+a(i-1:-1:1)*k(i) k(i)];
    end
    a = [1 a];
endfunction
