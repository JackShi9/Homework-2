% Computing the shape space
function [test,sigma,basis,mean_s] = shape_space(entire_data,k)
train = entire_data(:,1:24);
test = entire_data(:,25:32);
mean_s = sum(train,2)/24;
for i=1:24
    train(:,i) = train(:,i) - mean_s;
end
cov = train*train.';
[v,d] = eig(cov);
v = fliplr(v);
eig_val = flip(diag(d));
%scatter(1:128,eig_val,20,'filled');
basis = v(:,1:k);
sigma = sqrt(eig_val(1:k));
disp(sigma);
end