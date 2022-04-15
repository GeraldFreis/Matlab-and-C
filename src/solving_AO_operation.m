%% function to solve the arithmetic operation 
% function will take the number_1, operation, number_2 as inputs / args
% the function will then check what operator is used and then compute the operation
function result = solving_AO_operation(number_1, operation, number_2)
    result = 0; % the variable to store the result of the operation
    switch operation
        case "plus"
            result = number_1 + number_2;
        case "minus"
            result = number_1 - number_2;
        case "multiply"
            result = number_1 * number_2;
        case "divide"
            result = number_1 / number_2;
        otherwise
            fprintf("ERROR:\nNO VALID OPERATION FOUND");
            return;
    end
    fprintf("\nThe result of the operation is:\n\t%0.2f\n", result);
end