% Find update points for each PDM
function [normal_dirc] = normal(pdm)
pdm = reshape(pdm,2,64);
normal_dirc = [0 0];
for i=1:64
    % Calculate the normal for the ith point
    left = i-1;
    right = i+1;
    if i==1
        left = 64;
    end
    
    if i==64
        right = 1;
    end
    diff_left = -pdm(:,i) + pdm(:,left);
    diff_right = -pdm(:,right)+pdm(:,i);
    norm_left = norm(diff_left);
    norm_right =  norm(diff_right);
    normal_left = [-diff_left(2),diff_left(1)]/norm_left;
    normal_right = [-diff_right(2),diff_right(1)]/norm_right;
    normal = normal_left+normal_right;
    normal = normal/norm(normal);
    
    normal_dirc = [normal_dirc;normal];
    
    
    
end
normal_dirc = normal_dirc(2:end,:);
end