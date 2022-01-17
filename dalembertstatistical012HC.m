function [CXfinal, CYfinal, CTfinal] = dalembertstatistical012HC(tstop, Ctreshold, Cstart, n)

%CXfinal: final capital levels w.r.t X,
%CYfinal: final capital levels w.r.t Y,
%each entry represents one game of (at most) tstop rounds,
%CTfinal = CXfinal + CYfinal. 
%When the player plays X and Y simultaneously, 
%then CTfinal = total final capital levels

CXfinal=zeros(n,1);
%declaration and initialization of vector CXfinal

CYfinal=zeros(n,1);
%declaration and initialization of vector CYfinal

for i=1:n
    [CX, SX, CY, SY]=dalembert012HC(tstop, Ctreshold, Cstart);
    %For the Holland Casino scenario we use 
    %dalembert012HC.m instead of dalembert012.m
    CXfinal(i)=CX(1+tstop);
    %CX(1+tstop) is final capital in "i-th X-game"
    CYfinal(i)=CY(1+tstop);
    %CY(1+tstop) is final capital in "i-th Y-game"
end
CTfinal=CXfinal+CYfinal;
%total capital = capital X + capital Y