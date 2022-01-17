function [X, CX, SX, WX, hatX, hatCX, hatSX, hatWX, Y, CY, SY, WY, hatY, hatCY, hatSY, hatWY]=dalembert012adapted(tstop, Ctreshold, Cstart)
%
% This function can be used for
% simulating random walks related to X,Y, coupled Y.
%
% Random walk: #wins - #losses.
%
% This function can be used for
% simulating capital/stake-levels of X, Y, coupled Y.
%
% This function is an adaptation of dalembert012.m
%
% Two games are played: red/black (X) and low/high (Y).
% Cstart is the start capital. Each game has start capital Cstart.
% Player always stops at/before time tstop.
% Player always stops when capital falls below Ctreshold.
% These rules also apply to the coupling (hatX, hatY).
%

[X,Y] = simultaneous(tstop); 
%the two games are simulated

[hatX, hatY] = coupling(X,Y);
%independent coupling of X,Y

hatWX=zeros(1+tstop, 1);
WX=zeros(1+tstop, 1);
%declaration and initialization of random walk for (coupled) X-game
%declaration and initialization of random walk for           X-game

hatCX = zeros(1+tstop,1);
CX = zeros(1+tstop,1);
%declaration and initialization of vectors hatCX, CX
%vectors of capital in (coupled) X-game and X-game resp.

hatSX = zeros(1+tstop,1);
SX = zeros(1+tstop,1);       
%declaration and initialization of vectors hatSX, SX
%vectors of stakes in (coupled) X-game and X-game resp.

hatWY=zeros(1+tstop,1);
WY=zeros(1+tstop, 1);
%declaration and initialization of random walk for coupled Y-game
%declaration and initialization of random walk for         Y-game

hatCY = zeros(1+tstop,1);
CY = zeros(1+tstop,1);
%declaration and initialization of vectors hatCY, CY
%vectors of capital in coupled Y-game and Y-game resp.

hatSY = zeros(1+tstop,1);
SY = zeros(1+tstop,1);
%declaration and initialization of vectors hatSY, SY
%vectors of stakes in coupled Y-game and Y-game resp.

hatCX(1) = Cstart;
CX(1) = Cstart;
%at beginning, capital (coupled) X-game = start capital
%at beginning, capital X-game = start capital

hatCY(1) = Cstart;
CY(1) = Cstart;
%at beginning, capital coupled Y-game = start capital
%at beginning, capital Y-game = start capital

hatSX(1) = 1;
SX(1) = 1;
%first stake equals one unit in (coupled) X-game
%first stake equals one unit in X-game

hatSY(1) = 1;
SY(1) = 1;
%first stake equals one unit in coupled Y-game
%first stake equals one unit in Y-game

for i=1:tstop
    %Game X
    if X(i) == 2 %Winning outcome in round i
		CX(i+1) = CX(i) + SX(i);
        WX(i+1) = WX(i) + 1;
        %new capital = capital + stake
        %random walk makes a move upwards
		if SX(i)>1
			SX(i+1) = SX(i) - 1;
            %if stake>1, next stake = stake - 1
		else
			SX(i+1) = SX(i);
            %if stake<=1, next stake = stake
		end
    else %Losing outcome in round i
		CX(i+1) = CX(i) - SX(i); 
        WX(i+1) = WX(i) - 1;
        %new capital = capital - stake
        %random walk makes a move downwards
		if CX(i+1) <Ctreshold    
			SX(i+1) = 0;         
            %if new capital below level Ctreshold
            %the player stops (so next stake = 0)
        else                     
			SX(i+1) = SX(i) + 1; 
            %if new capital => Ctreshold
            %new stake = stake + 1
        end
    end
    
    %Game Y
    %Game Y is treated in the same way as X
	if Y(i) == 2                 
		CY(i+1) = CY(i) + SY(i);
        WY(i+1) = WY(i) + 1;
		if SY(i)>1
			SY(i+1) = SY(i) - 1;
		else
			SY(i+1) = SY(i);
		end
	else
		CY(i+1) = CY(i) - SY(i);
        WY(i+1) = WY(i) - 1;
		if CY(i+1) <Ctreshold
			SY(i+1) = 0;
		else
			SY(i+1) = SY(i) + 1;
		end
	end
end

% Same iterations for the coupling (hatX, hatY).
% Read "(coupled) X-game" when you read "X-game".
% Read "coupled Y-game" when you read "Y-game".
for i=1:tstop
    %Game X
    if hatX(i) == 2 %Winning outcome in round i
		hatCX(i+1) = hatCX(i) + hatSX(i);
        hatWX(i+1) = hatWX(i) + 1;
        %new capital = capital + stake
        %random walk makes a move upwards
		if hatSX(i)>1
			hatSX(i+1) = hatSX(i) - 1;
            %if stake>1, next stake = stake - 1
		else
			hatSX(i+1) = hatSX(i);
            %if stake<=1, next stake = stake
		end
    else %Losing outcome in round i
		hatCX(i+1) = hatCX(i) - hatSX(i); 
        hatWX(i+1) = hatWX(i) - 1;
        %new capital = capital - stake
        %random walk makes a move downwards
		if hatCX(i+1) <Ctreshold    
			hatSX(i+1) = 0;         
            %if new capital below level Ctreshold
            %the player stops (so next stake = 0)
        else                     
			hatSX(i+1) = hatSX(i) + 1; 
            %if new capital => Ctreshold
            %new stake = stake + 1
        end
    end
    
    %Game Y
    %Game Y is treated in the same way as X
	if hatY(i) == 2                 
		hatCY(i+1) = hatCY(i) + hatSY(i);
        hatWY(i+1) = hatWY(i) + 1;
		if hatSY(i)>1
			hatSY(i+1) = hatSY(i) - 1;
		else
			hatSY(i+1) = hatSY(i);
		end
	else
		hatCY(i+1) = hatCY(i) - hatSY(i);
        hatWY(i+1) = hatWY(i) - 1;
		if hatCY(i+1) <Ctreshold
			hatSY(i+1) = 0;
		else
			hatSY(i+1) = hatSY(i) + 1;
		end
	end
end