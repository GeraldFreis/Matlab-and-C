# Matlab-and-C
This is my work following the Weekend of Week 6

I have reorganised my files and have readjusted my vectors in each findingnumbers function to be more accurate for the image sizes (544x900) that I am now using. My code is also now able to recognise arithmetic operations from images that I have screenshotted. These images must have a white background and use 72 calibri, but so far that's okay. I am very likely going to find a vector conversion size between fonts and let the user enter the font size they wish to use, and scale the vectors like that.

I also need to create a function that encapsulates my vector logic for different steps. This function will probably take the vector size and step type as parameters. 
Step type will be like: 45 degrees downleft, 45 degrees downright, 45 degrees upright, 45 degreesupleft, up, down, left and right. And the vector size will just be the length of the vector, which will dictate how many pixels the code iterates through and checks if the pixels are black (and hence are still the shape)
