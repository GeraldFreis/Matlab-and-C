clear
height_1 = input("Enter the first height: ");
height_2 = input("Enter the second height: ");
height_3 = input("Enter the third height: ");

if(height_1<0 || height_2<0 || height_3 <0)
    fprintf("A height is less than zero ");

else
        
        average = (height_1 + height_2 + height_3) / 3;
        fprintf("Averages of all heights: %0.4f \n", average);

end