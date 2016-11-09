function res = thresh(img, threshold)
% insert your code here
    [x, y] = size(img);
    for i = 1:x
        for j = 1:y
            if img(i,j) >= threshold
                res(i,j) = 1;
            else
                res(i,j) = 0;
            end
        end
    end    
end
