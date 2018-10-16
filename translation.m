% Return the scale and translation for each image
function [res] = translation(correct_pdms)

res = [0 0 0];

for i=1:32
    ins = reshape(correct_pdms(:,i),2,64);
    cen = mean(ins,2);
    disp(cen);
    min_c = min(ins(2,:));
    max_c = max(ins(2,:));
    inx_min = find(ins(2,:)==min_c);
    inx_max = find(ins(2,:)==max_c);
    res = [res;cen.'];
end
res = res(2:end,:);
end