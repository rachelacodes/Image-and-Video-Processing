function varargout = img_cut(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @img_cut_OpeningFcn, ...
                   'gui_OutputFcn',  @img_cut_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function img_cut_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

a = ones(5,7)*0.7;
imshow(a, 'Parent', handles.axes1);
imshow(a, 'Parent', handles.axes2);
imshow(a, 'Parent', handles.axes3,'border','tight','initialmagnification','fit');

handles.huatu = 0;

handles.radio_value = 1;

 handles.color_c = 1;

handles.filepath = pwd;
handles.filepath_full = '';


global ButtonDown pos1;
ButtonDown=[];
pos1=[];

global coordinate_total coordinate_once ncoo;

coordinate_total = []; 

coordinate_once = [];

ncoo = 0;

guidata(hObject, handles);



function varargout = img_cut_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


function Select_1_Callback(hObject, eventdata, handles)


[filename,filepath] = uigetfile({'*.jpg;*.png;*.tif;*.jpeg;','Image Files (*.jpg;*.png;*.tif;*.jpeg)';...
    '*.*','All Files (*.*)'},'Select an image for img_cut', handles.filepath);
if (isequal(filename,0) || isequal(filepath,0))
    return;
end
filepath_full = fullfile(filepath, filename);
if strcmp(filepath, handles.filepath_full)
    warndlg('Please select a different image file!', 'Warning');
    return;
end
try
    img = imread(filepath_full);
catch me
    disp(me.message);
    errordlg('Please select a valid image file!', 'Warning');
    return;
end

handles.img = img;
handles.filepath = filepath;
handles.filename = filename;

imshow(img, 'Parent', handles.axes1);

imshow(img, 'Parent', handles.axes3,'border','tight','initialmagnification','fit');
axis normal;

pix=getframe(handles.axes3);
imwrite(pix.cdata,'tmp_or.png','png')

guidata(hObject, handles);


function edit4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function edit4_Callback(hObject, eventdata, handles)

function pushbutton13_Callback(hObject, eventdata, handles)

[im,colormap] = imread('tmp_m.png');

img = handles.img;
[r,c,~] = size(img);
im_cx = imresize(im,[r,c],'nearest');
filepath = handles.filepath;
filename = handles.filename;
filename = [filename(1:end-4),'_mask.png'];
name_full = fullfile(filepath, filename);


[SaveVideoFileName,SaveVideoPathName,SaveVideoFilterIndex] = uiputfile(name_full,'Save the mask',...
    '');


if isequal(SaveVideoFileName,0) || isequal(SaveVideoPathName,0) || isequal(SaveVideoFilterIndex,0)
    disp('User seleceted Cancel');
else

    name_full = [SaveVideoPathName,'\',SaveVideoFileName];
    if isempty(colormap)
       imwrite(im_cx,name_full);
    else
       imwrite(im_cx,colormap,name_full); 
    end
    
end


function biaoji_Callback(hObject, eventdata, handles)


a = get(handles.biaoji,'string');
if strcmp(a, 'Start_Mark')
    handles.huatu = 1;
    set(handles.biaoji,'string','Stop');
else
    handles.huatu = 0;
    set(handles.biaoji,'string','Start_Mark');
end

guidata(hObject, handles); 


function pushbutton15_Callback(hObject, eventdata, handles)


function pushbutton17_Callback(hObject, eventdata, handles)


function radiobutton1_Callback(hObject, eventdata, handles)

set(handles.radiobutton1,'value',1);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);

handles.radio_value = 1;

radio_value = handles.radio_value;

colors = [1 0 0;
          0 0 1; 
          0 1 1;
          1 1 0
          0 1 0;
          0.4 0 0;
          1 1 1;
          0 0 0;];

handles.color_c = colors(radio_value,:);
guidata(hObject, handles); 

function radiobutton2_Callback(hObject, eventdata, handles)

set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',1);
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
handles.radio_value =2;
radio_value = handles.radio_value;

colors = [1 0 0;
          0 0 1; 
          0 1 1;
          1 1 0
          0 1 0;
          0.4 0 0;
          1 1 1;
          0 0 0;];

handles.color_c = colors(radio_value,:);
guidata(hObject, handles); 

function radiobutton3_Callback(hObject, eventdata, handles)

set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',1);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
handles.radio_value = 3;
radio_value = handles.radio_value;

colors = [1 0 0;
          0 0 1; 
          0 1 1;
          1 1 0
          0 1 0;
          0.4 0 0;
          1 1 1;
          0 0 0;];

handles.color_c = colors(radio_value,:);
guidata(hObject, handles); 

function radiobutton4_Callback(hObject, eventdata, handles)

set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',1);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
handles.radio_value = 4;
radio_value = handles.radio_value;

colors = [1 0 0;
          0 0 1; 
          0 1 1;
          1 1 0
          0 1 0;
          0.4 0 0;
          1 1 1;
          0 0 0;];

handles.color_c = colors(radio_value,:);
guidata(hObject, handles); 

function radiobutton5_Callback(hObject, eventdata, handles)

set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',1);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
handles.radio_value = 5;
radio_value = handles.radio_value;

colors = [1 0 0;
          0 0 1; 
          0 1 1;
          1 1 0
          0 1 0;
          0.4 0 0;
          1 1 1;
          0 0 0;];

handles.color_c = colors(radio_value,:);
guidata(hObject, handles); 

function radiobutton6_Callback(hObject, eventdata, handles)

set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',1);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',0);
handles.radio_value = 6;
radio_value = handles.radio_value;

