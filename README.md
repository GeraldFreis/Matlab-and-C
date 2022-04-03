# Arithmetic operations solver from images

This is a continuing development of a number and arithmetic operations recogniser and solver in matlab

I'm sorry about how this repo currently looks
I am taking matlab and C in university and we are required to make a project. My project is a matlab application that is capable of taking images and recognising numbers and arithmetic operations in that image. The project fundamentally utilises vectors to iterate through black pixels in the images and if each step of the variable number of vectors for each shape passes - i.e if the pixel is still black - the shape is that which we are searching for.
If you wish to see the most recent code it is within Week-6-Weekend-Work. I am working on changing my recognition to work with differently shaped images.
For the time being I am using constant images, but I do hope to be able to get the code to work for variable images.

Thank you for reading and I hope you find this project interesting

Functionally:
the program uses vectors of a varying size and direction to check the values of an image. The code takes the first black pixel in the image, and then applies different vectors to the image. The vector used is dictated by the 'stage' of the code. All of this is linked around the caller_function.m file. This file breaks each image into thirds, which are the first number, the operator, and the final number. These thirds are then made matrices and passed to the findingnumbers functions. Each findingnumber function is then tested against the matrix and it applies its own sequence of vectors that are unique to the character. If these vectors are always moving across pixels of the gradient 0, we have the number of the function. We can then return true to the caller_function and this value is then passed back to the main function which takes an array of values from the caller_function function and applies whatever the operator is to the first and third element. The first and third element here are the number inthe first third and the number in the final third.

To demonstrate the logic for deconstructing a number into vectors, here is the number 2:

![image](https://user-images.githubusercontent.com/91832029/161427485-010699b0-a8c6-4cf4-92e0-5cdacc99098d.png)

And here is the number 2 deconstructed into stages. We can notice that intemediary steps like the small upward arrow between stage 1 and 2 can simply be represented by increasing the y value of the terminal point for stage 1.
![image](https://user-images.githubusercontent.com/91832029/161427697-228d5ac6-300b-43d7-9a9a-371df2c91257.png)

Currently I have produced the ability for the code to recognise arithmetic operations from screenshotted images. You can view the test files that my code works for under the testing_images. I recently added the ability to divide and multiply my code and it seems to work. You can also view the code under the findingnumbers_functions directory
