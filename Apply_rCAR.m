function varargout = Apply_rCAR(varargin)
% APPLY_RCAR MATLAB code for Apply_rCAR.fig
%      APPLY_RCAR, by itself, creates a new APPLY_RCAR or raises the existing
%      singleton*.
%
%      H = APPLY_RCAR returns the handle to a new APPLY_RCAR or the handle to
%      the existing singleton*.
%
%      APPLY_RCAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPLY_RCAR.M with the given input arguments.
%
%      APPLY_RCAR('Property','Value',...) creates a new APPLY_RCAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Apply_rCAR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Apply_rCAR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Apply_rCAR

% Last Modified by GUIDE v2.5 02-Oct-2017 13:16:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Apply_rCAR_OpeningFcn, ...
    'gui_OutputFcn',  @Apply_rCAR_OutputFcn, ...
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



% --- Executes just before Apply_rCAR is made visible.
function Apply_rCAR_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Apply_rCAR (see VARARGIN)

currentFile = mfilename( 'fullpath' );
[pathstr,~,~] = fileparts( currentFile );
handles.data.pathstr=pathstr;
% change directory to the path of the current file
cd (char({handles.data.pathstr}));

handles.output = hObject;
handles.pushbutton2.Enable='off';
handles.pushbutton3.Enable='off';
handles.pushbutton5.Enable='off';
handles.data.exclude=[];
load ([handles.data.pathstr '\default.mat'], 'exc', 'ref');
handles.listbox2.String = exc;
handles.edit1.String = ref;
handles.popupmenu1.String = 1:feature('numcores');
handles.popupmenu1.Value = feature('numcores');

% Update handles structure
guidata(hObject, handles)

% UIWAIT makes Apply_rCAR wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = Apply_rCAR_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1



% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2



% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



% --- Executes on button press in pushbutton1.
% select input file(s)
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[fn pn]=uigetfile({'*.bdf','BioSemi (*.bdf)';...
    '*.cdt','NeuroScan CURRY (*.cdt)';...
    '*.cnt','NeuroScan continuous (*.cnt)';...
    '*.edf','European Data Format (*.edf)';...
    '*.vhdr','Brain vision Analyzer BVA (*.vhdr)'}, 'Select Input Files', 'MultiSelect', 'on' );

if ~isequal(fn,0) % proceed only if a file is selected
    
    if ~iscell(fn) % if one file is selected, convert the filename to a cell array
        totalFiles = 1;
        fn = {fn};
    else
        totalFiles = size(fn,2);
    end
    
    handles.data.totalFiles = totalFiles;
    handles.data.fn = fn;
    handles.data.pn = pn;
    
    file_no=1;
    
    % input file
    input_filename = char(fn(file_no));
    input_path_and_filename = [pn input_filename];
    [~,filename_only,input_file_extension] = fileparts( input_path_and_filename );
    
    % load input file according to its extension
    switch input_file_extension
        case '.vhdr'
            EEG = pop_loadbv(pn, input_filename, 1);
            
            % get EEG data
            % IMPORTANT - need to make sure data are double precision.
            data = double(EEG.data);
            
            % get number of channels
            n_ch = EEG.nbchan;
            
            % get channel names
            for c=1:1:n_ch
                chs0{c} = char(EEG.chanlocs(c).labels);
            end
            chs = char(chs0);
            
            
        case '.cnt'
            EEG = pop_loadcnt([pn  input_filename]);
            
            % get EEG data
            % IMPORTANT - need to make sure data are double precision.
            data = double(EEG.data);
            
            % get number of channels
            n_ch = EEG.nbchan;
            
            % get channel names
            for c=1:1:n_ch
                chs0{c} = char(EEG.chanlocs(c).labels);
            end
            chs = char(chs0);
            
            
        case '.cdt'
            EEG = pop_loadcurry([pn input_filename]);
            
            % get EEG data
            % IMPORTANT - need to make sure data are double precision.
            data = double(EEG.data);
            
            origdata = EEG.data;
            % get number of channels
            n_ch = EEG.nbchan;
            
            % get channel names
            for c=1:1:n_ch
                chs0{c} = char(EEG.chanlocs(c).labels);
            end
            chs = char(chs0);
            
            
        case '.edf'
            [data,header] = lab_read_edf_no_events(input_path_and_filename);
            origdata = data;
            n_ch = header.numchannels;
            
            % get channel names
            for c=1:1:n_ch
                chs0{c} = char(header.channels(c,:));
            end
            chs = char(chs0);
            
            
        case '.bdf'
            EEG = pop_biosig([pn input_filename],'ref',31);
            
            % get EEG data
            % IMPORTANT - need to make sure data are double precision.
            data = double(EEG.data);
            
            origdata = EEG.data;
            % get number of channels
            n_ch = EEG.nbchan;
            
            % get channel names
            for c=1:1:n_ch
                chs0{c} = char(EEG.chanlocs(c).labels);
            end
            chs = char(chs0);
    end
    
    handles.data.n_ch=n_ch;
    handles.data.chs=chs;
    handles.listbox1.Value=1;
    handles.listbox1.String=chs;
    handles.pushbutton2.Enable='on';
    handles.pushbutton5.Enable='on';
    handles.pushbutton3.Enable='on';
