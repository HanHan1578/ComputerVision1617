function [imgDx, imgDy] = gaussderiv(img, sigma)
% insert your code here
    [w, h] = size(img);
%     derivative_x = gaussdx(-ceil(w/2):ceil(w/2), sigma);
    derivative_x = gaussdx(-1:1, sigma);
    imgDx = conv2(img, derivative_x, 'same');
%     derivative_y = gaussdx(-ceil(h/2):ceil(h/2), sigma);
    derivative_y = gaussdx(-1:1, sigma);
    imgDy = conv2(img, derivative_y', 'same');    
end
