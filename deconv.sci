function q=deconv(b,a)
// this code is taken from matlab with the modifications suited for scilab.
if a(1)==0
    error(message('MATLAB:deconv:ZeroCoef1'))
end
[mb,nb] = size(b);
nb = max(mb,nb);
na = length(a);
if na > nb
   q = zeros(superiorfloat(b,a));
   r = cast(b,class(q));
else
   // Deconvolution and polynomial division are the same operations
   // as a digital filter's impulse response B(z)/A(z):
   [q,zf] = filter(b, a, [1 zeros(1,nb-na)]);
   if mb ~= 1
      q = q(:);
   end
  // if nargout > 1
    //  r = zeros(size(b),class(q));
      //lq = length(q);
      //r(lq+1:end) = a(1)*zf(1:nb-lq);
  // end
end
