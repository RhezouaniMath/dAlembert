# dAlembert
Matlab files for simulating the d'Alembert strategy in roulette.

1. The project

  1.1. The reason for this project
  
    This project is part of Hamid Rhezouani's master thesis on a probabilty subject. We
    will explain more about this below.

    The client of a criminal defence lawyer is accused of money laundering in casinos, but 
    according to the client himself he just won 10,000 euros each year for five years in a 
    row by playing simultaneously on red/black and low/high in roulette at Holland Casino 
    (a state-owned gambling company in the Netherlands). He followed the so-called  
    d'Alembert strategy, which, according to him, made it possible  to win that amount of 
    money. This master thesis project takes a look at this case from a probabilistic 
    perspective.

    Much work has already been done by Prof. dr. Richard D. Gill, a Dutch-British professor 
    emeritus of mathematical statistics at Leiden University. Richard Gill is known for his 
    work in forensic statistics and for his work in fighting injustice, among other things. 
    More information on Gill can be found on his web page: 
    
    https://pub.math.leidenuniv.nl/~gillrd
    
    Gill performed R simulations for the games played by the client. He also constructed a 
    Markov chain model for these games, which enabled him to derive exactly the distribution 
    of the client's (final) capital. Zero outcomes are disregarded so that the 
    red/black-games and low/high-games are independent, and it is assumed that the odds are 
    36:37 in favour of the house. Gill also performed a forensic probabilistic assessment of
    the client's story. According to Gill it is most likely that the client lost more than 
    he won and the client's chance of having a net gain of 10,000 euros each year for five 
    successive years is negligible. See 
    
    https://www.slideshare.net/gill1109/dalembert-250780483
    
    for more information on Gill's work and for some nice background information, histograms 
    and bar charts. Gill's work forms an important source of inspiration for the master thesis
    project.
    
    This project mainly focuses on the probability theory behind this money laundering case.
    However, the mathematics will be complemented by simulations in MATLAB. We share the
    MATLAB files on Github so that others can use and improve these programs.
    
  1.2. Roulette in Holland Casino

    According to the rules of roulette, the player can bet on certain subsets of 
    {0, 1, ...36} by placing a token on the roulette table. The player can place a token in 
    an area (which represents a number), on the line between two areas, or on the corner 
    between several areas. One can also place a token on designated fields for playing on 
    odd, even, red, black, and so on. In each round the outcome of the bet is decided by the 
    roulette wheel. In this project we will only focus on playing red/black and low/high.
    
    When you play French roulette in Holland Casino and you bet on red/black, low/high, 
    or odd/even, the zero will not be treated as a regular loss. When zero comes up, you have
    to choose between two options:
    - You share half of your stake with the house.
    - You put your stake `en prison'.
    We assume that the player always choses the first option.
    
  1.3. The d'Alembert system
  
    The d'Alembert system is a well-known and established casino betting system that has 
    already been used in the 18th century. It is characterised by a set of rules. 
    - The player starts with a unit bet. 
    - After every loss, the player increases the bet by one unit.
    - After every win, the player decreases the bet by one unit, 
      unless the size of the bet is already one unit.

    The client plays two simultaneous games: red/black and low/high. 

    For each game the following parameters are set:
    - The initial capital is 25 units, where each unit amounts to 50 euro. 
    - The maximum number of rounds is set to 21. 
    - Also, the client quits the game if his capital falls below 16 units.
    
  1.4. Independent coupling
  
    The two simultaneous games are dependent, since in each round, zero comes up in the 
    red/black process if and only if at the same time zero comes up in the low/high process.
    
    However, we can construct an independent coupling of these processes in order to 
    approximate the orignal two simultaneous games. We do that in the following way:
    - Replace the `old zero' in one of the processes by an independent `new zero'. That is, 
      repeatedly flip an independent (unfair) coin to decide for one of the processes in 
      which rounds there is a zero outcome and for which rounds there is no zero outcome.
    - Consider for each round whether this coin tells us if there is a zero or not. 
      If there is a (new) zero, then this zero will be the new outcome and this new outcome 
      will replace the old outcome. If there is no (new) zero, then keep the old outcome when
      this old outcome is not (an old) zero. When the old outcome is zero, then get rid of 
      this outcome by flipping another (fair) coin to decide the new nonzero outcome.
    
    This coupling is independent and it has the same marginal distributions as the original
    processes
    
  1.5. The roulette games as Markov process
  
    It is possible to model the capital/stake-levels of the two simultaneous games as a 
    Markov chain with a transition matrix and an initial distribution. This model enables 
    us to compute exactly the distribution of the final capitals and to use that 
    distribution to compute all kinds of probabilistic properties of the final capitals.
  
    This results in some beautiful concrete results for a single game. However, we did not 
    succeed in doing the computations for the two games simultaneously, because the arrays 
    turn out to be too large to work with. Luckily, by performing simulations we can still 
    get some insights into the distribution of the total final capital for the two 
    simultaneous games. The memory issues with large arrays may motivate future research 
    into refining the coupling idea and into the computational use of sparse arrays for the
    topics of this master thesis project.
  
