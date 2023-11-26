function matchingPoints = descriptorMatching(points1 , points2 ,percentageThreshold,d1,d2)
%all the matching points using all the points of the point lists and all
%the descriptors
all1=sum(d1,2); %save the sum of all the descriptor vectors to check the ones equal to zero
all2=sum(d2,2);
z1=find(all1==0);  %coordinates of zeros
z2=find(all2==0);
d1(z1,:)=[];  %get rid of zero vectors and the corresponding points of the point lists
points1(z1)=[];
d2(z2,:)=[];
points2(z2)=[];

dist=pdist2(d1,d2,'euclidean');  %get distance matrice of all the pairs
[x,y]=find(dist<percentageThreshold);  %find coordinates of pairs with distance less than the threshold
matchingPoints(1,:)=points1(x);  %save coordinates
matchingPoints(2,:)=points2(y);
   
 end