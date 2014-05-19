K-means clustering was used to compress an image. The number of colors in the image were reduced to 16 distinct values. Each pixel was considered as a data point and mapped to its nearest centroid (randomnly chosen pixel). While an ordinary image contains three 8 bit integers to represent each pixel (RGB values between 0 to 255) which is totally 24 bits, an image that has only 16 colors can be represented in 4 bits.

In this case there were 16 centroids, findClosestCentroids allocates each pixel to the nearest centroid. 

computeCentroids recalculates the centroids based on the allocation in the previous step. Each iteration calls these two methods and after a fixed number of iterations the clustering is done and we will have 16 colors that are representative of the image

The code in main.m and runkMeans.m were provided by the instructor