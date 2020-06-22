%% Transform lowpass digital filters to highpass
%% 2011-11-13 by nlp
function  [bz,az] = lp2hpz(b,a,alpha)
N = length(a);   %% N >=2
bz = zeros(1,N);
az = zeros(1,N);
bb = [-alpha,-1];
aa = [1,alpha];

for i = 1:N
    x1 = 1;
    for j = 1:(N-i)
        x1 = conv(x1,aa);
    end
    x2 = 1;
    for j = 1 : (i-1)
        x2 = conv(x2,bb);
    end
    az = az + a(i)*conv(x1,x2);
    bz = bz + b(i)*conv(x1,x2);
end

bz = bz/az(1);
az = az/az(1);
