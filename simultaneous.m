function [X,Y] = simultaneous(N)

X=zeros(N,1);             
%declaration and initialization of vector X

Y=zeros(N,1);            
%declaration and initialization of vector Y
%X represents the red/black-game, 
%Y represents the low/high-game

D=binornd(1,36/37,N,1);
%vector of i.i.d. bernoulli(36/37) variables
%with probability 1/37 ZERO will come up

for i=1:N
    if D(i)==0
        X(i)=D(i);
        Y(i)=D(i);
        %If ZERO comes up at the roulette wheel,
        %both games have ZERO as outcome
    else
        U=binornd(1,1/2); 
        V=binornd(1,1/2);
        X(i)=D(i)+U;
        Y(i)=D(i)+V;
        %Conditional on "not ZERO": 
        %w.p. 1/2 you win the red/back-game,
        %w.p. 1/2 you win the low/high game,
        %both games are (cond) indepdendent.
    end
end