colors = [1 0 0;
          0 0 1; 
          0 1 1;
          1 1 0
          0 1 0;
          0.4 0 0;
          1 1 1;
          0 0 0;];

handles.color_c = colors(radio_value,:);
guidata(hObject, handles); 

function radiobutton7_Callback(hObject, eventdata, handles)

set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',1);
set(handles.radiobutton8,'value',0);
handles.radio_value = 7;
radio_value = handles.radio_value;

colors = [1 0 0;
          0 0 1; 
          0 1 1;
          1 1 0
          0 1 0;
          0.4 0 0;
          1 1 1;
          0 0 0;];

handles.color_c = colors(radio_value,:);
guidata(hObject, handles); 

function radiobutton8_Callback(hObject, eventdata, handles)

set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
set(handles.radiobutton6,'value',0);
set(handles.radiobutton7,'value',0);
set(handles.radiobutton8,'value',1);
handles.radio_value = 8;
radio_value = handles.radio_value;

colors = [1 0 0;
          0 0 1; 
          0 1 1;
          1 1 0
          0 1 0;
          0.4 0 0;
          1 1 1;
          0 0 0;];

handles.color_c = colors(radio_value,:);
guidata(hObject, handles); 

function pushbutton18_Callback(hObject, eventdata, handles)

pix=getframe(handles.axes3);
imwrite(pix.cdata,'tmp.png','png')

img_name='tmp.png';
scribs_img_name='tmp_or.png';

runMatting1;
axes(handles.axes2);
imshow('tmp_m.png');

function figure1_WindowButtonDownFcn(hObject, eventdata, handles)

global ButtonDown pos1 coordinate_once;

if handles.huatu ==1

if strcmp(get(gcf,'SelectionType'),'normal')
ButtonDown=1; 
pos1=get(handles.axes3,'CurrentPoint'); 
coordinate_once = [coordinate_once;pos1];

end
end

function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)

color_c = handles.color_c;
global ButtonDown pos1 coordinate_once; 
if ButtonDown==1 
    pos=get(handles.axes3,'CurrentPoint');   
    line([pos1(1,1) pos(1,1)],[pos1(1,2) pos(1,2)],'LineWidth',4,'color',color_c);  
    pos1=pos;
    coordinate_once = [coordinate_once;pos1];
end

function figure1_WindowButtonUpFcn(hObject, eventdata, handles)

