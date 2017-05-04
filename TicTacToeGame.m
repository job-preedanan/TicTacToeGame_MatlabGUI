clc;
clear;

table = zeros(3,3);
while(1)
    table
    t = input( 'Choose empty space(1-9) : ');
    if (t > 9) && (t < 0) 
        disp('Please choose again');
    elseif t == 0
        break;
    else
        x = ceil(t/3);
        y = t - (x-1)*3; 
        
        if (table(x,y) == 1) || (table(x,y) == 2); 
            disp('You cannot choose here');
        else
           table(x,y) = 1;
           
           
           %------- bot part ---------------          
           if length(find(table ~= 0)) ~= 9
                table = botTicTac(table);
           end
            %-------------------------------
           
            %------ check win --------------
            status = checkwinTicTac(table);
            if status == 'w'
                table
                disp('You win !!');
                d = input( 'Do you want to play again ? (y/n): ','s');
                if d == 'y'
                    clear table;
                elseif d == 'n'
                    break;
                end
            elseif status == 'l'
                table
                disp('You lose !!');
                d = input( 'Do you want to play again ? (y/n): ','s');
                if d == 'y'
                    clear table;
                elseif d == 'n'
                    break;
                end       
            elseif status == 'd'
                table
                disp('Draw !!');
                d = input( 'Do you want to play again ? (y/n): ','s');
                if d == 'y'
                    clear table;
                elseif d == 'n'
                    break;
                end        
            elseif status == 'p'
                disp('Playing...');      
            end
            %-------------------------------
        
        end
             
    end
    
end
disp('Finish');
