



% Start the test
test_image = im2double(reshape(greyimages(:,31),256,256));
[mag,x,y] = derivative(test_image,1);

init = correctpdms(:,31);
normal_dirc = normal(init);
new_p = update(reshape(init,2,64),normal_dirc,x,y);
new_p = reshape(new_p,128,1);
init = reshape(init,2,64).';
correctpdm_norm = process_data(correctpdms,0);
[test,sigma,basis,mean_s]= shape_space(correctpdm_norm,10);
quiver(init(:,1),init(:,2),normal_dirc(:,1),normal_dirc(:,2));
%{
for j=1:2
    cen_p = process_data(new_p,1);
    new_b = basis.'*(cen_p{1}-mean_s);
    
    for i = 1:10
        if new_b(i)>2.5*sigma(i)
            new_b(i) = 2.5*sigma(i);
        end
        if new_b(i)<-2.5*sigma(i)
            new_b(i) = -2.5*sigma(i);
        end
    end
    new_cen_p = mean_s + basis*new_b;
    new_cen_p = reshape(new_cen_p,2,64);
    new_p = repmat(cen_p{2},1,64)+cen_p{3}*new_cen_p;
    normal_dirc = normal(reshape(new_p,128,1));
    new_p = update(new_p,normal_dirc,x,y);
    new_p = reshape(new_p,128,1);
end


        




figure, hold on;

imagesc(test_image), colormap('gray');

plot( new_p(1:2:end), new_p(2:2:end), 'b.');

hold off;
%}