global ButtonDown pos1 coordinate_once coordinate_total ncoo;
if ~isempty(coordinate_once)
    color_c = handles.color_c;
    
    if length(coordinate_total) > ncoo
        coordinate_total(ncoo+1:end) = [];
    end
    ncoo = ncoo + 1;
    coordinate_total(ncoo).color_c = color_c;
    coordinate_total(ncoo).coordinate_once = coordinate_once;   
end
ButtonDown=[];
pos1=[];
coordinate_once = [];

function figure1_CreateFcn(hObject, eventdata, handles)

function pushbutton19_Callback(hObject, eventdata, handles)

axes(handles.axes3);
alpha(1);

function pushbutton20_Callback(hObject, eventdata, handles)

axes(handles.axes3);
alpha(0.5);

function pushbutton21_Callback(hObject, eventdata, handles)

global coordinate_total ncoo;

if ncoo-1 < 1
    return;
end

img = handles.img;
cla(handles.axes3);
axes(handles.axes3);
imshow(img);
hold on;



for i = 1:ncoo-1
    color_c = coordinate_total(i).color_c;
    poses = coordinate_total(i).coordinate_once;   
    line(poses(:,1),poses(:,2),'LineWidth',4,'color',color_c); 
end
hold off;
ncoo = ncoo-1;

function pushbutton22_Callback(hObject, eventdata, handles)

global coordinate_total ncoo;

if ncoo+1 > length(coordinate_total)
    return;
end

img = handles.img;
cla(handles.axes3);
axes(handles.axes3);
imshow(img);
hold on;



for i = 1:ncoo+1
    color_c = coordinate_total(i).color_c;
    poses = coordinate_total(i).coordinate_once;   
    line(poses(:,1),poses(:,2),'LineWidth',4,'color',color_c); 
end
hold off;
ncoo = ncoo+1;

function pushbutton23_Callback(hObject, eventdata, handles)

global coordinate_total ncoo;
img = handles.img;
cla(handles.axes3);
axes(handles.axes3);
imshow(img);
coordinate_total = [];
ncoo = 0;


function pushbutton24_Callback(hObject, eventdata, handles)


im = handles.img;
gray = rgb2gray(im);

