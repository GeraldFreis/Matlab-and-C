% Based upon https://preciseservices.com.au/average-cost-of-adelaide-water-bills/#:~:text=Using%20an%20average%20of%20190%20litres%20per%20person%20per%20day,pricing%20tier%20of%20%242.775%20begins.
%the average water use per day per person is around 0.190 KL
clc
clear

% constants
average_water_consumption = 0.190;

% recieving the population to work with: 
population = input("Please enter the population of your city: ");

% calculations to determine total water consumption
total_water_consumption = average_water_consumption * population;

% outputting the calculation and ensuring the population is an acceptable
% number: 
if total_water_consumption > 0
    fprintf("The total water consumption of your city is: %0.2f KL \n", total_water_consumption);
else
    fprintf("The population is beneath zero which is impossible");
end
