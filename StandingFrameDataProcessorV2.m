function varargout = StandingFrameDataProcessorV2(varargin)
% STANDINGFRAMEDATAPROCESSOR MATLAB code for StandingFrameDataProcessor2.fig
%      STANDINGFRAMEDATAPROCESSOR, by itself, creates a new STANDINGFRAMEDATAPROCESSOR or raises the existing
%      singleton*.
%
%      H = STANDINGFRAMEDATAPROCESSOR returns the handle to a new STANDINGFRAMEDATAPROCESSOR or the handle to
%      the existing singleton*.
%
%      STANDINGFRAMEDATAPROCESSOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STANDINGFRAMEDATAPROCESSOR.M with the given input arguments.
%
%      STANDINGFRAMEDATAPROCESSOR('Property','Value',...) creates a new STANDINGFRAMEDATAPROCESSOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before StandingFrameDataProcessor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to StandingFrameDataProcessor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help StandingFrameDataProcessor

% Last Modified by GUIDE v2.5 15-Feb-2016 11:38:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @StandingFrameDataProcessorV2_OpeningFcn, ...
                   'gui_OutputFcn',  @StandingFrameDataProcessorV2_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before StandingFrameDataProcessorV2 is made visible.
function StandingFrameDataProcessorV2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to StandingFrameDataProcessor (see VARARGIN)

% Choose default command line output for StandingFrameDataProcessor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes StandingFrameDataProcessor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = StandingFrameDataProcessorV2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in readdata.
function openfile_Callback(hObject, eventdata, handles)
% hObject    handle to readdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% [FileName,PathName] = uigetfile('*.dat','Open Standing Frame Data');
% set(handles.text1, 'String',FileName);
% set(handles.text2, 'String','File opened');
% handles.FileName = FileName;
% handles.PathName = PathName;
% guidata(hObject, handles);
% text1 = TimeFileName;
% text2 = 'opening...';


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in readdata.
function readdata_Callback(hObject, eventdata, handles)
% hObject    handle to readdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.dat','Open Standing Frame Data');
set(handles.text1, 'String',FileName);
Status = {'File opened'};
set(handles.text2, 'String',Status);
handles.FileName = FileName;
% handles.PathName = PathName;
guidata(hObject, handles);
Status = [Status;{'Reading File...'}];
set(handles.text2, 'String',Status);
pause(0.001);
% PathName = handles.PathName;
% FileName = handles.FileName;
StandingFrameFile = [PathName FileName];
HeaderFid = fopen(StandingFrameFile);

% for i = 1:4;tline = fgets(HeaderFid);end;
% tline = fgets(HeaderFid);
% Header = sscanf(tline, '%s', [1, inf]);

M1 = csvread(StandingFrameFile,5,0);

L_LC = M1(:,1:3);
R_LC = M1(:,4:6);
L_FP = M1(:,7:14);
R_FP = M1(:,15:22);

handles.L_LC = L_LC;
handles.R_LC = R_LC;
handles.L_FP = L_FP;
handles.R_FP = R_FP;


Status = [Status;{'Reading Done'}];
set(handles.text2, 'String',Status);

% set(handles.checkbox1,'Value',1)
set(handles.LLC,'Value',1 )
set(handles.RLC,'Value',1 )
set(handles.LFP,'Value',1 )
set(handles.RFP,'Value',1 )

handles.Status = Status;
guidata(hObject, handles);

% --- Executes on button press in processdata.
function processdata_Callback(hObject, eventdata, handles)
% hObject    handle to processdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
DeviceInfo = [1 1 1 1];
CheckLLC = get(handles.LLC, 'Value');
CheckRLC = get(handles.RLC, 'Value');
CheckLFP = get(handles.LFP, 'Value');
CheckRFP = get(handles.RFP, 'Value');
DeviceInfo(1) = CheckLLC;
DeviceInfo(2) = CheckRLC;
DeviceInfo(3) = CheckLFP;
DeviceInfo(4) = CheckRFP;

DeviceLabel = SelectedDevices (DeviceInfo);
ColumnHeader = HeaderofSelectedDevices (DeviceInfo);

Status = handles.Status;
Status = [Status;{DeviceLabel}];


FileName = handles.FileName;
File1 = FileName(1:end-4);
L_LC = handles.L_LC;
R_LC = handles.R_LC;
L_FP = handles.L_FP;
R_FP = handles.R_FP;

[FinalData, FileSuffix, StatusText] = DataofSelectedDevices (DeviceInfo, L_LC, R_LC, L_FP, R_FP);

if DeviceInfo == [0 0 0 0]
    h = msgbox('Select Output Data', 'Error','error');
    set(handles.text2, 'String',Status);
else
    
%     set(handles.text2, 'String',num2str(size(FinalData)));
    columnHeader1 = sprintf(ColumnHeader); 
%     columnHeader1 = sprintf('RESEARCH STANDING FRAME DATA\nSCAN_RATE: 2000.0000\nSAMPLE_PER_PULSE: 250\n\nLLC-X,LLC-Y,LLC-Z,RLC-X,RLC-Y,RLC-Z,LFP-X COP,LFP-Y COP,LFP-Fx,LFP-Fy,LFP-Fz\n');  
    [file,path] = uiputfile([File1 FileSuffix],'Save Data As');
    c = [path file];
    fid = fopen(c,'w');
    fprintf(fid, '%s', columnHeader1);
    fclose(fid);
    Status = [Status;{StatusText}];
    set(handles.text2, 'String',Status);
    pause(0.001);
    dlmwrite(c ,FinalData,'-append','delimiter',',','newline','pc');
    Status = [Status;{'Saving done!'}];
    set(handles.text2, 'String', Status);
end




function display_Callback(hObject, eventdata, handles)
% hObject    handle to display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of display as text
%        str2double(get(hObject,'String')) returns contents of display as a double


% --- Executes during object creation, after setting all properties.
function display_CreateFcn(hObject, eventdata, handles)
% hObject    handle to display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in LLC.
function LLC_Callback(hObject, eventdata, handles)
% hObject    handle to LLC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of LLC


% --- Executes on button press in RLC.
function RLC_Callback(hObject, eventdata, handles)
% hObject    handle to RLC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RLC


% --- Executes on button press in LFP.
function LFP_Callback(hObject, eventdata, handles)
% hObject    handle to LFP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of LFP


% --- Executes on button press in RFP.
function RFP_Callback(hObject, eventdata, handles)
% hObject    handle to RFP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RFP
