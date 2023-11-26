# Image-Registration
Stitched images captured by a satellite using MATLAB

- **Digital Image Processing**
    - This is a project that implements various methods for image analysis and transformation, such as local descriptors, Harris corner detector, matching descriptors, RANSAC, and image stitching.
    - It uses several functions that are described in detail in the report.
- **Local Descriptor**
    - This is a function that gives information about a specific pixel of the image. It uses a circular mask around the pixel and calculates the average values of the pixels on the perimeter or on the radius of the circle.
    - It returns a vector of values that represents the descriptor of the pixel.
- **Harris Corner Detector**
    - This is a method that is used to detect the points of interest in the image. It uses partial derivatives, Fourier transform, and Hough transform to estimate the angle and the distance of the points.
    - It returns a vector of coordinates of the corners and the corresponding descriptors of them.
- **Matching Descriptors**
    - This is a method that studies all the possible pairs of points and decides which ones match. It uses the Euclidean distance between the descriptors to measure the similarity of the points.
    - It returns a list of matching points that contain indices to the lists of points of the two images.
- **RANSAC**
    - This is a method that finds the best geometric transformation between the two images using the matching points. It uses a random sample of points and calculates the distance and the angle between them.
    - It returns the transformation matrix and the lists of inliers and outliers that indicate which points are well matched and which are not.
- **Image Stitching**
    - This is a function that is used to stitch the two images at the point where they should be. It uses the transformation matrix to apply it to the second image and then combines the two images into one.
    - It returns the final stitched image.
