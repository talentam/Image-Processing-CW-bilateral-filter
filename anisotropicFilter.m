function outputImg = anisotropicFilter(img, r)
% img: input image          r: the size of the filter

%% similarity function: 1-d/D
[rows,columns] = size(img);         % get rows and columns of the image
r = floor(r/2);                     % padding size
img = im2double(padarray(img, [r r])); % padding
for i = 1+r:rows+r
    for j = 1+r:columns+r
        neighbor = abs(img(i, j) - img(i-r:i+r,j-r:j+r));   % calculate difference
        max_diff = max(max(neighbor));  % maximal difference 
        neighbor = 1-neighbor/max_diff; % similarity function
        sum_value = sum(neighbor(:));
        temp = img(i-r:i+r,j-r:j+r).*neighbor;  % implement the filter
        img(i, j) = sum(temp(:))/sum_value;
    end 
end
outputImg = img(1+r:rows+r, 1+r:columns+r);  % resize the image to the orginal size

%% similarity function: 1/1+((p-q)/k)^2
% K = 100;
% [rows,columns] = size(img);         % get rows and columns of the image
% r = floor(r/2);                     % padding size
% % img = im2double(padarray(img, [r r])); % padding
% img = double(padarray(img, [r r])); % padding
% for i = 1+r:rows+r
%     for j = 1+r:columns+r
%         neighbor = double(ones(r*2+1, r*2+1))./(1+((img(i, j)-img(i-r:i+r,j-r:j+r))/K).^2);
%         sum_value = sum(neighbor(:));
%         temp = img(i-r:i+r,j-r:j+r).*neighbor;  % implement the filter
%         img(i, j) = sum(temp(:))/sum_value;        
%     end 
% end
% outputImg = round(img(1+r:rows+r, 1+r:columns+r))/255;  % resize the image to the orginal size

%% similarity function: e^-((p-q)/k)^2
% K = 100;
% [rows,columns] = size(img);         % get rows and columns of the image
% r = floor(r/2);                     % padding size
% img = double(padarray(img, [r r])); % padding
% e = exp(1);
% for i = 1+r:rows+r
%     for j = 1+r:columns+r
%         neighbor = e.^(-((img(i, j)-img(i-r:i+r,j-r:j+r))/K).^2);
%         sum_value = sum(neighbor(:));
%         temp = img(i-r:i+r,j-r:j+r).*neighbor;  % implement the filter
%         img(i, j) = sum(temp(:))/sum_value;        
%     end 
% end
% outputImg = round(img(1+r:rows+r, 1+r:columns+r))/255;  % resize the image to the orginal size
end

