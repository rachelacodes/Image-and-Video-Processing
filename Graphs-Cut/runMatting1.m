
N = 128;
colors = [1 0 0;
          0 0 1; 
          0 1 1;
          1 1 0
          0 1 0;
          0.4 0 0;
          1 1 1;
          0 0 0;];

I=double(imread(img_name))/255;


mI=double(imread(scribs_img_name))/255;
if (size(mI,3)==1)
   mI = cat(3,mI,mI,mI);
end
consts_map=sum(abs(I-mI),3)>0.01;


mask = imfill(consts_map,'holes');

se1=strel('disk',3);
consts_map=imerode(consts_map,se1);
 

R = consts_map.*I(:,:,1);
G = consts_map.*I(:,:,2);
B = consts_map.*I(:,:,3);
RGB = cat(3,R,G,B);

gray = rgb2gray(RGB);


mI_R = mI(:,:,1);
mI_G = mI(:,:,2);
mI_B = mI(:,:,3);
w=fspecial('average',5);   
 mI_R=imfilter(mI_R,w);   
 mI_G=imfilter(mI_G,w);   
 mI_B=imfilter(mI_B,w);

[L,nums] = bwlabel(mask,8);
tmp_zong = ones(size(mI_R))*9;


for i = 1:nums
    pixelss_R = mI_R(L==i);
    pixelss_G = mI_G(L==i);
    pixelss_B = mI_B(L==i);
    
    [Idx,C]=kmeans([pixelss_R,pixelss_G,pixelss_B],N); 
    
    mask_tmp = L==i & gray~=0;
    BW2 = bwareaopen(mask_tmp,10,8);
    
    grayc_R = mI_R(BW2==1);
    grayc_G = mI_G(BW2==1);
    grayc_B = mI_B(BW2==1);
    
    result = Idx(find(ismember(pixelss_R,grayc_R) & ismember(pixelss_G,grayc_G) & ismember(pixelss_B,grayc_B)));
    result = unique(result);

    tmp = zeros(size(mI_R));
    
    tmp(L==i) = ismember(Idx,result);
    tmp = bwareaopen(tmp,150,8);
    tmp = imfill(tmp,'holes');
    se1=strel('disk',1);
    tmp=imerode(tmp,se1);
    tmp=imdilate(tmp,se1);
    
    
    tmp_R = R(BW2==1);
    tmp_G = G(BW2==1);
    tmp_B = B(BW2==1);
    color_duibi = [ median(tmp_R) median(tmp_G) median(tmp_B)];
    color_duibi = repmat(color_duibi,8,1);
    [~,inxx] = min(sum(abs(color_duibi-colors),2));
    tmp_zong(tmp==1) = inxx;

end

imwrite(tmp_zong,colors,'tmp_m.png');
