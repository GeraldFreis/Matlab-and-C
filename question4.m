%daily cost of transport
%requires cost of fuel and potentially car upkeep, distance travelled,
%amount of people, ratio of cars to people
clc
clear

% variables: 
fuel_cost = 1.94; %per litre
trip_length = 10; %km
average_fuel_efficiency = 0.111; %litres per 1km
average_car_accident_cost = 11698; % according to https://www.atap.gov.au/parameter-values/road-transport/4-crash-costs
rate_of_car_accidents = 32300 / 365 / 24000000; % accidents per day per person --> according to: https://www.dinggo.com.au/blog/road-accident-statistics-in-australia-in-2020#:~:text=Road%20Accident%20Statistics%20in%20Australia%2C%202020&text=As%20a%20driver%2C%20it's%20important,are%20seriously%20injured%20each%20day*.

city_population = input("Please enter the population of your city: ");

%20.1 million cars registered in Australia last year: https://www.abs.gov.au/statistics/industry/tourism-and-transport/motor-vehicle-census-australia/latest-release 
ratio_of_cars_per_person = 20.1/25;  % cars registered per person in australia

% assumptions: 
%assuming that all individuals travel 10km, fuel costs 1.94 per litre per
%person, fuel effiency is constant at 11.1 per 100km and thus 0.111 per km

% calculations: 
fuel_cost_for_10km = fuel_cost * trip_length * average_fuel_efficiency; % fuel cost for the trip, 
total_cars_in_the_city = city_population * ratio_of_cars_per_person; % amount of cars in the city based on the ratio of cars per person
% final calculation
total_cost = fuel_cost_for_10km * total_cars_in_the_city * rate_of_car_accidents * average_car_accident_cost;

% output and ensuring that the population is an acceptable number: 
if city_population < 0
    fprintf("The population is less than zero which is impossible \n");
else
    fprintf("The total cost of all trips by car, per day, for this city is: $%0.3f \n", total_cost);
end