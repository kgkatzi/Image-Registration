function d = myLocalDescriptorUpgrade(I,p,rhom,rhoM,rhostep ,N)  %used for a certain pixel
    k=1;  %counter
    empty=0;  %check if descriptor is empty
    for i=rhom:rhostep:rhoM   %loop for every radius

        % Create a meshgrid of coordinates within the circle
        [x, y] = meshgrid(1:size(I, 2), 1:size(I, 1));
        circleMask = (x - p(1)).^2 + (y - p(2)).^2 <= i^2;

        % Apply the circle mask to the image
        imageWithCircle = I;
        imageWithCircle(~circleMask) = 0; % Set pixels outside the circle to black (0)


        for j=0:N-1  %loop for every circle part
            if round(p(1)+cos(2*j*pi/N)*i)<=0 | round(p(2)+sin(2*j*pi/N)*i)<=0 |round(p(2)+sin(2*j*pi/N)*i)>size(I,1) | round(p(2)+sin(2*j*pi/N)*i)> size(I,2)| round(p(1)+cos(2*j*pi/N)*i)>size(I,1)| round(p(1)+cos(2*j*pi/N)*i)>size(I,2)
                empty=1;  %empty if it gets out of the pixel limits
            else
                xx=p(1):round(p(1)+cos(2*j*pi/N)*i);  %get all the pixel values between the radius
                if isempty(xx)  %if radius is too small just get the pixel values
                    xx=p(1);
                end
                yy=p(2):round(p(2)+sin(2*j*pi/N)*i);  %same for y axis
                if isempty(yy)
                    yy=p(2);
                end
                xp(j+1)=mean2(imageWithCircle(xx,yy));  %mean value
            end
        end

        if empty==0  %if descriptor is not empty save its data
            d(k)=mean(xp);
        else
            d=[];
        end
        k=k+1;
    end
end