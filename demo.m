I=rgb2gray(im2double(imread("imForest1.png")));
I2=rgb2gray(im2double(imread("imForest2.png")));

[c1,d1]=myDetectHarrisFeatures(I);
[c2,d2]=myDetectHarrisFeatures(I2);
    
p1=cornerPoints(c1);
plot(p1)
p2=cornerPoints(c2);
plot(p2)

matchingPoints= descriptorMatching(p1.Location , p2.Location ,0.1,d1,d2);
[H, inlierMatchingPoints , outlierMatchingPoints] = myRANSAC(matchingPoints , 400, 20,p1.Location , p2.Location);

scatter(p1.Location(matchingPoints(1,inlierMatchingPoints),1),p1.Location(matchingPoints(1,inlierMatchingPoints),2),"square",	"r");
hold on
scatter(p1.Location(matchingPoints(1,outlierMatchingPoints),1),p1.Location(matchingPoints(1,outlierMatchingPoints),2),"square",	"b");
legend("Inliers","Outliers")

figure
scatter(p2.Location(matchingPoints(2,inlierMatchingPoints),1),p2.Location(matchingPoints(2,inlierMatchingPoints),2),"square",	"r");
hold on
scatter(p2.Location(matchingPoints(2,outlierMatchingPoints),1),p2.Location(matchingPoints(2,outlierMatchingPoints),2),"square",	"b");
legend("Inliers","Outliers")
