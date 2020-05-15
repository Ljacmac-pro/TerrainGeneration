sizeofmap = 100;
numberofpeaks = 5;
heightofpeaks = 7;
Emptymap = zeros(sizeofmap);


for x = 1:sizeofmap-1
    for y= 1:x
        if x ~= y
            
%         disp("("+x+","+y+")"+" norm");
%         disp("("+y+","+x+")"+" reve");
            if x>1 && y>1
                Emptymap(x+1,y) = (Emptymap(x,y)+Emptymap(x+1,y-1))/2 + choosenum;
                Emptymap(x,y+1) = (Emptymap(x,y)+Emptymap(x-1,y+1))/2 +choosenum;
                Emptymap(y+1,x) = (Emptymap(y,x)+Emptymap(y+1,x-1))/2 + choosenum;
                Emptymap(y,x+1) = (Emptymap(y,x)+Emptymap(y-1,x+1))/2 +choosenum;
            else 
                Emptymap(x+1,y) = Emptymap(x,y) + choosenum;
                Emptymap(x,y+1) = round(Emptymap(x,y)) +choosenum;
                Emptymap(y+1,x) = Emptymap(y,x) + choosenum;
                Emptymap(y,x+1) = round(Emptymap(y,x)) +choosenum;
            end
%         Emptymap(x+1,y+1) = Emptymap(x,y) +choosenum;
        else 
%             disp("("+x+","+y+")"+" doub");
            Emptymap(x+1,y) = Emptymap(x,y) + choosenum;
            Emptymap(x,y+1) = Emptymap(x,y) +choosenum;
        end
%         if x ~= y   
% %             disp("("+x+","+y+")");
% % %             disp("("+y+","+x+")");
%             Emptymap(x+1,y) = Emptymap(x,y) + choosenum;
%             Emptymap(y,x+1) = Emptymap(y,x) +choosenum;
%             Emptymap(y+1,x+1) = Emptymap(y,x) +choosenum;
%         else
% %             disp("("+x+","+y+")");
%             Emptymap(x+1,y) = Emptymap(x,y) + choosenum;
%         end
% %         Emptymap(x,y) = Emptymap(x,y) + 1;
%         Emptymap(y,x) = Emptymap(y,x) +1;
    end
end

% Emptymap(100,100) = 30;
figure(1);
range = [-20,20];
imagesc(Emptymap,range);
figure(2)
 surf(round(smoothdata(Emptymap))) ;
% h = surf(round(smoothdata(Emptymap))) ;

% set(h, 'edgecolor','none')
% view(2)
% shading flat
% [X,Y,Z] = peaks(25);
% [X,Y,Z] = peaks(25);
% x = X(1,:) ;
% y = Y(:,1) ;
figure(1)
imagesc('XData',x,'YData',y,'CData',z)
% figure(2)
% surf(X,Y,Z) ;
% view(2)
% shading flat


function randomchoice = choosenum
    randomchoice = 0.2*round(1.2*randn(1));
end


% for i = 1:sizeofmap-next
%     Emptymap(start,next) = Emptymap(start,next) + 1;
%     Emptymap(next,start) = Emptymap(next,start) +1;
% %     Emptymap(next,next) = Emptymap(next,next) +1;
%     start = start +1;
%     next = next+1;
% end

% Initialise peaks
% for c = 1:numberofpeaks
%     a = 1;
%     b = sizeofmap;
%     x = randi([1 sizeofmap],1,1);
%     y = randi([1 sizeofmap],1,1);
%     Emptymap(x,y) = heightofpeaks;
% end
% 
% for highest = 1:heightofpeaks
%     for 


% B = Emptymap < heightofpeaks-1
% for x = 1:sizeofmap
%     for y = 1:sizeofmap
%         if B(x,y) == 1 
%             A(x+1,y)
%     end
% end
 


% for m = 1:10;
%     for x = 1:sizeofmap;
%         for y = 1:sizeofmap;
%             counter = 0; 
%             if x > 1
%                 if Emptymap(x-1,y)  
%                     counter = counter +1;
%                 end
%             end
%             if y > 1
%                 if Emptymap(x,y-1)
%         end
%     end
% end

    