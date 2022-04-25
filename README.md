# All versions branch of Matlab-arithmetic-operations-solver-from-images

Within this branch is all developments made to produce the final product
The final version folder contains the most recent and hence final product which is capable of taking an image of 544x900 size
that contains an arithmetic operation (like 1 + 2 or 21 x 91) and recognising the numbers from the image and producing the correct output

The product also then outputs the solution and a graph of all previous solutions, read from the pastresults.txt file

The code uses OOP for administration of the code, and asynchronous programming at times, specifically in the FindingOperations, FindingOperationsOneDigit 
and FindingOperationsTwoDigit files.

The code also uses error handling in the findingnumbers.m file.

For information about the design view the design docs and text files in the Final Version directory

# NOTE
The images must be centre justified both horizontally and vertically and use size 72 calibri font.

# How the program works
The program subdivides the image of an arithmetic operation into either thirds or fifths if the image is a 1 digit operation (one digit on both sides) or a two digit operation (two digits on both sides). The findingnumbers functions (findingones, findingtwos etc.) are then called. These functions iterate over the matrices until the first black pixel is found. A unique set of vectors is then applied to that black pixel and its surrounding black pixels. These vectors iterate over each pixel they pass over and test if the pixel is black. If every pixel iterated over by the unique set of vectors was black, then we have found that this number or operator matches the specific number or operator that is trying to be determined by the function.

# location of specific documents / files
All functions can be found in the src directory for the most recent updates. From there, the findingnumbers directory contains the functions that test whether or not the specific number they are searching for (with their unique set of vectors) is within the sub matrix / image they are given. The checkingnumbers directory contains thefunctions that call the findingnumbers functions and returns what number is found in the matrix. The findingoperators directory contains the code that searches for and determines what operator is present. The general src file contains the main files that hold the classes and friend functions that the classes need to use, such as the sub_matrices_maker which subdivides the image into matrices that the findingnumbers and findingoperators functions can use to determine which numbers and what operator is present in the image. The FindingOperations class is an administration class that calls either the FindingOperationsOneDigit or FindingOperationsTwoDigit if the image contains a 1 digit arithmetic operation or a 2 digit arithmetic operation, respectively.