2. The MATLAB files
  
  2.1. simultaneous.m
  
    This m-file can be used to simulate one evening in which the client plays two
    simultaneous games: red/black and low/high. The vector X represents the outcomes of the
    red/black game, the vector Y represents the outcomes of the low/high game, and N is a
    parameter for the number of rounds being played.
    
  2.2. dalembert012.m

    This m-file can be used to simulate the capital/stake levels in one evening of roulette.
    The client plays two simultaneous games: red/black and low/high. For each of these games
    he uses two seperate pockets of money. He uses the d'Alembert strategy for choosing his
    stakes and he stops when the maximum number of rounds is reachedor when his capital 
    falls below a certain treshold.
    
    This MATLAB function uses simultaneous.m.

    Parameters:
    
    tstop     = maximum number of rounds being played
    Ctreshold = the capital treshold mentioned above
    Cstart    = start capital

    Output variables:
    
    The vector CX represents the capital levels in each round of the red/black-game.
    The vector SX represents the stake levels in each round of the red/black-game.
    The vector CY represents the capital levels in each round of the low/high-game.
    The vector SY represents the stake levels in each round of the low/high-game.
    
  2.3. dalembert012HC.m
    
    This MATLAB function has the same functionality as dalembert012.m. However, the
    difference is the way in whicht zero outcomes are treated. In dalembert012.m zero 
    outcomes are treated as regular losses. In dalembert012HC.m we use the Holland Casino 
    policy for treating zero outcomes and we assume that the player always chooses to share 
    half of his stake with the house when zero comes up.
    
    The output variables are expressed in sub units. Each unit (of 50 euros) amounts to two
    sub units (of 25 euros each).
    
  2.4. dalembertstatistical012.m
  
    This MATLAB function runs dalembert012.m multiple times. Each time i, the final capital
    levels are being stored in the ith entries of the vectors CXfinal and CYfinal. 
    Vector CXfinal represents the final capital levels in the red/black-games, 
    vector CYfinal represents the final capital levels in the low/high-games, 
    and each entry i represents one time / evening in the casino. The storage of the final 
    capital levels enables us to do statistical analysis.
    
    The parameter n is used for setting the number of times/evening we want to store.
    
  2.5. dalembertstatistical012HC.m
  
    This MATLAB function is an adaptation of dalembertstatistical012.m to the Holland 
    Casino rule for treating zero outcomes. This function uses the program dalembert012HC.m.
  
  2.6. coupling.m
  
    This function can be used to construct an independent coupling of the simultaneous 
    red/black- and low/high-games. This construction of an indepdent coupling is described 
    in S1.4.
    
    Type in 
    
    N=21;
    [X,Y] = simultaneous(N);
    
    to set the vectors X,Y equal to realisations of the simultaneous red/black- and
    low/high-games. Then type in
    
    [hatX , hatY] = coupling(X,Y);
    
    in order to get the realisations of the corresponding coupling.
  
  2.7. countingdifferences.m
  
    Function for counting the number of different components between two vectors of equal
    length.
  
  2.8. dalembert012adapted.m
  
    Two games are played: red/black (X) and low/high (Y).
    
    This function can be used for simulating random walks related to X,Y, coupled Y.
    
    Random walk: #wins - #losses.
    
    This function can be used for simulating capital/stake-levels of X, Y, coupled Y.
    This function is an adaptation of dalembert012.m
    
    Cstart is the start capital. Each game has start capital Cstart.
    Player always stops at/before time tstop.
    Player always stops when capital falls below Ctreshold.
    These rules also apply to the coupling (hatX , hatY).
  
  2.9. dalembertstatistical012adapted.m
  
    This function is meant for doing multiple simulations of the X-,Y-, and coupled-Y-games,
    and to collect a data set (based on simulations) of associated features of these games:
    - final capital levels of (X,Y) and their sum (the total final capital);
    - final capital levels of the coupling, and their sum;
    - number of difference between original (X,Y) and coupling;
    - 'final distance' from origin of corresponding random walks,
    - position random walk = net number of wins.

    CXfinal: vector of final capital levels w.r.t X;
    CYfinal: vector of final capital levels w.r.t Y;
    CTfinal = CXfinal + CYfinal = vector of total final capital levels;
    hatCXfinal, hatCYfinal, hatCTfinal are defined similarily, but based on coupling;
    each entry of such a vector represents one game of (at most) tstop rounds.
  
  2.10. Pmatrix.m
  
    This function can be used for the construction of a Markov chain transition
    matrix for a single game. The states of this Markov chain are the capital/stake-pairs.
    
    We assume that the player uses the d'Alembert strategy in the way that is mentioned
    above (so with the default parameters for start capital, capital treshold, and so on).
    
    Index 1 stands for capital/stake 0, index 2 stands for capital/stake 1, 
    and so on.
    
    Parameters:
    m = maximal capital + 1
    n = maximal stake + 1
    
    The use of this MATLAB function results in an 4D array. You have to reshape this
    array in order to get the transition matrix.
    
  2.11. PmatrixHC.m
  
    PmatrixHC.m is an adaptation of Pmatrix.m to the Holland Casino policy for treating
    zero outcomes. 
    
    The output variables and the parameters are expressed in sub units.
    Each unit (of 50 euros) amounts to two sub units (of 25 euros each).
  
  2.12. PsimHC.m
  
    This function is meant for the construction of a Markov chain transition matrix for
    the two games simultaneously. However, we encountered memory issues with this 
    function.
    
    We have tried to solve these memory issues by using sparse arrays. For this purpose 
    we have tried to use ndSparse, a class written by Matt Jocobson, a research scientist 
    at Xoran Technologies, which is a company for CT scanners in Michigan, US. This 
    software can be found on 
    
    https://nl.mathworks.com/matlabcentral/fileexchange/29832-n-dimensional-sparse-arrays 
    
    (including its license). Unfortunately, we did not succeed in making this solution work.
  
  2.13. initialdistribution.m
  
  2.14. Distr.m
  
  2.15. DistrHC.m
  
  2.16. counting.m
  
  2.17. conditionalaverage.m
  
  2.18. sumfinalcapital.m
  
3. Credits

4. License

5. Contact information

  You can contact Rhezouani H via electronic mail: 
  hamid_pet AT hotmail DOT com
