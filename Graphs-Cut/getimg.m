function [img] = getimg(colors)


colora = [255,0,0;
           0,255,0;
           0.,0,255;
           255,255,0;
           0,255,255;
           0,0,0;
           255,255,255;
];

select_color = colora(colors,:);

img = zeros(50,50,3);
img(:,:,1) = select_color(1);
img(:,:,2) = select_color(2);
img(:,:,3) = select_color(3);

img = uint8(img);


end

