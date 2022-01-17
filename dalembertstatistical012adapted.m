function [WX21absolute, WY21absolute, CXfinal, CYfinal, CTfinal, hatWX21absolute, hatWY21absolute, hatCXfinal, hatCYfinal, hatCTfinal,D] = dalembertstatistical012adapted(tstop, Ctreshold, Cstart, n)
%
% This function is meant for doing multiple simulations of the X-,Y-, and
% coupled-Y-games, and to collect a data set (based on simulations) of 
% associated features of these games:
% - final capital levels of (X,Y) and their sum (the total final capital);
% - final capital levels of the coupling, and their sum;
% - number of difference between original (X,Y) and coupling;
% - 'final distance' from origin of corresponding random walks,
% - position random walk = net number of wins.
% CXfinal: vector of final capital levels w.r.t X;
% CYfinal: vector of final capital levels w.r.t Y;
% CTfinal = CXfinal + CYfinal = vector of total final capital levels;
% hatCXfinal, hatCYfinal, hatCTfinal are defined similarily, but based on
% coupling of (X,Y);
% each entry of such a vector represents 
% one game of (at most) tstop rounds.
%
hatCXfinal=zeros(n,1);
CXfinal=zeros(n,1);
%declaration and initialization of vectors hatCXfinal, CXfinal.

hatCYfinal=zeros(n,1);
CYfinal=zeros(n,1);
%declaration and initialization of vectors hatCYfinal, CYfinal.

hatWX21absolute=zeros(n,1);
WX21absolute=zeros(n,1);
%declaration and initialization of vectors hatWX21absolute, WX21absolute.

hatWY21absolute=zeros(n,1);
WY21absolute=zeros(n,1);
%declaration and initialization of vectors hatWY21absolute, WY21absolute.

D=zeros(n,1);
%declaration and initialization of vector D

for i=1:n
    [X, CX, SX, WX, hatX, hatCX, hatSX, hatWX, Y, CY, SY, WY, hatY, hatCY, hatSY, hatWY]=dalembert012adapted(tstop, Ctreshold, Cstart);
    %[hatX, hatY] is coupling of (X,Y);
    CXfinal(i)=CX(1+tstop);
    hatCXfinal(i)=hatCX(1+tstop);
    WX21absolute(i)=abs(WX(1+tstop));
    hatWX21absolute(i)=abs(hatWX(1+tstop));
    %CX(1+tstop) is final capital in "i-th X-game"
    %abs(WX(1+tstop)) is distance from origin at the end of "i-th X-game"
    CYfinal(i)=CY(1+tstop);
    hatCYfinal(i)=hatCY(1+tstop);
    WY21absolute(i)=abs(WY(1+tstop));
    hatWY21absolute(i)=abs(hatWY(1+tstop));
    D(i)=countingdifferences(Y,hatY);
    %CY(1+tstop) is final capital in "i-th Y-game"
    %abs(WY(1+tstop)) is distance from origin at the end of "i-th Y-game"
end
CTfinal=CXfinal+CYfinal;
hatCTfinal=hatCXfinal+hatCYfinal;
%total capital = capital X + capital Y