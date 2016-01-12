
function lsf = poly2lsf(a)
// lsf = poly2lsf(a) returns a vector, lsf, of line spectral frequencies from a vector, a, of prediction filter coefficients.
// please load the deconv.sci with this function
a = a(:);
if ~isreal(a),
error('Line spectral frequencies are not defined for complex polynomials.');
end

//Normalize the polynomial if a(1) is not unity

if a(1) ~= 1.0,
a = a./a(1);
end

if (max(abs(roots(a))) >= 1.0),
error('The polynomial must have all roots inside of the unit circle.');
end

//Form the sum and differnce filters

p = length(a)-1; // The leading one in the polynomial is not used
a1 = [a;0];
a2 = a1(length(a1):-1:1);
P1 = a1-a2; // Difference filter
Q1 = a1+a2; // Sum Filter

//If order is even, remove the known root at z = 1 for P1 and z = -1 for Q1
//If odd, remove both the roots from P1

if (modulo(p,2)), // Odd order
P = deconv(P1,[1 0 -1]);
Q = Q1;
else // Even order
P = deconv(P1,[1 -1]);
Q = deconv(Q1,[1 1]);
end

rP = roots(P);
rQ = roots(Q);

aP = atan(imag(rP(1:2:length(rP))),real(rP(1:2:length(rP))));
aQ = atan(imag(rQ(1:2:length(rQ))),real(rQ(1:2:length(rQ))));

lsf = gsort([aP;aQ],"g","i");
