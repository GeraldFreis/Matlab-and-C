This is the final version of the matlab project

# How the code works
The code takes an image from the testingimages directory in the main file and then the user enters the number of digits in the operation (either 1 or 2).
The FindingOperations class is then called to handle the procedure for determining what numbers and operations are present in the image.

If the operation is 1 digit the FindingOperationsOneDigit class is created and deconstructs the image into thirds, and then iterates through these thirds while checking if any of the findingnumbers functions return that they have found their respective number in the third. If the middle third is being iterated over, the findingoperations functions return if they have found their respective operator. If the operation is 2 digits then the FindingOperationsTwoDigit class is created and deconstructs the image into fifths, then iterating through each fifth and if it is the 1st, 2nd, 4th or 5th fifth of the image the findingnumbers functions are tested against the respective submatrix, and if it is the middle or third fifth then the findingoperator functions are tested against the matrix. If any of the functions return true this number or operator is returned by the calling function to  to the FindingOperations class which returns the data to the main file.

This data is then passed to the solving_AO_operation function which checks what the operator is and preforms that arithmetic operation on the numbers, and then returns the solution and prints its.

The current answer is then saved into a text file called pastresultsfile.txt, and then a matlab graph is created from these past results.
