function varargout = TicTacToeUI(varargin)
% TICTACTOEUI MATLAB code for TicTacToeUI.fig
%      TICTACTOEUI, by itself, creates a new TICTACTOEUI or raises the existing
%      singleton*.
%
%      H = TICTACTOEUI returns the handle to a new TICTACTOEUI or the handle to
%      the existing singleton*.
%
%      TICTACTOEUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TICTACTOEUI.M with the given input arguments.
%
%      TICTACTOEUI('Property','Value',...) creates a new TICTACTOEUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TicTacToeUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TicTacToeUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TicTacToeUI

% Last Modified by GUIDE v2.5 13-Apr-2017 02:24:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TicTacToeUI_OpeningFcn, ...
                   'gui_OutputFcn',  @TicTacToeUI_OutputFcn, ...
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


% --- Executes just before TicTacToeUI is made visible.
function TicTacToeUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TicTacToeUI (see VARARGIN)

% Choose default command line output for TicTacToeUI
handles.output = hObject;
global mode;

clc;
mode = 1;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TicTacToeUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TicTacToeUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure


varargout{1} = handles.output;


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA


% --- Executes on mouse press over axes background.
function axes3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function axes5_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function axes6_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function axes7_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function axes8_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function axes9_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function show_status_CreateFcn(hObject, eventdata, handles)
% hObject    handle to show_status (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in PlayButton.
function PlayButton_Callback(hObject, eventdata, handles)
% hObject    handle to PlayButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global status;
global Playstatus;
global mode;
Playstatus = 'p';
table = zeros(3,3);
set(handles.show_status, 'String', 'Start Playing..');

sw = get(handles.Mode, 'Value');                                   %select mode 
if sw == 0                                                                 % single player
    set(handles.Player1Text, 'String', ' - Computer');          % - (o)
    set(handles.Player2Text, 'String', ' - Player 1');            % - (x)
elseif sw == 1                                                            % multiple players
    set(handles.Player1Text, 'String', ' - Player 2');
    set(handles.Player2Text, 'String', ' - Player 1');    
end

while(Playstatus ~= 'q')
    if sw == 0
        [status, t, b, table] = mainTicTacToe(table,mode);
        
    elseif sw == 1               
        [status, t, b, table] = mainTicTacToe2Players(table);
    end
    % player (x)
    im1 = imread('cross.png');
    if t ==1
        axes(handles.axes1);
    elseif t == 2
        axes(handles.axes2);
    elseif t == 3
        axes(handles.axes3);
    elseif t == 4
        axes(handles.axes4);
    elseif t == 5
        axes(handles.axes5); 
    elseif t == 6
        axes(handles.axes6); 
    elseif t == 7
        axes(handles.axes7); 
    elseif t == 8
        axes(handles.axes8);   
    elseif t == 9
        axes(handles.axes9); 
    end         
    imshow(im1);    
        
    % bot (o)
    b
    if b ~= 0
        im2 = imread('circle.png');
        if b ==1
            axes(handles.axes1);
        elseif b == 2
            axes(handles.axes2);
        elseif b == 3
            axes(handles.axes3);
        elseif b == 4
            axes(handles.axes4);
        elseif b == 5
            axes(handles.axes5); 
        elseif b == 6
            axes(handles.axes6);    
        elseif b == 7
            axes(handles.axes7);        
        elseif b == 8
            axes(handles.axes8);     
        elseif b == 9
            axes(handles.axes9);   
        end     
        imshow(im2);
    end
%------ check win --------------
%     status = checkwinTicTac(table);
%-------------------------------
        if status == 'w'
            table
            disp('You win !!');
            textLabel1 = sprintf('You win !');
            textLabel2 = sprintf('Player1 wins !');
            if sw == 0
                set(handles.show_status, 'String', textLabel1);
            elseif sw == 1
                set(handles.show_status, 'String', textLabel2);                
            end
        elseif status == 'l'
             table
             disp('You lose !!');    
            textLabel1 = sprintf('You lose!');
            textLabel2 = sprintf('Player2 wins !');
            if sw == 0
                set(handles.show_status, 'String', textLabel1);
            elseif sw == 1
                set(handles.show_status, 'String', textLabel2);                
            end

        elseif status == 'd'
             table
             disp('Draw !!');
             textLabel1 = sprintf('Draw !');
             set(handles.show_status, 'String', textLabel1);

        elseif status == 'p'
               disp('Playing...'); 
               textLabel1 = sprintf('Playing... !');
               set(handles.show_status, 'String', textLabel1);
               Playstatus = 'p';
        end
    
    if status == 'w' || status == 'l' || status == 'd'
        d = input( 'Do you want to play again ? (y/n): ','s');
        if d == 'y'
            clear table;
            table = zeros(3,3);
            Playstatus = 'a';
            
            im3 = imread('blank.png');
            axes(handles.axes1); 
            imshow(im3);
            axes(handles.axes2); 
            imshow(im3);
            axes(handles.axes3); 
            imshow(im3);
            axes(handles.axes4); 
            imshow(im3);
            axes(handles.axes5); 
            imshow(im3);
            axes(handles.axes6); 
            imshow(im3);           
            axes(handles.axes7); 
            imshow(im3);
            axes(handles.axes8); 
            imshow(im3);
            axes(handles.axes9); 
            imshow(im3);       
                        
        elseif d == 'n'
            Playstatus = 'q';
        end 
    end  
end


% --- Executes on slider movement.
function Mode_Callback(hObject, eventdata, handles)
% hObject    handle to Mode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Mode_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function EasyMode_Callback(hObject, eventdata, handles)
% hObject    handle to EasyMode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mode;
mode =1;
set(handles.TextMode, 'String', 'EASY MODE');

% --------------------------------------------------------------------
function GodMod_Callback(hObject, eventdata, handles)
% hObject    handle to GodMod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mode;
mode = 2;
set(handles.TextMode, 'String', 'GOD MODE');
