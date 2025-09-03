GAUSSIAN BLUR:

Gaussian Blur is a smoothing filter used in image processing to reduce noise and detail. It works by convolving the image with a Gaussian function, giving higher weight to the center pixel and lower weights to distant pixels.

This is a bell-shaped curve (like normal distribution).
In 2D, it’s radially symmetric → smooth blur in all directions.

Unlike a simple average filter, Gaussian blur preserves edges better because weights decay smoothly according to a Gaussian curve.

Kernel (scaled integers):

1   2   1
2   4   2
1   2   1


Compute sum = (w00 + w02 + w20 + w22) * 1 + (w01 + w10 + w12 + w21) * 2 + w11 * 4
Divide by 16 (can be done with a right shift: >> 4)
Corners ×1
Edges ×2
Center ×4
The kernel is literally the discrete approximation of the Gaussian bell curve at integer grid points.
Then divide by 16(For normalization)

Gaussian blur uses a weighted average where closer pixels contribute more.
The kernel comes from discretizing the Gaussian function.