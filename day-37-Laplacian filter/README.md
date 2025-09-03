Laplacian Filter:

The Laplacian filter is a spatial image processing technique used for edge detection.
Unlike gradient-based methods (like Sobel or Prewitt) which compute first-order derivatives, the Laplacian filter applies a SECOND-ORDER DERIVATIVE to highlight regions of rapid intensity change. This makes it especially effective for detecting fine details and edges in images.

Laplacian kernel:
0  -1   0
-1  4  -1
0  -1   0

Features:

Detects edges in all directions (horizontal, vertical, diagonal).
Enhances fine details and textures.
Can be combined with Gaussian smoothing (LoG filter) to reduce noise sensitivity.

The Laplacian checks how much the center pixel differs from its neighbors.
If center pixel intensity is similar to its neighbors → sum ≈ 0 → flat region.
If center pixel intensity is very different → sum is large → edge.
