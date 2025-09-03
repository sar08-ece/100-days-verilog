SOBEL edge detection algorithm:

Images contain lots of redundant data, scholars have discovered that the most important 
information lies in it edges.

Edges represents region in the image with strong intensity contrast; representing an image by its edges has the fundamental advantage that the amount of data is reduced significantly 
while retaining most of image’s vital information with high frequencies.
Eliminating the redundancy could be done through edge detection. When image edges 
are detected, every kind of redundancy present in the image is removed.

Most edge detection methods work on the assumption that the edge occurs where there is a 
discontinuity in the intensity function or a very steep intensity gradient in the image. Using this 
assumption, if one take the derivative of the intensity value across the image and find points 
where the derivative is maximum, then the egde could be located.

Table 1: Filtering Results of the two Kernel 
Kernel1= Gx             Kernel 2 = Gy
-1 0 1                    -1 -2 -1 
-2 0 2                     0 0 0 
-1 0 1                     1 2 1

Gx:looks at differences between left and right, but gives more importance to pixels closer to the centers.
Gy: looks at differences between top and bottom, also weighted.

Add more weight to center row/column (factor of 2).
This acts like a smoothing filter in the perpendicular direction
Note:
If we didn’t put zeros, the kernel would mix vertical + horizontal contributions.
Zeros ensure the filter only responds to one direction