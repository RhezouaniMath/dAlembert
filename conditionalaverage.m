function [ccL, ccl, cch, ccH] = conditionalaverage(x,y)
% N is the number of observations
% NL is the number of observations below y
% Nl is the number of observations below or equal to y
% Nh is the number of observations above or equal to y
% NH is the number of observations above y
% sumL is the sum of all observations below y
% suml is the sum of all observations below or equal to y
% sumh is the sum of all observations above or equal to y
% sumH is the sum of all observations above y
% ccL is the average of all observations below y
% ccl is the average of all observations below or equal to y
% cch is the average of all observations above or equal to y
% ccH is the average of all observations above y
N=length(x);
NL = 0;
sumL=0;
Nl = 0;
suml=0;
Nh = 0;
sumh=0;
NH = 0;
sumH=0;
for i=1:N
    if x(i,1) < y
        NL=NL+1;
        Nl=Nl+1;
        sumL=sumL+x(i,1);
        suml=suml+x(i,1);
    elseif x(i,1) == y
        Nl=Nl+1;
        Nh=Nh+1;
        suml=suml+x(i,1);
        sumh=sumh+x(i,1);
    else
        NH=NH+1;
        Nh=Nh+1;
        sumH=sumH+x(i,1);
        sumh=sumh+x(i,1);
    end
end

if sumL==0
    ccL=-10^12;
else
    ccL=sumL/NL;
end

if suml==0
    ccl=-10^12;
else
    ccl=suml/Nl;
end

if sumh==0
    cch=-10^12;
else
    cch=sumh/Nh;
end

if sumH==0
    ccH=-10^12;
else
    ccH=sumH/NH;
end