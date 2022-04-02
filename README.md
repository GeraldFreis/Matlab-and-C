For the second half of week 5 I produced functions to find every number, based on the number_x.png images in the directory Week-5

The logic came from trying to find an algorithm for the plus symbol, which we can see a little bit of in findingshapes_deprecated from the first half of this week.

I essentially realised that numbers, and any shape, are just a construction of a specific number of vectors. A circle, the way we see it, is an infinite amount of vectors, just as the curve of a 2, 3, 5, 6, 8 and 9. Thus, if we can find the smallest number of vectors for an algorithm to find that a number exists, we can implement this using loops and conditional statements.

From the beginning of this week, we produced a new matrix that was filled with only 0's and 255's. Thus, we can iterate through each element in that new matrix and check if it is equal to 0. If so, it will be the left and top most pixel of the number (as the code iterates from top left to bottom right)
For the number 1, for example, we can take this row and column, and produce a vector that iterates downwards until it does not come across a 0 anymore. If we then have another two loops that check if it can iterate both right and left the same distance. If it does then we likely have a 1. But to make sure, we can move back up to the top of the shape and then move down that left branch of the 1. If it can move both 1 row down and 1 column left, 10 times for example, and the pixel is still equal to a 0, then we know that our shape is a 1. 

The above is the general logic for every number.
For curved numbers its a bit more difficult but we can still use vectors in the form of loops to iterate through every pixel in a number and test if each pixel is equal to zero, and by repeating this we can determine what number is on the screen.

So i did this rather ineffectively for most numbers, until 9 which I was able to complete on friday during the day at university.
My code was able to take the number_x.png files and recognise every number.

I did work on the rest during the weekend but that I will put into the week 6 branch

My favourite finding_numbers function that I wrote was findingeights() as I used a pseudo multithreading approach were I initialised two vectors that move proportionally down the shape. I used this same approach with findingnines() for the top of the 9, and I also changed my approach from using lots of for loops like findingthrees, to using one while loop with a sentinal condition. This was an attempt to decrease time complexity. I regulated the behaviour of the loop - i.e the vectors used - by calling different stages, and updating the stages if each vector passed its tests.
