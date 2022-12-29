function varargout = Seg(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Seg_OpeningFcn, ...
                   'gui_OutputFcn',  @Seg_OutputFcn, ...
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

function Seg_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;


set(handles.radiobutton13,'value',1);
set(handles.radiobutton14,'value',0);
handles.radio_value = 1;
set(handles.pushbutton33,'Enable','on');
set(handles.popupmenu2,'Enable','off');


handles.background = [];
handles.color = [];

guidata(hObject, handles);



function varargout = Seg_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function figure1_CreateFcn(hObject, eventdata, handles)



function radiobutton13_Callback(hObject, eventdata, handles)


set(handles.radiobutton13,'value',1);
set(handles.radiobutton14,'value',0);
handles.radio_value = 1;
set(handles.pushbutton33,'Enable','on');
set(handles.popupmenu2,'Enable','off');

guidata(hObject, handles);


function radiobutton14_Callback(hObject, eventdata, handles)


set(handles.radiobutton13,'value',0);
set(handles.radiobutton14,'value',1);
handles.radio_value = 2;
set(handles.pushbutton33,'Enable','off');
set(handles.popupmenu2,'Enable','on');
guidata(hObject, handles);


function pushbutton33_Callback(hObject, eventdata, handles)




[filename,filepath] = uigetfile({'*.jpg;*.png;*.tif;*.jpeg;','Image Files (*.jpg;*.png;*.tif;*.jpeg)';...
    '*.*','All Files (*.*)'},'Select background for img_cut', '');
if (isequal(filename,0) || isequal(filepath,0))
    return;
end
filepath_full = fullfile(filepath, filename);
try
    background = imread(filepath_full);
catch me
    disp(me.message);
    errordlg('Please select a valid image file!', 'Warning');
    return;
end
handles.background = background;
guidata(hObject, handles);


function popupmenu2_Callback(hObject, eventdata, handles)

function popupmenu2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pushbutton35_Callback(hObject, eventdata, handles)


global Resultss;

Resultss.radio_value = handles.radio_value;
Resultss.background = handles.background;
Resultss.colorss = (get(handles.popupmenu2,'Value'));
Resultss.Edge  = (get(handles.checkbox1,'Value'));
Resultss.rr = str2num(get(handles.edit10,'String'));


close(Seg);


function checkbox1_Callback(hObject, eventdata, handles)




function edit10_Callback(hObject, eventdata, handles)

function edit10_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
