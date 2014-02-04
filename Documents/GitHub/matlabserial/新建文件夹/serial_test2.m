
clc;

%%
% Use EraseMode,draw dynamically. Change axis dynamically.
% Multi-Line drawing line
global i;
global t;
global x;
global m;


t = [0];                    % initialize
m = [0 0 0];                    % initialize
i = 0;
x = -150 ;

p = plot(t,m,...
   'EraseMode','background','MarkerSize',5);
axis([x x+200 -6 6]);   % x = [-1.5 pi, 0.5 pi]
grid on;

%%
try 
s = serial('COM3');     % creat serial port obj
catch
    error('无法找到串口7');
    
end
set(s,'BaudRate',9600,'DataBits',8,'StopBits',1,...
    'Parity','none','FlowControl','none');  % set properties for serial

s.BytesAvailableFcnMode = 'terminator'; % byte number or terminator

s.BytesAvailableFcn = {@callback,p};   % {@mycallback,time}


fopen(s);
% 
% fprintf(s,'cd /');
% pause(1);           % pause function, 1s
% fprintf(s,'./matlab-serial');
% pause;           % pause function
% fprintf(s,'1,1');

 pause;      %right here is receiving the data and plot
fclose(s);
delete(s)
clear s
close all;
clear all;

