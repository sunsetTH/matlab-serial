
function callback(s,~,p,~,~)
    global i;
    global t;
    global x;
    global m;
    global t;
%     global idx;
%      p = plot(t,m,...
%               'EraseMode','background','MarkerSize',5);

    data = fscanf(s); %read data from s

   data = str2num(data);
%     end
%     if data>-2048 && data < 2048 %detect if data is legal
    %    disp('*******data comes! \n');
%     t=[t 0.01*i];   %0 0.1 0.2 0.3.. %Matrix 1*(i+1), column is increasing
 if numel(data)==3
 
    
        Data1=data./10;
    
    m=[m ;Data1]; %Matrix 2*(i+1), 2row, i+1 column.
     t=[t 1.1*i];   %0 0.1 0.2 0.3.. %Matrix 1*(i+1), column is increasing
     
     save('acc.mat','Data1')
%   if size(m)>1000;
%       m=[0;0;0];
%   end
    set(p(1),'Xdata',t,'YData',m(:,1),'LineWidth',1.5)
      set(p(2),'Xdata',t,'YData',m(:,2),'LineWidth',1.5)
      set(p(3),'Xdata',t,'YData',m(:,3),'LineWidth',1.5)
    
    drawnow
      x = x + 1;   % x = x+0.1
     axis([x  x+300 -400 400]);
%        pause(0.004);
     i = i+1;
     
  end
    end
    



