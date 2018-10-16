function [mag,imgderx,imgdery] = derivative(im,sigma)
    im = imgaussfilt(im,sigma);
    [x,y] = imgradientxy(im);
    mag = sqrt(x.^2 + y.^2);
    imgderx = x;
    imgdery = y;
end

