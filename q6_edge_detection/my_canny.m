function edge_image = my_canny(img, sigma, theta_low, theta_high)
% insert your code here
    global visited;
    global img_res;
    [w, h] = size(img);
%     visited = zeros(w, h);
    edge_image = zeros(w,h);
    img_res = zeros(w,h);
    [imgMag, imgDir]=gradmag(img, sigma);
    for i = 1:w
        for j = 1:h
            if isnan(imgDir(i,j))==1
                imgDir(i,j) = 0;
            end
        end
    end
    imgMax = nonmaxsupcanny(imgMag, imgDir);
    visited = imgMax < theta_low;
    high = imgMax >= theta_high;
    visited(:,1) = true;
    visited(:,end) = true;
    visited(1,:) = true;
    visited(end,:) = true; 
    for i = 1:w
        for j = 1:h
            if visited(i,j) == true
                img_res(i,j) = 0;
            end
            if high(i,j) == true
                visited(i,j) = 1;
                img_res(i,j) = 1;
            end
        end
    end
    for i = 1:w
        for j = 1:h
            if visited(i,j) == false
                follow_edge(i, j);
            end       
        end
    end
    edge_image = img_res;
end

function [] = follow_edge(x, y)
global visited
global img_res;
visited(x,y) = true;
img_res(x,y) = 1;
offx = [1 1 0 -1 -1 -1 0 1];
offy = [0 1 1 1 0 -1 -1 -1];
    for i=1:8
        idx_x = x + offx(i);
        idx_y = y + offy(i);
        if visited(idx_x, idx_y) == false
            follow_edge(idx_x, idx_y);
        end
    end
end
