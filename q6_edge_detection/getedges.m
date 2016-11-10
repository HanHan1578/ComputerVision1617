function imgEdge = getedges(img, sigma, theta)
% insert your code here
    [w, h] = size(img);
    imgEdge = zeros(w,h);
%     img = gauss(img, sigma);
    [imgMag, imgDir]=gradmag(img, sigma);
    for i = 1:w
        for j = 1:h
            if imgMag(i,j)>=theta
                imgEdge(i,j) = 1;
            end
        end
    end
end
