RGB = imread('tmp.png');
imshow(RGB)

X = rgb2lab(RGB);

%label matrix
L = superpixels(RGB,500);

%specifying rectangular ROI
f1 = drawrectangle(gca,'Color','yellow');
f2 = drawrectangle(gca,'Color','yellow');
f3 = drawrectangle(gca,'Color','yellow');

%mask of foreground
foreground = createMask(f1,RGB) + createMask (f2, RGB)+ createMask(f3, RGB);

%picking background
b1 = drawrectangle(gca,'Color','white');
b2 = drawrectangle(gca,'Color','white');
b3 = drawrectangle(gca,'Color', 'white');

%combining backgrounds 
background = createMask(b1,RGB) + createMask(b2,RGB) + createMask(b3,RGB);

%lazy snapping
BW = lazysnapping(RGB,L,foreground,background);

%graph cut
L = superpixels(X,7000,'IsInputLab',true);

%show results
imshow(labeloverlay(RGB,BW,'Colormap',[0 1 0]))

maskedImage = RGB;
maskedImage(repmat(~BW,[1 1 3])) = 0;
imshow(maskedImage)
