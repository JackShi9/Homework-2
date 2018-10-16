% sort the points
function [res] = sort_points(pdms)
temp = pdms;
for i=1:32
    temp1 = reshape(temp(:,i),2,64);
    temp2 = temp1(:,1);
    temp1(:,1) = [];
    while size(temp2,1)~=128
        point = temp2(size(temp2)-1:size(temp2));
        diff = temp1(:,1) - point;
        dist = hypot(diff(1),diff(2));
        inx = 1;
        for j=2:size(temp1,2)
            diff = temp1(:,j) - point;
            if hypot(diff(1),diff(2))<dist
                inx = j;
            end
        end
        temp2 = [temp2;temp1(:,inx)];
        temp1(:,inx)=[];
    end
temp(:,i) = temp2;
end
res = temp;
end