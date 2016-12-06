function out = dist2(vec1, vec2)

vec_tmp = (vec1 - vec2);


% for i = 1:size(vec_tmp,2)
out = sqrt(sum(vec_tmp.^2,2));
% end
