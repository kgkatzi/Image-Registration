function  Im=myStitch(I,I2,H)  
 outputView = imref2d(size(I2));  %create image with dimentions of I2
 a=[cos(rad2deg(H(1))) -sin(rad2deg(H(1))) H(2); sin(rad2deg(H(1))) cos(rad2deg(H(1))) H(3); 0 0 1];
 tform = affinetform2d(a);  %geometric transform  
 stitchedImage = imwarp(imrotate(I2,90), tform, 'OutputView', outputView);  %apply transform
 Im = imfuse(imrotate(I,90), stitchedImage, 'blend', 'Scaling', 'joint');  %stitch images 
 imshow(Im)
end