function [corners,d] = myDetectHarrisFeatures(I)  %output= corner coordinates and their descriptors
k=1;

if length(I)>1000     %reduce image size so that it can be scanned quicker
    I(2:2:size(I,1),:)=[];
    I(2:2:size(I,1),:)=[];
    I(:,2:2:size(I,2))=[];
    I(:,2:2:size(I,2))=[];
end

step=3;  %scan step=3 because mask is 3x3 anyway
th=100;  %threshold for isCorner function

for i=2:step:size(I,1)-2
    for j=2:step:size(I,2)-2  %scan the image with a 3x3 mask
        c = isCorner(I, [i,j], 0.05, th);  %use isCorner function to decide which pixels are corners
        if c==1   %save coordinates for pixels containing corners
            corners(k,:)=[i j];  %variable to save coordinates
            if isempty(myLocalDescriptor(I,[i,j],5,16,1,4))==0 %case for when descriptor is empty
                d(k,:) = myLocalDescriptor(I,[i,j],5,16,1,4);  %get descriptor for each pixel
            else
                d(k,:)=zeros(1,12);   %set to zero if descriptor is empty
            end
            k=k+1;  %counter
        end
    end
end
end