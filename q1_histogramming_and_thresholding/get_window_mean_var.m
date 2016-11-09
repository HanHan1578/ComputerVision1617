function [m, v] = get_window_mean_var(img, x, y, r)
% insert your code here 
    [w, h] = size(img);
    a = 1; b = 1;
    xm = x - r; xM = x + r;
    ym = y - r; yM = y + r;
    if xm <= 0
        xm = 1;
    else if xM > w
            xM = w;
        end
    end
    if ym <= 0
        ym = 1;
    else if yM > h
            yM = h;
        end
    end
    img_tmp = zeros(length(xm:xM),length(ym:yM));
    for i = xm:xM
        b = 1;        
        for j = ym:yM            
            img_tmp(a,b) = img(i,j);
            b = b+1;
        end
        a = a+1;
    end
    m = mean(img_tmp(:));
    v = var(img_tmp(:));
end
