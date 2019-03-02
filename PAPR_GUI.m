function varargout = PAPR_GUI(varargin)
% PAPR_GUI MATLAB code for PAPR_GUI.fig
%      PAPR_GUI, by itself, creates a new PAPR_GUI or raises the existing
%      singleton*.
%
%      H = PAPR_GUI returns the handle to a new PAPR_GUI or the handle to
%      the existing singleton*.
%
%      PAPR_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PAPR_GUI.M with the given input arguments.
%
%      PAPR_GUI('Property','Value',...) creates a new PAPR_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PAPR_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PAPR_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PAPR_GUI

% Last Modified by GUIDE v2.5 02-May-2018 22:27:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PAPR_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @PAPR_GUI_OutputFcn, ...
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


% --- Executes just before PAPR_GUI is made visible.
function PAPR_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PAPR_GUI (see VARARGIN)

% Choose default command line output for PAPR_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PAPR_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

addpath('Module')
addpath('Control')
addpath('View')


% --- Outputs from this function are returned to the command line.
function varargout = PAPR_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on selection change in pop_QAM.
function pop_QAM_Callback(hObject, eventdata, handles)
% hObject    handle to pop_QAM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_QAM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_QAM


% --- Executes during object creation, after setting all properties.
function pop_QAM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_QAM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_Length_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Length as text
%        str2double(get(hObject,'String')) returns contents of txt_Length as a double


% --- Executes during object creation, after setting all properties.
function txt_Length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pop_Size.
function pop_Size_Callback(hObject, eventdata, handles)
% hObject    handle to pop_Size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_Size contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_Size


% --- Executes during object creation, after setting all properties.
function pop_Size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_Size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu8.
function popupmenu8_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu8


% --- Executes during object creation, after setting all properties.
function popupmenu8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pop_PartitionNumber.
function pop_PartitionNumber_Callback(hObject, eventdata, handles)
% hObject    handle to pop_PartitionNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_PartitionNumber contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_PartitionNumber


% --- Executes during object creation, after setting all properties.
function pop_PartitionNumber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_PartitionNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_SLMAttempts_Callback(hObject, eventdata, handles)
% hObject    handle to txt_SLMAttempts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_SLMAttempts as text
%        str2double(get(hObject,'String')) returns contents of txt_SLMAttempts as a double


% --- Executes during object creation, after setting all properties.
function txt_SLMAttempts_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_SLMAttempts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_PTSAttempts_Callback(hObject, eventdata, handles)
% hObject    handle to txt_PTSAttempts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_PTSAttempts as text
%        str2double(get(hObject,'String')) returns contents of txt_PTSAttempts as a double


% --- Executes during object creation, after setting all properties.
function txt_PTSAttempts_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_PTSAttempts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_PhaseResolution_Callback(hObject, eventdata, handles)
% hObject    handle to txt_PhaseResolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_PhaseResolution as text
%        str2double(get(hObject,'String')) returns contents of txt_PhaseResolution as a double


% --- Executes during object creation, after setting all properties.
function txt_PhaseResolution_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_PhaseResolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cbx_OFDM.
function cbx_OFDM_Callback(hObject, eventdata, handles)
% hObject    handle to cbx_OFDM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbx_OFDM


% --- Executes on button press in cbx_SLM.
function cbx_SLM_Callback(hObject, eventdata, handles)
% hObject    handle to cbx_SLM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbx_SLM


% --- Executes on button press in cbx_PTS.
function cbx_PTS_Callback(hObject, eventdata, handles)
% hObject    handle to cbx_PTS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbx_PTS


% --- Executes on selection change in pop_Parameter.
function pop_Parameter_Callback(hObject, eventdata, handles)
% hObject    handle to pop_Parameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_Parameter contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_Parameter


