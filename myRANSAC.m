function [H, inlierMatchingPoints , outlierMatchingPoints] = myRANSAC(matchingPoints , r, N, points1, points2)
best=0;  %find the best pair--> index
ebest=inf;   %find the best pair--> values
for j=1:N  %loop because the algorithm needs to be checked to find the best pair
    p=randperm(length(matchingPoints),2);  %find 2 random pairs

    im1_points1=points1(matchingPoints(1,p(1)),:); %coordinates of point 1 in image 1
    im2_points1=points2(matchingPoints(2,p(1)),:); %coordinates of point 1 in image 2

    im1_points2=points1(matchingPoints(1,p(2)),:); %coordinates of point 2 in image 1
    im2_points2=points2(matchingPoints(2,p(2)),:); %coordinates of point 2 in image 2

    vec1=[im1_points2(1)-im1_points1(1);im1_points2(2)-im1_points1(2)];  %distance of the pairs
    vec2=[im2_points2(1)-im2_points1(1);im2_points2(2)-im2_points1(2)];

    dist=norm(vec2-vec1);  %distance between 2 vectors
    angle= atan2(vec2, vec1);  %angle between vectors
    h(:,j)=[angle; dist];  %transform vector for each couple of pairs
    e=0; %check best value
    for i=1:length(matchingPoints)  %loop for each pair
         if i~=p(1) & i~=p(2)  %we do not have to check the chosen points
            p_image2=[cos(angle) -sin(angle); sin(angle) cos(angle)].*points1(matchingPoints(1,i),:)+dist;
            %transformation on the coordinates of the point
            c=norm(p_image2-points1(matchingPoints(1,i),:));  %distance
            e=e+c;  %sum of distance of points
            if c<r  %check if sum is less than the threshold
                in(j,i)=i;   %create inlier and outlier vectors
                out(j,i)=0;
            else
                in(j,i)=0;
                out(j,i)=i;
            end
        end
        if e<ebest  %find the new best value if there is 
            ebest=e;
            best=j;
        end
   end
   H=h(:,best);
   inlierMatchingPoints=nonzeros(in(best,:));
   outlierMatchingPoints=nonzeros(out(best,:));
end
end