function [imgMag, imgDir]=gradmag(img, sigma)
% insert your code here
    [w, h] = size(img);   
    [imgDx, imgDy] = gaussderiv(img, sigma);
    imgMag = sqrt(imgDx.^2+imgDy.^2);
    imgDir = atan(imgDy./imgDx);
    
%     derivative_x = gaussdx(-ceil(w/2):ceil(w/2), sigma);    
%     derivative_y = gaussdx(-ceil(h/2):ceil(h/2), sigma);
%     derivative_x2 = derivative_x.*derivative_x;
%     derivative_y2 = derivative_y.*derivative_y;
%     Mag_tmp = zeros(length(derivative_x2), length(derivative_y2));
%     Dir_tmp = zeros(length(derivative_x2), length(derivative_y2));
%     for i = 1:length(derivative_x2)
%         for j = 1:length(derivative_y2)
%             Mag_tmp(i, j) = derivative_x2(i) + derivative_y2(j);
%             Dir_tmp(i, j) = derivative_y(j)/derivative_x(i);
%         end
%     end
%     Mag = sqrt(Mag_tmp);
%     Dir = atan(Dir_tmp);
%     imgMag = conv2(img, Mag, 'same');
%     imgDir = conv2(img, derivative_y(1:h)', 'same');   

end
