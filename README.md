# Image-Registration
Stitched images captured by a satellite using MATLAB

- **Digital Image Processing**
    - This is a project that implements various methods for image analysis and transformation, such as local descriptors, Harris corner detector, matching descriptors, RANSAC, and image stitching.
    - It uses several functions that are described in detail in the report.
      <img width="502" height="395" alt="image" src="https://github.com/user-attachments/assets/9a87ec27-e473-4508-8b78-bd6f9c5c5982" />

- **Local Descriptor**
    - This is a function that gives information about a specific pixel of the image. It uses a circular mask around the pixel and calculates the average values of the pixels on the perimeter or on the radius of the circle.
      <img width="515" height="408" alt="image" src="https://github.com/user-attachments/assets/18f3e15a-abde-4e46-b7d0-5a6e5beb49fa" />

    - It returns a vector of values that represents the descriptor of the pixel.
- **Harris Corner Detector**
    - This is a method that is used to detect the points of interest in the image. It uses partial derivatives, Fourier transform, and Hough transform to estimate the angle and the distance of the points.
      <img width="557" height="415" alt="image" src="https://github.com/user-attachments/assets/1a064a73-3d79-4627-aa6c-d05baaee7695" />

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
      <img width="597" height="763" alt="image" src="https://github.com/user-attachments/assets/de976f8d-19dd-4219-b2e6-b1d99ac3ae29" />
      <img width="661" height="763" alt="image" src="https://github.com/user-attachments/assets/cb05b3e8-1711-4215-8ccf-a8414e7edbc9" />


