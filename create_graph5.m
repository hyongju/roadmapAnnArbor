% function A = create_graph(cell)
% load('c_Poly2_dec1.mat')

% cell = c_Poly2;

% v_list = [];
% k = 0;
% for i = 1:size(c_Poly2,2)
%     for j = 1:size(c_Poly2{i},1)
%         if ~ismember(c_Poly2{i}(j,:),v_list)
%             k = k+1;
%             v_list = [v_list;c_Poly2{i}(j,:)];
%         end
%     end
% end

for l = 50000:size(v_list,1)
    l
    k = 0;
    for i = 1:size(c_Poly2,2)
        for j = 1:size(c_Poly2{i},1)
            if isequal(c_Poly2{i}(j,:),v_list(l,:))
                if j == 1
                    k = k+1;
                    neib{l}(k,:) = c_Poly2{i}(j+1,:);
                elseif j == size(c_Poly2{i},1)
                    k = k+1;
                    neib{l}(k,:) = c_Poly2{i}(j-1,:);
                else
                    k = k+1;
                    neib{l}(k,:) = c_Poly2{i}(j-1,:);
                    neib{l}(k,:) = c_Poly2{i}(j+1,:);
                end
            end
        end
    end
end

save('neib_50k.mat')
