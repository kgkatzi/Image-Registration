function d = myLocalDescriptor(I,p,rhom,rhoM,rhostep ,N)  %get descriptor for a certain pixel
k=1;
empty=0;  %check if descriptor is empty
for i=rhom:rhostep:rhoM  %loop for every radius
    % Create a meshgrid of coordinates within the circle
    [x, y] = meshgrid(1:size(I, 2), 1:size(I, 1));
    circleMask = (x - p(1)).^2 + (y - p(2)).^2 <= i^2;

    % Apply the circle mask to the image
    imageWithCircle = I;   %get a specific circle of the image
    imageWithCircle(~circleMask) = 0; % Set pixels outside the circle to black (0)

    for j=0:N-1  %loop for every pixel part
       if round(p(1)+cos(2*j*pi/N)*i)<=0 | round(p(2)+sin(2*j*pi/N)*i)<=0 |round(p(2)+sin(2*j*pi/N)*i)>size(I,1) | round(p(2)+sin(2*j*pi/N)*i)> size(I,2)| round(p(1)+cos(2*j*pi/N)*i)>size(I,1)| round(p(1)+cos(2*j*pi/N)*i)>size(I,2)
          empty=1;  %if it gets out of the image limits descriptor stays empty
       else %get values
          xp(j+1)=imageWithCircle(round(p(1)+cos(2*j*pi/N)*i),round(p(2)+sin(2*j*pi/N)*i));
       end
    end

    if empty==0
        d(k)=mean(xp);  %save the values if it is not empty
    else
        d=[];  %empty descriptor
    end
    k=k+1;  %counter
end
end