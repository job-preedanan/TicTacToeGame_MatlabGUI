function [table, b] = botTicTac(table,t,mode)
%--------------bot -------------- 
        
% 1.) if there are two in a row ,play on remaining square     /
% 2.) if there's move that creates two lines of two in a row, play here   /
% 3.) if center is free, play here
% 4.) if player has played in a corner, play opposite corner.
% 5.) if there's an empty corner, play here
% 6.) play on any empty square    /

% player
rp(1) = length(find(table(1,:) == 1)) ;                                                   
rp(2) = length(find(table(2,:) == 1)) ;         
rp(3) = length(find(table(3,:) == 1));                   
cp(1) = length((find(table(:,1) == 1))') ;                                                           
cp(2) = length((find(table(:,2) == 1))');                 
cp(3) = length((find(table(:,3) == 1))') ;         
dp(1) = length(find([table(1,1) table(2,2) table(3,3)] == 1));
dp(2) = length(find([table(1,3) table(2,2) table(3,1)] == 1));
% bot
rb(1) = length(find(table(1,:) == 2)) ;                                                   
rb(2) = length(find(table(2,:) == 2)) ;         
rb(3) = length(find(table(3,:) == 2));                   
cb(1) = length((find(table(:,1) == 2))') ;                                                           
cb(2) = length((find(table(:,2) == 2))');                 
cb(3) = length((find(table(:,3) == 2))') ;         
db(1) = length(find([table(1,1) table(2,2) table(3,3)] == 2));
db(2) = length(find([table(1,3) table(2,2) table(3,1)] == 2));

finish = 0;

%-----------------------------------------------------------------------------
% (1)

randcheck = [1 2 3];
randcheck = randcheck(randperm(length(randcheck)));
for j = 1:3
    switch randcheck(1,j)
        %check row
        case 1
            for i = 1:3
                if (rp(i) + rb(i) ~= 3)      % if full -> dont check 
                    % row player
                    if (rp(i) == 2 ) &&  (finish == 0)  
                       n = find(table(i,:) == 0);
                       table(i,n(1)) = 2;         b = ((i-1)*3) + n(1);     %bot move
                       finish = 1;   
                    end
                    % row bot
                    if (rb(i) == 2 ) &&   (finish == 0)  
                       n = find(table(i,:) == 0);   
                       table(i,n(1)) = 2;         b = ((i-1)*3) + n(1);     %bot move
                       finish = 1;
                    end  
                    
                end
            end
            
        %check col
        case 2
            for i = 1:3
                if (cp(i) + cb(i) ~= 3)     % if full -> dont check 
                    % col player
                    if (cp(i)== 2) &&   (finish == 0)
                       n = find(table(:,i) == 0);
                       table(n(1),i) = 2;       b = ((n(1)-1)*3) + i;        %bot move
                       finish = 1;
                    end
                    % col bot
                    if (cb(i)== 2) &&   (finish == 0)
                       n = find(table(:,i) == 0);
                       table(n(1),i) = 2;        b = ((n(1)-1)*3) + i;        %bot move
                       finish = 1;
                    end  
                    
                end
            end
            
        %check diagonal
        case 3
            if (dp(1) + db(1) ~= 3)     % if full -> dont check 
                %diagonal [\] player     
                if (dp(1) == 2) &&   (finish == 0)
                    n = find([table(1,1) table(2,2) table(3,3)] == 0);
                    table(n(1),n(1)) = 2;        b = (n(1)-1)*3 + n(1);        %bot move
                    finish = 1;
                end
                %diagonal [\] bot
                if (db(1) == 2) &&   (finish == 0)
                    n = find([table(1,1) table(2,2) table(3,3)] == 0);
                    table(n(1),n(1)) = 2;       b = (n(1)-1)*3 + n(1);        %bot move
                    finish = 1;
                end
                
            end
            
            if (dp(2) + db(2) ~= 3)     % if full -> dont check 
                %diagonal [/] player
                if (dp(2) == 2) &&   (finish == 0)
                    n = find([table(1,3) table(2,2) table(3,1)] == 0);
                    if n == 1
                        table(1,3) = 2;     b = 3;   
                    elseif n ==2 
                        table(2,2) = 2;     b = 5;  
                    elseif n ==3
                        table(3,1) = 2;     b = 7; 
                    end
                    finish = 1;       
                end
                %diagonal [/] bot
                if (db(2) == 2) &&   (finish == 0)
                    n = find([table(1,3) table(2,2) table(3,1)] == 0);
                    if n ==1
                        table(1,3) = 2;     b = 3;
                    elseif n ==2
                        table(2,2) = 2;     b = 5;
                    elseif n ==3
                        table(3,1) = 2;     b = 7;
                    end
                    finish = 1;       
                end
            end
    end
end
clear n;
%------------------------------------------------------------------------------

% (2)
randcheck = [1 2 3];
randcheck = randcheck(randperm(length(randcheck)));
for j = 1:3
    switch randcheck(1,j)
        %check row
        case 1
            for i = 1:3
                if (rb(i) == 1 ) && (rp(i) == 0 ) && (finish == 0)       %there are only 1 bot's O in a row
                   n = find(table(i,:) == 0);
                   d = datasample(n,1);
                   table(i,d) = 2;        b= (i-1)*3 + d;
                   finish = 1;
                end
            end
        %check col         
        case 2
            for i = 1:3
                if (cb(i) == 1) && (cp(i) == 0 ) && (finish == 0)     %there are only 1 bot's O in a column
                   n = find(table(:,i) == 0);
                   d = datasample(n,1);
                   table(d,i) = 2;        b= (d-1)*3 + i; 
                   finish = 1;
                end
            end
        %check diagonal
        case 3
            %check diagonal [\] player
            if (db(1) == 1) && (dp(1) == 0 ) && (finish == 0)        %there are only 1 bot's O in a diagonal [\]
                n = find([table(1,1) table(2,2) table(3,3)] == 0);
                d = datasample(n,1);
                table(d,d) = 2;        b= (d-1)*3 + d; 
                finish = 1;
            end
            
            %check diagonal [/] bot
            if (db(2) == 1) && (dp(2) == 0 ) && (finish == 0)
                n = find([table(1,3) table(2,2) table(3,1)] == 0);   %there are only 1 bot's O in a diagonal [/]
                n = datasample(n,1);
                if n ==1
                    table(1,3) = 2;       b = 3;
                elseif n ==2
                    table(2,2) = 2;       b = 5;
                elseif n ==3
                    table(3,1) = 2;       b = 7;
                end
                finish = 1;       
            end
    end
end
clear n;
%------------------------------------------------------------------------------


%% for God mode
if mode == 2
    % (3)
    if (table(2,2) == 0) && (finish == 0)
        table(2,2) = 2;        
        b = 5;
        finish = 1;
    end
    %------------------------------------------------------------------------------

    % (4)
    if (t == 1) && (finish == 0) && (table(3,3) == 0)            % top  left
        table(3,3) = 2;     
        b = 9;
        finish = 1;
    elseif (t == 3) && (finish == 0) && (table(3,1) == 0)       % top  right
        table(3,1) = 2;    
        b = 7;
        finish = 1;
    elseif (t == 7) && (finish == 0) && (table(1,3) == 0)       % bottom  left
        table(1,3) = 2;
        b = 3;
        finish = 1;
    elseif (t == 9) && (finish == 0) && (table(1,1) == 0)       % bottom  right
        table(1,1) = 2;
        b = 1;
        finish = 1;
    end
    %------------------------------------------------------------------------------

    % (5)
    if  ((table(1,1) == 0 )|| (table(1,3) == 0 ) || (table(3,1) == 0 ) || (table(3,3) == 0 )) && (finish == 0)
        d = datasample(find([table(1,1) table(1,3) table(3,1) table(3,3)] == 0),1);
        if d == 1
            table(1,1) = 2;    b = 1;
            finish = 1;
        elseif d == 2
            table(1,3) = 2;    b = 3;
            finish = 1;
        elseif d == 3    
            table(3,1) = 2;    b = 7;
            finish = 1;
        elseif d== 4
            table(3,3) = 2;    b = 9;
            finish = 1;
        end
    end
    
end
%------------------------------------------------------------------------------
%%
% (6) 
if finish == 0
    t = datasample(find(table == 0),1);
    y = ceil(t/3);
    x = t - (y-1)*3; 
    table(x,y) = 2;    b = (x-1)*3 + y;
end    
%------------------------------------------------------------------------------    
end