% --- Executes during object creation, after setting all properties.
function pop_Parameter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_Parameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_Address_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Address (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Address as text
%        str2double(get(hObject,'String')) returns contents of txt_Address as a double


% --- Executes during object creation, after setting all properties.
function txt_Address_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Address (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_Browse.
function btn_Browse_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    [FileName, PathName] = uigetfile('*.txt', 'Select the parameter list');
    set(handles.txt_Address, 'String', [PathName FileName]);



function txt_Log_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Log as text
%        str2double(get(hObject,'String')) returns contents of txt_Log as a double


% --- Executes during object creation, after setting all properties.
function txt_Log_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end 


% --- Executes on button press in cbx_SaveGraph.
function cbx_SaveGraph_Callback(hObject, eventdata, handles)
% hObject    handle to cbx_SaveGraph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cbx_SaveGraph

function GUI_Objects_Enable(Enable, handles)
    if Enable
        en = 'on';
        txt = 'Simulate';
        color = 'green';
    else
        en = 'off';
        txt = 'Running';
        color = 'red';
    end
    set(handles.btn_Simulate, 'string', txt, 'enable', en, 'BackgroundColor', color);
    set(handles.cbx_OFDM, 'enable', en);
    set(handles.cbx_SLM, 'enable', en);
    set(handles.cbx_PTS, 'enable', en);
    set(handles.pop_QAM, 'enable', en);
    set(handles.txt_Carriers, 'enable', en);
    set(handles.txt_Length, 'enable', en);
    set(handles.pop_Size, 'enable', en);
    set(handles.txt_PhaseResolution, 'enable', en);
    set(handles.txt_SLMAttempts, 'enable', en);
    set(handles.pop_PartitionNumber, 'enable', en);
    set(handles.txt_PTSAttempts, 'enable', en);
    set(handles.pop_Parameter, 'enable', en);
    set(handles.cbx_SaveGraph, 'enable', en);

% --- Executes on button press in btn_Simulate.
function btn_Simulate_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Simulate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    %% GUI Objects
    % btn_Simulate          : stars simulation
    % txt_Log               : text box for logs and errors
    % cbx_OFDM              : run regular OFDM simulation
    % cbx_SLM               : run OFDM with SLM simulation
    % cbx_PTS               : run OFDM with PTS simulation
    % pop_QAM               : QAM modulation
    % txt_Carriers          : number of carriers
    % txt_Length            : number of OFDM symbols
    % pop_Size              : IFFT size
    % txt_PhaseResolution   : SLM and PTS phase resolution
    % txt_SLMAttempts       : number of reduction attempts using SLM
    % pop_PartitionNumber   : number of partitions in PTS
    % txt_PTSAttempts       : number of reduction attempts using PTS
    % pop_Parameter         : run a set from .txt file in parameters folder
    % cbx_SaveGraph         : check if you want to save the output graph
    % txt_GraphName         : graph name
    
    %% Clear
    cla
    clc
    legend('off')
    
    %% Initialize
    % Set GUI
    set(handles.txt_Log, 'string', '');
    GUI_Objects_Enable(false, handles);
    
    % Get Configurations
    pause(1)
    Ms = get(handles.pop_QAM, 'string');
    Mvalue = get(handles.pop_QAM, 'value');
    % QAM constellation order size
    Config.M = str2num(cell2mat(Ms(Mvalue)));
    % Number of carriers
    Config.Carriers_gui = str2num(get(handles.txt_Carriers, 'string'));
    Config.Carriers = Config.Carriers_gui;
    % Number of OFDM symbols to be simulated
    Config.m = str2num(get(handles.txt_Length, 'string'));
    Ns = get(handles.pop_Size, 'string');
    Nvalue = get(handles.pop_Size, 'value');
    % Size of OFDM symbols
    Config.N = str2num(Ns(Nvalue, :));
    % Number of partitions
    Config.PhaseRes = str2num(get(handles.txt_PhaseResolution, 'string'));
    % SLM resolution
    Config.SLMDeph = str2num(get(handles.txt_SLMAttempts, 'string'));
    PartitionNumbers = get(handles.pop_PartitionNumber, 'string');
    PartitionNumberValue = get(handles.pop_PartitionNumber, 'value');
    % Number of PTS partitions (=< q)
    Config.PTSPartitions = str2num(cell2mat(PartitionNumbers(PartitionNumberValue)));
    % PTS resolution
    Config.PTSDeph = str2num(get(handles.txt_PTSAttempts, 'string'));

    % Simulate regular OFDM tranceiver (0 - Not to simulate)
    Config.SimulateOFDM = get(handles.cbx_OFDM, 'value');
    % Simulate OFDM tranceiver with SLM (0 - Not to simulate)
    Config.SimulateSLM = get(handles.cbx_SLM, 'value');
    % Simulate OFDM tranceiver with PTS (0 - Not to simulate)
    Config.SimulatePTS = str2num(get(handles.txt_PTSAttempts, 'string'));

    Parameter = get(handles.pop_Parameter, 'value');
    ParameterNames = get(handles.pop_Parameter, 'string');
    
    %% Open Parameter List
    if Parameter == 1 % NONE
        Values = 0;
    else
        s = cell2mat(ParameterNames(Parameter));
        s(regexp(s,'[ ]'))=[];
        ValuesAddress = strcat('Parameters\', s, '.txt');
        fileID = fopen(ValuesAddress, 'r');
        Values = fscanf(fileID, '%d');
    end
    
    %% Check For Errors
    [Errors] = CheckForErrors(Config, Parameter, Values);
    
    if size(Errors) > 0
        % Set GUI it here are errors
        set(handles.txt_Log, 'string', Errors);
       
        GUI_Objects_Enable(true, handles)
        return
    end
    
    %% Simulation
    [TxPAPR, SimulationTime, SER, CCDF, Legend] = Configuration_Simulator(Config, Parameter, Values);
    
    %% Display
    % Plot
    PAPRDisplay_View(Config, CCDF, Legend);
    
    % Log
    if SER.Original ~= 0
        Log = strcat('Original Signal SER: ', num2str(SER.Original));
    elseif SER.Original ~= 0
        Log = strcat('SLM Signal SER: ', num2str(SER.SLM));
    elseif SER.Original ~= 0
        Log = strcat('PTS Signal SER: ', num2str(SER.PTS));
    else
        Log = 'Simulation Finished Successfully';
    end
    set(handles.txt_Log, 'string', Log);
    
    % Save To File
    saveFigure = get(handles.cbx_SaveGraph, 'value');
    
    if saveFigure ~= 0
        graphName = get(handles.txt_GraphName, 'string');
        if graphName == ""
            graphName = 'figure';
        end
        figure
        PAPRDisplay_View(Config, CCDF, Legend);
        saveas(gcf, graphName, 'jpg')
        close
    end
    
    % Set GUI
    
    GUI_Objects_Enable(true, handles)



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Length as text
%        str2double(get(hObject,'String')) returns contents of txt_Length as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_Carriers_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Carriers (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Carriers as text
%        str2double(get(hObject,'String')) returns contents of txt_Carriers as a double


% --- Executes during object creation, after setting all properties.
function txt_Carriers_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Carriers (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_GraphName_Callback(hObject, eventdata, handles)
% hObject    handle to txt_GraphName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_GraphName as text
%        str2double(get(hObject,'String')) returns contents of txt_GraphName as a double


% --- Executes during object creation, after setting all properties.
function txt_GraphName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_GraphName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
