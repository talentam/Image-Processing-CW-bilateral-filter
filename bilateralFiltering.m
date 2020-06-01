function outputImg = bilateralFiltering(img,r,space,range)
% f:image      r: filter size     space: space sigma     range: range sigma
[rows,columns] = size(img);
r = floor(r/2);
[x,y] = meshgrid(-r:r);
w1 = exp(-(x.^2+y.^2)/(2*space^2));     % space weight
img = im2double(img);
padding_img = padarray(img,[r r],'symmetric');
outputImg = zeros(rows,columns);
for i = r+1:rows+r
    for j = r+1:columns+r
        temp = padding_img(i-r:i+r,j-r:j+r);     % extract the image piece
        w2 = exp(-(temp-img(i-r,j-r)).^2/(2*range^2));    % range weight
        w = w1.*w2;                                       % combine two weight
        s = temp.*w;                                      % implement the filter
        outputImg(i-r,j-r) = sum(s(:))/sum(w(:));         
    end
end
end