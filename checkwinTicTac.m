function status = checkwinTicTac(table)

r(1) = length(find(table(1,:) ~= 0)) ;                                                   
r(2) = length(find(table(2,:) ~= 0)) ;         
r(3) = length(find(table(3,:) ~= 0));                   
c(1) = length((find(table(:,1) ~= 0))') ;                                                           
c(2) = length((find(table(:,2) ~= 0))');                 
c(3) = length((find(table(:,3) ~= 0))') ;         
d(1) = length(find([table(1,1) table(2,2) table(3,3)] ~= 0));
d(2) = length(find([table(1,3) table(2,2) table(3,1)] ~= 0));
check = 0;


    %check row
    for i = 1:3
        if (r(i) == 3 ) &&   (check == 0)  
            if (length(find(table(i,:) == 1)) == 3)
                status = 'w';
                check = 1;   
            elseif (length(find(table(i,:) == 2)) == 3)
                status = 'l';
                check = 1;   
            end
        end
    end
    %check col
    for i = 1:3
        if (c(i) == 3) &&   (check == 0)
            if (length(find(table(:,i) == 1)) == 3)
                status = 'w';
                 check = 1;   
            elseif (length(find(table(:,i) == 2)) == 3)
                status = 'l';  
                 check = 1;   
            end        
        end
    end
    %check diagonal [\]
    if (d(1) == 3) &&   (check == 0)
        if (length(find([table(1,1) table(2,2) table(3,3)] == 1)) == 3);
            status = 'w';
            check = 1;   
        elseif (length(find([table(1,1) table(2,2) table(3,3)] == 2)) == 3);  
            status = 'l';
             check = 1;   
        end
    end
    %check diagonal [/]
    if (d(2) == 3) &&   (check == 0)
        if (length(find([table(1,3) table(2,2) table(3,1)] == 1)) == 3);
            status = 'w';
             check = 1;   
        elseif (length(find([table(1,3) table(2,2) table(3,1)] == 2)) == 3);  
            status = 'l';
             check = 1;   
        end 
    end

if (length(find(table ~= 0)) == 9 ) && (check == 0)   
    status = 'd';
elseif (length(find(table ~= 0)) ~= 9 ) && check == 0      %not finish playing
    status = 'p';
end