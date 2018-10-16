function [new_p] = update(point,normal,gradx,grady)

temp  = point.';
for i=1:64
    %{
    interpolation((-6+j)*normal(i,:)+temp(i,:),gradx,grady)
    candidates = [temp(i,:)-5*normal(i,:);temp(i,:)-4*normal(i,:);temp(i,:)-3*normal(i,:);...
        temp(i,:)-2*normal(i,:);temp(i,:)-normal(i,:); temp(i,:); temp(i,:)+ normal(i,:);...
        temp(i,:)+2*normal(i,:); temp(i,:)+3*normal(i,:); temp(i,:)+4*normal(i,:);temp(i,:)+5*normal(i,:)];
    %}
    dir_gra=zeros(11,1);
    for j=1:11
        new_point=(-6+j)*normal(i,:)+temp(i,:);
        xder = interp2(gradx,new_point(1),new_point(2),'*nearest');
        yder = interp2(grady,new_point(1),new_point(2),'*nearest');
        dir_gra(j)=-dot(normal(i,:),[xder,yder]);
    end
    [~,ind]= max(dir_gra);
    temp(i,:) = (-6+ind)*normal(i,:)+temp(i,:);
end
new_p = temp.';
end

        

