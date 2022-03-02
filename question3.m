% Based upon https://preciseservices.com.au/average-cost-of-adelaide-water-bills/#:~:text=Using%20an%20average%20of%20190%20litres%20per%20person%20per%20day,pricing%20tier%20of%20%242.775%20begins.
%the average water use per day per person is around 0.190 KL
clear
clc

% constants: 
average_water_consumption = 0.190;

% input to recieve population: 
population = input("Please enter the population of your city: ");

% calculations to determine the percentage of the city's water consumption
% that is covered by the plant: 
total_water_consumption = average_water_consumption * population;
percentage = 300000 / total_water_consumption * 100;  % here the 300000 is the amount of water produced by the desalination plant 

% outputting the percentage of the city determined above: 
if total_water_consumption > 0
    fprintf("The percentage of your city covered by the desalination plant (per day) is: %%%0.2f \n", percentage);
else
    fprintf("The population is beneath zero which is impossible");
end
