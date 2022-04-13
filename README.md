# Matlab: Arithmetic operations detection and solver from images

This is a continuing development of a number and arithmetic operations recogniser and solver in matlab

I'm sorry about how this repo currently looks
I am taking matlab and C in university and we are required to make a project. My project is a matlab application that is capable of taking images and recognising numbers and arithmetic operations in that image. The project fundamentally utilises vectors to iterate through black pixels in the images and if each step of the variable number of vectors for each shape passes - i.e if the pixel is still black - the shape is that which we are searching for.
If you wish to see the most recent code it is within Week-6-Weekend-Work. I am working on changing my recognition to work with differently shaped images.
For the time being I am using constant images, but I do hope to be able to get the code to work for variable images.

Thank you for reading and I hope you find this project interesting

Functionally:
the program uses vectors of a varying size and direction to check the values of an image. The code takes the first black pixel in the image, and then applies different vectors to the shape around that pixel. In each findingnumbers_function we see the use of stages. Each stage determines what vector to apply. We can control this by having one vector test, where we iterate over pixels from an initial point, in a certain direction and certain length. If every pixel we iterate across is black: we update two variables (new_row, new_column) which contain the terminal point of this vector, and hence the initial point of the next vector. We then increase the stage. The next stage is now called, and we do the same but change the direction and length of the vector, and again we update the row and column to the terminal point of the current vector, if all pixels iterated over are black. We continue to do this until we have passed all vector tests to recognise the number. As each number is comprised of different vectors we know that this number is the number being found, and thus we have recognised this number. 

To demonstrate the logic for deconstructing a number into vectors, here is the number 2:

![image](https://user-images.githubusercontent.com/91832029/161427485-010699b0-a8c6-4cf4-92e0-5cdacc99098d.png)

And here is the number 2 deconstructed into stages. We can notice that intemediary steps like the small upward arrow between stage 1 and 2 can simply be represented by increasing the y value of the terminal point for stage 1.
![image](https://user-images.githubusercontent.com/91832029/161427697-228d5ac6-300b-43d7-9a9a-371df2c91257.png)

Currently, the code is capable of finding 2 digit and 1 digit simple arithmetic operations. 
-> For two digit operations we break the image into fifths, as there are 2 digits on either side of the operator. And for one digit operations we break the image into thirds. To control this I created two classed FindingOperationsOneDigit and FindingOperationsTwoDigit. If you want to read more about the design you can view the designdocument.txt. And for basic system architecture and interrelation between objects you can view the system-architecture...png.


This is an example video of the program taking a screenshotted image of 9 divided by 4 and producing the correct output to two decimal places:

https://user-images.githubusercontent.com/91832029/161465200-a0103275-4c55-4e06-8e00-3a517fcbdd2b.mov

This is an example video of the program taking a screenshotted image of 83 / 97 and solving the arithmetic operation

https://user-images.githubusercontent.com/91832029/163098291-468f5813-5946-43d7-a3e9-3e285b626fc0.mov


