function res = thresh_niblack(img, r, k)
% insert your code here
    [x, y] = size(img);
    img_tmp = zeros(x, y);
    for i = 1:x
        for j = 1:y
            [m, v] = get_window_mean_var(img, i, j, r);
            Tw = m + k*v^0.5;
            if img(i,j)>=Tw
                img_tmp(i,j) = 0;
            else
                img_tmp(i,j) = 1;
            end
            res(i,j) = img_tmp(i,j);
        end
    end
	
