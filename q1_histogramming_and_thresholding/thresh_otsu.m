function res = thresh_otsu(img)
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
    for threshold = 1:256
        w1 = sum(sum(img<=(threshold-1)))/numel(img);
        w2 = sum(sum(img>(threshold-1)))/numel(img);
        mu1_tmp = 0; mu2_tmp = 0;
        for t = 1:threshold
            if w1 == 0
                continue;
            end
            mu1_tmp = mu1_tmp + index(t)*(hist(t)/numel(img))/w1;
        end
        for tt = threshold+1:256
            if w2 == 0
                continue;
            end
            mu2_tmp = mu2_tmp + index(tt)*(hist(tt)/numel(img))/w2;
        end
        
        sigma1_tmp = 0; sigma2_tmp = 0;
        for t = 1:threshold
            if w1 == 0
                continue;
            end
            sigma1_tmp = sigma1_tmp + ((index(t)-mu1_tmp)^2)*(t-1)*(index(t)/numel(img))/w1;
        end
        for tt = threshold+1:256
            if w2 == 0
                continue;
            end
            sigma2_tmp = sigma2_tmp + (((index(tt))-mu2_tmp)^2)*(index(tt))*(hist(tt)/numel(img))/w2;
        end
        
        sigma_w(threshold) = w1*sigma1_tmp+w2*sigma2_tmp;
    end
        res = index(find(sigma_w==min(sigma_w)));
        
        for i = 1:x
            for j = 1:y
                if img(i,j)<=res
                    img(i,j) = 1;
                else
                    img(i,j) = 0;
                end
            end
        end
        res= img;
%         for j = 1:threshold
%             mu1_tmp = mu1_tmp + hist(j)*(j-1);
%         end
%         for k = threshold+1:256
%             mu2_tmp = mu2_tmp + hist(k)*(k-1);
%         end
%         if sum(hist(1:threshold)) == 0;
%             mu1 = 0;
%         else
%             mu1 = mu1_tmp/sum(hist(1:threshold));
%         end
%         if sum(hist(threshold+1:256)) == 0;
%             mu2 = 0;
%         else
%             mu2 = mu2_tmp/sum(hist(threshold+1:256));
%         end
%         sigma1_tmp = 0; sigma2_tmp = 0;
%         for ii = 1:threshold
%             sigma1_tmp = sigma1_tmp + ((ii-1) - mu1)^2*hist(ii);
%         end
%         for k = threshold:256
%             sigma2_tmp = sigma2_tmp + ((k-1 - mu2)^2*hist(k));
%         end
%         if sum(hist(1:threshold)) == 0;
%             sigma1 = 0;
%         else
%             sigma1 = sigma1_tmp/sum(hist(1:threshold));
%         end
%         if sum(hist(threshold+1:256)) == 0;
%             sigma2 = 0;
%         else
%             sigma2 = sigma2_tmp/sum(hist(threshold+1:256));
%         end
%         sigma(threshold) = w1*sigma1+w2*sigma2;
end
