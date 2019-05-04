7.3.2
clear all
clc
syms n z
xn = 2*dirac(n)+5*dirac(n-1)-12*dirac(n-2)+3*dirac(n-4)+21*dirac(n-5)-2*dirac(n-6); %input signal
Hz = 3+6*(z^-1)+10*(z^-2)+11*(z^-3)+10*(z^-4)+6*(z^-5)+3*(z^-6); %filter
xz = ztrans(xn,n,z); %transforming input signal to z domain
xz = subs(xz,ztrans(dirac(n),n,z),1); %substuting 'ztrans(dirac(n),n,z' with 1
yz1 = Hz*Hz*xz; %Hz*Hz to find series connected filter
yz1 = expand(yz1);
yz1
yz2 = (Hz+Hz)*xz; %Hz+Hz to find parallel connected filter
yz2 = expand(yz2);
yz2