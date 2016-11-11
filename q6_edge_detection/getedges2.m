function imgEdge = getedges2(img, sigma, theta)
% insert your code here
    [w, h] = size(img);
    imgEdge = zeros(w,h);    
%     img = gauss(img, sigma);
    [imgMag, imgDir]=gradmag(img, sigma);
    for i = 1:w
        for j = 1:h
            if isnan(imgDir(i,j))==1
                imgDir(i,j) = 0;
            end
        end
    end
    imgMax = nonmaxsupcanny(imgMag, imgDir);
    for i = 1:w
        for j = 1:h
            if imgMax(i,j)>=theta
                imgEdge(i,j) = 1;
            end
        end
    end
end
