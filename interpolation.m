function [gradient] = interpolation(point,gradx,grady)
delta_x = point(1)-floor(point(1));
delta_y = point(2)-floor(point(2));
x_m = floor(point(1));
x_p = ceil(point(1));
y_m = floor(point(2));
y_p = ceil(point(2));
gradient_x = delta_y*(delta_x*gradx(y_p,x_p)+(1-delta_x)*gradx(y_p,x_m))+(1-delta_y)*(delta_x*gradx(y_p,x_p)+(1-delta_x)*gradx(y_m,x_m));
gradient_y = delta_y*(delta_x*grady(y_p,x_p)+(1-delta_x)*grady(y_p,x_m))+(1-delta_y)*(delta_x*grady(y_p,x_p)+(1-delta_x)*grady(y_m,x_m));
gradient =[gradient_x,gradient_y];
end

