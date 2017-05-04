function [status, p1, p2, table] = mainTicTacToe2Players(table)
    % player1 turn
    table
    p1 = input( 'Player 1 : ');
    if (p1 > 9) && (p1 < 0) 
        disp('Please choose again');
    elseif p1 == 0
        status = 'q';
    else
        status = 'p';
        x = ceil(p1/3);
        y = p1 - (x-1)*3; 
        
        if (table(x,y) == 1) || (table(x,y) == 2)
            disp('You cannot choose here');
        else
           table(x,y) = 1;                  
        end
            
    end
    status = checkwinTicTac(table);
    
    if status ~= 'w'
        %player2 turn
        table
        p2 = input( 'Player 2 : ');
        if (p1 > 9) && (p1 < 0) 
            disp('Please choose again');
        elseif p2 == 0
            status = 'q';
        else
            status = 'p';
            x = ceil(p2/3);
            y = p2 - (x-1)*3; 

            if (table(x,y) == 1) || (table(x,y) == 2)
                disp('You cannot choose here');
            else
               table(x,y) = 2;                  
            end

        end 
        status = checkwinTicTac(table);
    else
        p2 = 0;
    end
end