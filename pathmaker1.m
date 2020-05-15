Finmap = zeros(10);%evalin('base', 'Emptymap');
Pathmap = zeros(10);
startpoint = [1,1];
Pathmap(startpoint) = 1;
endpoint = [10,10];
Finmap(5,5)=10;
Finmap(4,6)=10;
Finmap(6,4)=10;
Finmap(3,7)=10;
Finmap(7,3)=10;
currentpoint = startpoint;


while currentpoint(1) ~= endpoint(1) && currentpoint(2) ~= endpoint(2)
    x = currentpoint(1);
    y = currentpoint(2);
    neighs = neighboursof(x,y);
%     disp(neighs);
    lottery=[;];
    for i = 1:length(neighs)
%         disp([x,y]);
%         disp(neighs);
        score=0;
        newx = neighs(1,i);
        newy = neighs(2,i);
        disp([x,y]);
        disp([newx,newy]);
        disp(Finmap(x,y));
        disp(Finmap(newx,newy));

        heightdiff = abs(Finmap(x,y)-Finmap(newx,newy));


        diffnewx = endpoint(1) - newx;
        diffnewy = endpoint(2) - newy; 

        diffoldx = endpoint(1) - x;
        diffoldy = endpoint(2) - y;

        olddist = (sqrt((diffoldx*diffoldx)+(diffoldy*diffoldy)));
        newdist = (sqrt((diffnewx*diffnewx)+(diffnewy*diffnewy)));

        changeindist = ((olddist-newdist));
%         disp(changeindist);
        score = (20+(changeindist*30))/((heightdiff+1)*5);
        score = round(score);
        disp(score);
%         disp(score);
        for ii = 1:score
%             disp(newx);
%             disp(newy);
            lottery(size(lottery,1)+1,1) = newx;
            lottery(size(lottery,1),2) = newy;
        end
    end

    [x,y] = pickwinner(lottery);
    Pathmap(x,y) = 1;
    currentpoint = [x,y];
%     disp(currentpoint);
% disp([x,y]);
%     disp("");
end
Pathmap(endpoint(1),endpoint(2)) = 1;
figure(1)
range = [0,1];
imagesc(Pathmap,range);

figure(2)
range = [0,40];
% Finmap = evalin('base', 'Emptymap');
imagesc(Finmap,range);

% disp(neighboursof(1,10));

function [x,y] = pickwinner(lottery)
%     disp(size(lottery,1));
    Int = randi([1 size(lottery,1)],1,1);
    x = lottery(Int,1);
    y = lottery(Int,2);
end


function neighbours = neighboursof(x,y)
    neighbours = [;];
    if x>1
        neighbours(1,size(neighbours,2)+1) = x-1;
        neighbours(2,size(neighbours,2)) = y;
    end
    if y>1
        neighbours(1,size(neighbours,2)+1) = x;
        neighbours(2,size(neighbours,2)) = y-1;
    end
    if x<10
        neighbours(1,size(neighbours,2)+1) = x+1;
        neighbours(2,size(neighbours,2)) = y;
    end
    if y<10
        neighbours(1,size(neighbours,2)+1) = x;
        neighbours(2,size(neighbours,2)) = y+1;
    end 
    if x>1 && y>1
        neighbours(1,size(neighbours,2)+1) = x-1;
        neighbours(2,size(neighbours,2)) = y-1;
    end
    if x<10 && y<10
        neighbours(1,size(neighbours,2)+1) = x+1;
        neighbours(2,size(neighbours,2)) = y+1;
    end
    if x>1 && y<10
        neighbours(1,size(neighbours,2)+1) = x-1;
        neighbours(2,size(neighbours,2)) = y+1;
    end
    if x<10 && y>1
        neighbours(1,size(neighbours,2)+1) = x+1;
        neighbours(2,size(neighbours,2)) = y-1;
    end
end


