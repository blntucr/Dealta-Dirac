
clear all
clc
syms n z
xn = 2*dirac(n)+5*dirac(n-1)-12*dirac(n-2)+3*dirac(n-4)+21*dirac(n-5)-2*dirac(n-6); %input signal
Hz = 3+6*(z^-1)+10*(z^-2)+11*(z^-3)+10*(z^-4)+6*(z^-5)+3*(z^-6); %filter
xz = ztrans(xn,n,z); %transforming input signal to z domain
xz = subs(xz,ztrans(dirac(n),n,z),1); %substuting 'ztrans(dirac(n),n,z' with 1
yz = Hz*xz;
yz = expand(yz);
yz
Hn = iztrans(Hz,z,n); %transforming Hz to discrete domain n
Hncoeff = subs(Hn,n,0:6); %substuting n with [0:6] to get coefficients
xzn = iztrans(xz); %transforming xz to discrete domain n
xzncoeff = subs(xzn,n,0:6); %finding coefficient vector of xzn
yn = conv(double(Hncoeff),double(xzncoeff)); %finding the result of convolution
