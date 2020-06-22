clc,clear

B1=[-14.75,-12.90];
A1=[1,-7/8,3/32];

B2=[24.5,26.82];
A2=[1,-1,1/2];

[r1,p1,k1] = residuez(B1,A1);
[r2,p2,k2] = residuez(B2,A2);

r=[r1;r2];
p=[p1;p2];

[B,A]=residuez(r,p,[])

