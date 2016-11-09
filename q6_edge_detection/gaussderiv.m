function [imgDx, imgDy] = gaussderiv(img, sigma)
% insert your code here
    [w, h] = size(img);
    derivative_x = gaussdx(-ceil(w/2):ceil(w/2), sigma);
    imgDx = conv2(img, derivative_x(1:w), 'same');
    derivative_y = gaussdx(-ceil(h/2):ceil(h/2), sigma);
    imgDy = conv2(img, derivative_y(1:h)', 'same');    
end
