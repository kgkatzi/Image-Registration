function c = isCorner(I, p, k, Rthres)  %used for a certain pixel and decide if it contains a corner

[x, y] = meshgrid(-1:1, -1:1);
w=exp(-(x.^2+y.^2)/16); %mask 3x3

I1=conv2(I,[1 0 -1;1 0 -1; 1 0 -1]);  %partial derivatives with convoluion
I2=conv2(I,[1 1 1; 0 0 0; -1 -1 -1]);

a=I1.^2;  %used for matrix M
b=I1.*I2;
c=I2.^2;

a_part=a(p(1)-1:p(1)+1,p(2)-1:p(2)+1);   %only around the pixel
b_part=b(p(1)-1:p(1)+1:p(2)-1:p(2)+1);
c_part=c(p(1)-1:p(1)+1,p(2)-1:p(2)+1);

a_with_mask=conv2(a_part,w);  %use mask
b_with_mask=conv2(b_part,w);
c_with_mask=conv2(c_part,w);

a_sum=sum(a_with_mask,"all");  %sum
b_sum=sum(b_with_mask,"all");
c_sum=sum(c_with_mask,"all");

M=[a_sum b_sum; b_sum c_sum];
R=det(M)-k*trace(M).^2;  %variable to decide
if R>Rthres  %depends on the threshold
    c=1;
else
    c=0;
end

end