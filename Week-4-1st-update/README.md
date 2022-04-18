For the first half of week 5 I focused on taking the images, converting them to a matrix, taking this new matrix and 
* if a pixel in the matrix was equal to zero (black) I would transfer that pixel to the new matrix, and every other value I made 255
* This was to ensure that the program would filter out all non-numbers or non-characters

However, a problem here was that even when I did so, shadows on the page which I printed - that had the number 1 on it - existed in the new matrix
From here I decided to use google sheets to centre numbers and take screenshots of those numbers to test against

In findingshapes_deprecated we can see an attempt to test for the plus symbol. I decided that I could move this into its own function as logic for every number would be different, and storing it inside one function would be dumb. This is where the first function of the finding(numbernames) comes from.
