global sizeofmap;
sizeofmap = 100;
numberofpeaks = 1;
heightofpeaks = 20;
Emptymap = zeros(sizeofmap);

% Initialise peaks
for c = 1:numberofpeaks
    a = 1;
    b = sizeofmap;
    x = randi([1 sizeofmap],1,1);
    y = randi([1 sizeofmap],1,1);
    Emptymap(sizeofmap/2,sizeofmap/2) = heightofpeaks;
end

N = find(Emptymap == heightofpeaks);
for i = 1:heightofpeaks-1
    N= find(Emptymap == heightofpeaks+1-i);
    for j = 1:size(N)
    %     disp(i);
        [x,y] = convertXY(N(j));
%         disp(x);
%         disp(y);
        if (x>1 && y>1 && y<sizeofmap && x<sizeofmap) %|| (x<50 && y<50) || (x<50 && y>1) || (x>1 && y<50) 
            if Emptymap(x+1,y) == 0 
%                 disp(x);
                Emptymap(x+1,y) = Emptymap(x,y) - randomdec(Emptymap(x,y));
            end

            if Emptymap(x,y+1) == 0 
%                 disp(y);  
                Emptymap(x,y+1) = Emptymap(x,y) - randomdec(Emptymap(x,y));
            end
            if Emptymap(x-1,y) == 0 
%                 disp(x);
                Emptymap(x-1,y) = Emptymap(x,y) - randomdec(Emptymap(x,y));
            end
            if Emptymap(x,y-1) == 0
%                 disp(y);  
                Emptymap(x,y-1) = Emptymap(x,y) - randomdec(Emptymap(x,y));
            end
        end
    end
end

% [x,y] = convertXY(500);

range = [0,heightofpeaks];
imagesc(Emptymap,range);
figure(2)
surf(round(smoothdata(Emptymap))) ;


function [x,y] = convertXY(num)
    global sizeofmap;
    x = rem(num,sizeofmap);
    y = (num-x)/sizeofmap+1;
    if x == 0 
        x = sizeofmap;
        y = y-1;
    end
end 

function num = randomdec(height)
    num = abs(round(0.15*height*randn(1)));
end