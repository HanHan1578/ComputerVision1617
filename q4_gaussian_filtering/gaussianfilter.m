function outimg = gaussianfilter(inimg, sigma)
% insert your code here
    [w, h] = size(inimg);
    window = 2*round(3*sigma)+1;
    outimg = zeros(w,h);
    
    for j = 1:w
        for i = 1:h-window+1
            gaussian = gauss(-round(3*sigma):round(3*sigma), sigma);
            if i == h-window+1
                x = inimg(j,i:end);
            else
%                 x = inimg(j,(i-1)*window+1:i*window);
                x = inimg(j,i:i+window-1);
            end
            if i == h-window+1
                gaussian = gaussian(1:length(x));
%                 outimg(j,(i-1)*window+1:end) = gaussian.*x;
                outimg(j,i) = sum(gaussian.*x);
            else
%                 outimg(j,(i-1)*window+1:i*window) = gaussian.*x;
                outimg(j,i) = sum(gaussian.*x);
            end
        end
    end
end
