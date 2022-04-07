# Matlab-arithmetic-operations-solver-from-images
For this half of week-6, I underwent a large abstraction event. 

I knew for a while that I was reusing the same procedure / algorithm for each vector and only differing in each stage by the direction and length
of the vector. As such, I implemented a single function called findingnumbers which takes the parameters, direction, length, currentrow, currentcolumn
and matrix. It is boolean and returns true if every pixel iterated over by the vector from (currentcolumn, currentrow) of length length and direction direction
is black (and hence still in the number). If any pixel iterated over is not black then we do not match the unique vectors that each number is composed by,
and hence the current number being checked in the image is not the number that the function is looking for.

To elaborate on the findingnumbers function, there is a switch statement that tests the direction and then uses a for loop to iterate over every pixel
in the length from the initial row and column.

I implemented the function into most of the findingnumbers functions, except for where I pseudo-multithreaded the vectors. For shapes like 8 and 9
I used two vectors to iterate through parts of the shape, as they are symetrical - to a degree. And in doing so, using the findingnumbers function that I created
was difficult for this situation as it would require two calls to the findingnumbers function which was inefficient codewise, and increased timecomplexity.
I may enable multithreading vectors in later versions of the findingnumbers function.

That was all for this half of the week.
