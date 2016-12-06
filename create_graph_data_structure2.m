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
% load('v_list_dec_1.mat');
% load('neib_up_to_4482.mat')

%% merge cells

% load('neib_00k.mat');
% for i = 1:9999
%     neib2{i} = neib{i};
% end
% load('neib_10k.mat');
% for i = 10000:19999
%     neib2{i} = neib{i};
% end
% load('neib_20k.mat');
% for i = 20000:29999
%     neib2{i} = neib{i};
% end
% load('neib_30k.mat');
% for i = 30000:39999
%     neib2{i} = neib{i};
% end
% load('neib_40k.mat');
% for i = 40000:49999
%     neib2{i} = neib{i};
% end
% load('neib_50k.mat');
% for i = 50000:60823
%     neib2{i} = neib{i};
% end
% 
% load('neib_tot.mat');

% for i =1:size(neib,2)
%     neib_no_dupe{i} = unique(neib{i},'rows');
% end
% 
% for i = 1:size(neib_no_dupe,2)
%     i
%     for j = 1:size(neib_no_dupe{i},1)
%         for l = 1:size(v_list,1)
%             if isequal(neib_no_dupe{i}(j,1:2),v_list(l,:))
%                 neib_no_dupe{i}(j,3) = l;
%                 neib_no_dupe{i}(j,4) = dist2(v_list(l,:),v_list(i,:));
%             end
%         end
% %         [~,loc] = ismember(neib_no_dupe{i}(:,1:2),v_list,'rows');
% %         neib_no_dupe{i}(:,3) = loc;
% %         clear loc;
%     end
% end
clear all; close all;clc
load('graphs_v_e_dec_2.mat');
% Elist = [];
% for i = 1:size(neib_no_dupe,2)
%     i
%     for j = 1:size(neib_no_dupe{i},1)
%         if size(neib_no_dupe{i},2) == 4 && neib_no_dupe{i}(j,3) > 0
%             Elist = [Elist;i neib_no_dupe{i}(j,3) neib_no_dupe{i}(j,4)];
%         end
%     end
% end
% e_list = [Elist; Elist(:,2) Elist(:,1) Elist(:,3)];
SID = 10000;
FID = 20000;
[costs,paths] = dijkstra(v_list,e_list,SID,FID);
% [costs,paths] = dijkstra(v_list,e_list);

% if isnan(paths)
%     error('no paths between two points')
% end
figure,
plot(v_list(paths,1), v_list(paths,2),'.-');

figure,
for i = 1:1000
    plt = v_list(e_list(i,1:2),:);
plot(plt(:,1),plt(:,2),'k-');
hold on;
end


% Adj = zeros(size(neib_no_dupe,2),size(neib_no_dupe,2));
% for i = 1:size(neib_no_dupe,2)
%     
%     Adj(i,neib_no_dupe{i}(:,3)) = neib_no_dupe{i}(:,4);
% end
% 
% SID = 1;
% FID = 10000;
% [costs,paths] = dijkstra(Adj,v_list,SID,FID);


% 
% 
% for l = 30000:39999
%     l
%     k = 0;
%     for i = 1:size(c_Poly2,2)
%         for j = 1:size(c_Poly2{i},1)
%             if isequal(c_Poly2{i}(j,:),v_list(l,:))
%                 if j == 1
%                     k = k+1;
%                     neib{l}(k,:) = c_Poly2{i}(j+1,:);
%                 elseif j == size(c_Poly2{i},1)
%                     k = k+1;
%                     neib{l}(k,:) = c_Poly2{i}(j-1,:);
%                 else
%                     k = k+1;
%                     neib{l}(k,:) = c_Poly2{i}(j-1,:);
%                     neib{l}(k,:) = c_Poly2{i}(j+1,:);
%                 end
%             end
%         end
%     end
% end
% 
% 

% 
% 
% v_list = [0 0];
% k = 0;
% for i = 1:size(c_Poly2,2)
%     i
%     for j = 1:size(c_Poly2{i},1)
%         if ~ismember(c_Poly2{i}(j,:),v_list,'rows')
%             k = k+1;
%             v_list = [v_list;c_Poly2{i}(j,:)];
%         end
%     end
% end
% v_list2 = v_list(2:size(v_list,1),:);
% clear v_list;
% v_list = v_list2;


idx= randsample(1:size(v_list,1),10);
pos = v_list(idx,:);
figure,
plot(pos(:,1),pos(:,2),'*');

