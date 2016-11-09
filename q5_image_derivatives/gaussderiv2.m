function [imgDxx, imgDxy, imgDyy] = gaussderiv2(img, sigma)
% insert your code here
    [w, h] = size(img);
    derivative_x = gaussdx(-ceil(w/2):ceil(w/2), sigma);
    imgDxx = conv2(img, derivative_x.*derivative_x, 'same');
    derivative_y = gaussdx(-ceil(h/2):ceil(h/2), sigma);
    imgDyy = conv2(img, derivative_y'.*derivative_y', 'same'); 
    imgDxy = conv2(img, derivative_x'*derivative_y, 'same');
end