end
guidata(hObject,handles);
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton2.
% apply rCAR
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(gcp('nocreate'));
% output_folder = handles.data.output_folder;
totalFiles = handles.data.totalFiles;
fn = handles.data.fn;
pn = handles.data.pn;

% get the excluded channesl
channels = cellstr(handles.listbox1.String);
excluded_channels = cellstr(handles.listbox2.String);
handles.data.exclude = find (ismember(cellstr(channels),cellstr(excluded_channels)));
exclude = handles.data.exclude';

% get the re-refrence channel
re_reference_reference_channel_no = find(strcmp(cellstr(handles.listbox1.String),cellstr(handles.edit1.String)));
% if isempty(re_reference_reference_channel_no)
%     re_reference_reference_channel_no=0;
% end
output_folder = uigetdir(handles.data.pathstr, 'Select a folder to save output');

q=cellstr(handles.popupmenu1.String);
n_threads = str2double(q(handles.popupmenu1.Value))
if output_folder~=0
    guiApply_rCAR
end



% --- Executes on button press in pushbutton3.
% Select a channel to exclude
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
channels = cellstr(handles.listbox1.String);
excluded_channels = cellstr(handles.listbox2.String);
if (isempty(excluded_channels))
    n_excluded_channels = 0;
else
    if (strcmp(excluded_channels{1},''))
        n_excluded_channels = 0;
    else
        n_excluded_channels = size(excluded_channels,1);
    end
end

selected_channel_name = cellstr(handles.listbox1.String(handles.listbox1.Value,:));

%if selected_channel_name doesnt exist in the excluded_channels list yet
%then add it
if (sum(strcmp(selected_channel_name,excluded_channels))==0)
    if(n_excluded_channels==0)
        excluded_channels = selected_channel_name;
    else
        excluded_channels(n_excluded_channels+1) = selected_channel_name;
    end
    handles.listbox2.String = excluded_channels;
    %     handles.listbox2.String = [cellstr(excluded_channels); cellstr( selected_channel_name)]
end
% handles.data.exclude = find (ismember(cellstr(channels),cellstr(excluded_channels)));
guidata(hObject,handles);



% --- Executes on button press in pushbutton4.
% remove channel from excluded list
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
excluded_channels = cellstr(handles.listbox2.String);
inds = 1:size(excluded_channels,1);
keep = inds(inds~=handles.listbox2.Value);
if(handles.listbox2.Value>1)
    handles.listbox2.Value = handles.listbox2.Value-1;
end
handles.listbox2.String = excluded_channels(keep);
guidata(hObject,handles);



% --- Executes on button press in pushbutton5.
% select rereference channel
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
channels = cellstr(handles.listbox1.String);
selected_channel_name = cellstr(handles.listbox1.String(handles.listbox1.Value,:));
handles.edit1.String = selected_channel_name;
guidata(hObject,handles);



% --- Executes on button press in pushbutton6.
% load default exclusion and rereference channel data
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% open the default file
load ([handles.data.pathstr '\default.mat'], 'exc', 'ref');
handles.listbox2.Value=1;
handles.listbox2.String = exc;
handles.edit1.String = ref;
guidata(hObject,handles);



% --- Executes on button press in pushbutton7.
% save exclusion and rereference channel settings as defaults
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
exc = cellstr(handles.listbox2.String);
ref = cellstr(handles.edit1.String);
save ([handles.data.pathstr '\default.mat'], 'exc', 'ref');



% --- Executes on button press in pushbutton8.
% clear re-reference channel
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.edit1.String='';
guidata(hObject,handles);



% --- Executes on button press in pushbutton9.
% Show Readme.txt
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
popupmessage('Readme.txt');



% --- Executes on button press in pushbutton10.
% Show About
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
About_Apply_rCAR



% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
guidata(hObject,handles);



% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



