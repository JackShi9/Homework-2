% Data normalization and orientation
function [data] = process_data(entire_data,entire)
pro = entire_data;
if size(pro,2)~=1
    for i=1:32
        pre = pro(:,i);
        pre = reshape(pre,[2,64]);
        ave = sum(pre,2)/64;
        for j=1:64
            pre(:,j) = pre(:,j) - ave;
        end
        cov = [0 0;0 0];

        for k=1:64
            cov = cov + pre(:,k)*pre(:,k).';
        end
        [v,~] = eig(cov);
        v = fliplr(v);
        for h=1:64
            pre(:,h) = v.'*pre(:,h);
        end
        pre = reshape(pre,128,1);
        pro(:,i)= pre;
    end
else
    pre = pro;
    pre = reshape(pre,[2,64]);
    ave = sum(pre,2)/64;
    for j=1:64
        pre(:,j) = pre(:,j) - ave;
    end
        cov = [0 0;0 0];

    for k=1:64
        cov = cov + pre(:,k)*pre(:,k).';
    end
    [v,~] = eig(cov);
    v = fliplr(v);
    for h=1:64
        pre(:,h) = v.'*pre(:,h);
    end
    pre = reshape(pre,128,1);
    pro= pre;
end
if entire==1
    data = {pro,ave,v};
else
    data = pro;
end
end