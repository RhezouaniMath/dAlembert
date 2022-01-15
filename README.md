# dAlembert
Matlab files for simulating the d'Alembert strategy in roulette.

Authors: 
Prof. Dr. R.D. Gill
H. Rhezouani BSc

Table of Contents
1. The project
  1.1. Reason for this project
  1.2. Roulette in Holland Casino
  1.3. The d'Alembert system
2. H
3
4
5. Credits
6. License

%UNDER CONSTRUCTION

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
    - unless the size of the bet is already one unit.

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
      (repeatedly) flip an independent (unfair) coin to decide for one of the processes in 
      which rounds there is a zero outcome and for which rounds there is no zero outcome.
    - Consider for each round whether this coin tells us if there is a zero or not. 
      If there is a (new) zero, then this zero will be the new outcome and this new outcome 
      will replace the old outcome. If there is no (new) zero, then keep the old outcome when
      this old outcome is not (an old) zero. When the old outcome is zero, then get rid of 
      this outcome by flipping another (fair) coin to decide the new nonzero outcome.
    
    This coupling is independent and it has the same marginal distributions as the original
    processes
    
    %UNDER CONSTRUCTION
