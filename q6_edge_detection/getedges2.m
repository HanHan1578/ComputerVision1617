function imgEdge = getedges2(img, sigma, theta)
% insert your code here
    [w, h] = size(img);
    imgEdge = zeros(w,h);
    [imgMag, imgDir]=gradmag(img, sigma);
    imgMax = nonmaxsupcanny(imgMag, imgDir);
    for i = 1:w
        for j = 1:h
            if imgMax(i,j)>=theta
                imgEdge(i,j) = 1;
            end
        end
    end
end
