function [status, t, b, table] = mainTicTacToe(table,mode)
choose = 0;
while (choose == 0)
    table
    t = input( 'Choose empty space(1-9) : ');
    if (t > 9) && (t < 0) 
        status = 'p';
        disp('Please choose again');        
    elseif t == 0
        status = 'q';
        choose = 1;
    else
        status = 'p';
        x = ceil(t/3);
        y = t - (x-1)*3; 
        
        if (table(x,y) == 1) || (table(x,y) == 2)
            disp('You cannot choose here');
        else           
           table(x,y) = 1;
           
           status = checkwinTicTac(table);
           
           %------- bot part ---------------          
           if (length(find(table ~= 0)) ~= 9) && (status ~= 'w')   %bot play
                [table,b]= botTicTac(table,t,mode);
           else
               b = 0;                                                             %bot cannot play
           end
            %-------------------------------
            status = checkwinTicTac(table);
            
            choose = 1;
        end
             
    end 
end



