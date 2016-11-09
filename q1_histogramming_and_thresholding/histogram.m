function hist = histogram(img)
% insert your code here
    [x, y] = size(img);
    index = [0:255];
    hist = zeros(1,length(index));
    for i = 1:x
        for j = 1:y
            h  = find(index == img(i,j));
            hist(h) = hist(h) + 1;
        end
    end

end
