function outimg = gaussianfilter(inimg, sigma)
% insert your code here
    [w, h] = size(inimg);
    window = 2*round(3*sigma)+1;
    outimg = zeros(w,h);
    gaussian = gauss(-3*sigma:3*sigma, sigma);
%     outimg_tmp = conv2(inimg, gaussian, 'same');
%     gaussian = gauss(-3*sigma:3*sigma, sigma);
%     outimg = conv2(outimg_tmp, gaussian', 'same'); 
outimg_tmp = zeros(w+2*round(3*sigma),h+2*round(3*sigma));
outimg_tmp2 = zeros(w+2*round(3*sigma),h+2*round(3*sigma));
outimg_tmp3 = zeros(w+2*round(3*sigma),h+2*round(3*sigma));
    for i = 1:w
        for j = 1:h
            outimg_tmp(i+round(3*sigma)-1,j+round(3*sigma)-1) = inimg(i, j);
        end
    end
    for i = round(3*sigma)+1:w+round(3*sigma)
        for j = round(3*sigma)+1:h+round(3*sigma)
            outimg_tmp2(i,j) = sum(outimg_tmp(i, j-round(3*sigma):j+round(3*sigma)).*gaussian);
        end
    end
    for i = round(3*sigma)+1:w+round(3*sigma)
        for j = round(3*sigma)+1:h+round(3*sigma)
            outimg_tmp3(i,j) = sum(outimg_tmp2(i-round(3*sigma):i+round(3*sigma), j).*gaussian');
        end
    end
    for i = 1:w
        for j = 1:h
            outimg(i,j) = outimg_tmp3(i+round(3*sigma),j+round(3*sigma));
        end
    end
%     for j = 1:w
%         for i = 1:h-window+1
%             gaussian = gauss(-round(3*sigma):round(3*sigma), sigma);
%             if i == h-window+1
%                 x = inimg(j,i:end);
%             else
% %                 x = inimg(j,(i-1)*window+1:i*window);
%                 x = inimg(j,i:i+window-1);
%             end
%             if i == h-window+1
%                 gaussian = gaussian(1:length(x));
% %                 outimg(j,(i-1)*window+1:end) = gaussian.*x;
%                 outimg(j,i) = sum(gaussian.*x);
%             else
% %                 outimg(j,(i-1)*window+1:i*window) = gaussian.*x;
%                 outimg(j,i) = sum(gaussian.*x);
%             end
%         end
%     end
end