prompt = {'Value:'};
dlg_title = 'Input';
num_lines = 1;
def = {'0.5'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
answer = str2num(answer{1});

bw = im2bw(gray,answer);


bw_name = 'tmp_m.png';
imwrite(bw,bw_name);
axes(handles.axes2);
imshow(bw_name);




function pushbutton25_Callback(hObject, eventdata, handles)

im = handles.img;
gray = rgb2gray(im);

level = graythresh(gray);
bw = im2bw(gray,level);


bw_name = 'tmp_m.png';
imwrite(bw,bw_name);
axes(handles.axes2);
imshow(bw_name);



function pushbutton27_Callback(hObject, eventdata, handles)


bw_name = 'tmp_m.png';
im = imread(bw_name);

tmp = zeros(size(im));
tmp(im==0) = 1;

imwrite(tmp,bw_name);
axes(handles.axes2);
imshow(bw_name);



function pushbutton28_Callback(hObject, eventdata, handles)



axes(handles.axes3);
im = handles.img;
imshow(im,'border','tight','initialmagnification','fit');
[x,y]=getpts;
hold on;

for i = 1:length(x)
    plot(x(i),y(i),'go', 'LineWidth',3);
end
drawnow;
hold off;

x1  = round(x);
y1 = round(y);


I = im ;

if size(I,3)==3
    I = rgb2gray(I);
end

I = im2double(I);

J=zeros(size(I));

for iii = 1:length(x1)

    seed=I(y1(iii),x1(iii));
    J(y1(iii),x1(iii))=1;
    J = GrayThreshold( J, I, seed );   
end

axes(handles.axes2);
imshow(J,[]);

bw_name = 'tmp_m.png';
imwrite(J,bw_name);



function Select_1_CreateFcn(hObject, eventdata, handles)

function pushbutton23_CreateFcn(hObject, eventdata, handles)

function pushbutton24_CreateFcn(hObject, eventdata, handles)

function pushbutton25_CreateFcn(hObject, eventdata, handles)

function pushbutton27_CreateFcn(hObject, eventdata, handles)

function pushbutton28_CreateFcn(hObject, eventdata, handles)

function pushbutton29_Callback(hObject, eventdata, handles)

global Resultss;

img= handles.img;
[m,n,dim] = size(img);

[maskss, colormap] = imread('tmp_m.png');
maskss_resize = [];
if isempty(colormap)
    maskss_resize = imresize(maskss,[m,n],'nearest');
    maskss_resize(maskss_resize~=0) = 1;
else
    maskss_tmp = zeros(size(maskss));
    maskss_tmp(maskss~=8)  =1;
    maskss_resize = imresize(maskss_tmp,[m,n],'nearest');
end

maskss_resize = bwareaopen(maskss_resize,30,8);



switch Resultss.radio_value
    case 1
        background = Resultss.background;
    case 2
        background = getimg(Resultss.colorss);
end

if size(background,3)==1
    background = cat(3,background,background,background);
end


background = double(imresize(background,[m,n]));
background_r = background(:,:,1);
background_g = background(:,:,2);
background_b = background(:,:,3);

img = double(img);

img_R = img(:,:,1);
img_G = img(:,:,2);
img_B = img(:,:,3);



img_R(maskss_resize==0)=0;
img_G(maskss_resize==0)=0;
img_B(maskss_resize==0)=0;

if Resultss.Edge ==0

    background_r(maskss_resize==1) = img_R(maskss_resize==1);
    background_g(maskss_resize==1) = img_G(maskss_resize==1);
    background_b(maskss_resize==1) = img_B(maskss_resize==1);
else

    se1=strel('disk',1);

    background_r_ = background_r;
    background_g_ = background_g;
    background_b_ = background_b;
    maskss_resize_tmp = maskss_resize;
    
    nnn  =linspace(0,1,Resultss.rr);
   for jj  = nnn
       maskss_resize_tmp = imerode(maskss_resize_tmp,se1);
       background_r(maskss_resize_tmp==1) = background_r_(maskss_resize_tmp==1)*(1-jj)+img_R(maskss_resize_tmp==1)*jj;
        background_g(maskss_resize_tmp==1) = background_g_(maskss_resize_tmp==1)*(1-jj)+img_G(maskss_resize_tmp==1)*jj;
        background_b(maskss_resize_tmp==1) =  background_b_(maskss_resize_tmp==1)*(1-jj)+img_B(maskss_resize_tmp==1)*jj;
   end
    
end
    

background_t = cat(3,background_r,background_g,background_b);

axes(handles.axes3);
imshow(uint8(background_t));

guidata(hObject, handles);


function pushbutton30_Callback(hObject, eventdata, handles)


axes(handles.axes3);
RGB = handles.img;
imshow(RGB,'border','tight','initialmagnification','fit');

X = rgb2lab(RGB);


L = superpixels(RGB,500);


f1 = drawrectangle(gca,'Color','yellow');
f2 = drawrectangle(gca,'Color','yellow');
f3 = drawrectangle(gca,'Color','yellow');


foreground = createMask(f1,RGB) + createMask (f2, RGB)+ createMask(f3, RGB);


b1 = drawrectangle(gca,'Color','white');
b2 = drawrectangle(gca,'Color','white');
b3 = drawrectangle(gca,'Color', 'white');


background = createMask(b1,RGB) + createMask(b2,RGB) + createMask(b3,RGB);


J = lazysnapping(RGB,L,foreground,background);

axes(handles.axes2);
imshow(J,[]);

bw_name = 'tmp_m.png';
imwrite(J,bw_name);


function pushbutton31_CreateFcn(hObject, eventdata, handles)

function pushbutton31_Callback(hObject, eventdata, handles)


figure(Seg);
