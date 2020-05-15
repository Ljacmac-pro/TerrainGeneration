global sizeofmap;
sizeofmap = 100;
numberofpeaks = 5;
heightofpeaks = 20;
Emptymap = zeros(sizeofmap);
Affectedmap = zeros(sizeofmap);
Placementmap = zeros(sizeofmap);
noiterations = 100;

% Initialise peaks
for c = 1:numberofpeaks
    a = 1;
    b = sizeofmap;
%     x = randi([1 sizeofmap],1,1);
%     y = randi([1 sizeofmap],1,1);
    x = sizeofmap/2;
    y = sizeofmap/2;
    Emptymap(x,y) = 26;
    Affectedmap(x,y) = 1;
%     Emptymap(27,27) = heightofpeaks;
%     Affectedmap(27,27) = 1;
%     Emptymap(75,70) = heightofpeaks;
%     Affectedmap(45,40) = 1;
    Placementmap(x,y)= 1;
    
end
% C = times(Emptymap,Affectedmap);
% disp(min(min(Emptymap(Emptymap>0))));

% N = find(Emptymap == heightofpeaks);
% nonZero = Affectedmap(Affectedmap == 0);
% length(unique(nonZero))
counter = 0;
for i = 1:noiterations
%      N= find(Emptymap == min(min(Emptymap(Emptymap>heightofpeaks-i))));
%      disp(min(min(Emptymap(Emptymap>heightofpeaks-i))));
    N = find(Affectedmap ==1);
%     N = N(randperm(length(N)));
    for j = 1:size(N)
%         counter = counter+1;
    %     disp(i);
        
        [x,y] = convertXY(N(j));
%         disp("X="+x+",Y="+y+",I="+i);
%         disp(y);
%         disp(x);
%         disp(y);
        if (x>2 && y>2 && y<sizeofmap-1 && x<sizeofmap-1) %|| (x<50 && y<50) || (x<50 && y>1) || (x>1 && y<50) 
            order = randperm(4);
%             order = [1,2,3,4];
            for ii = 1:numel(order)
%                 disp(order);
                switch order(ii);
        % Choose order randomly
                    case 1            
                        if Affectedmap(x,y+1)==0
                            avheight1 = Emptymap(x,y)*Affectedmap(x,y);
                            avheight2 = Emptymap(x,y+2)*Affectedmap(x,y+2);
                            avheight3 = Emptymap(x+1,y+1)*Affectedmap(x+1,y+1);
                            avheight4 = Emptymap(x-1,y+1)*Affectedmap(x-1,y+1);
                            noavg = Affectedmap(x,y)+Affectedmap(x,y+2)+Affectedmap(x+1,y+1)+Affectedmap(x-1,y+1);
                            avgheight = round((avheight1+avheight2+avheight3+avheight4)/noavg);
                            dec = randomdec(avgheight);
                            Emptymap(x,y+1) = avgheight - dec;
                            Affectedmap(x,y+1)=1;
%                             disp("X="+x+",Y="+(y+1)+",avg="+avgheight+",dec="+dec+",1");
                            Placementmap(x,y+1)=4000-counter;
                            counter = counter+1;
                        end            
                    case 2            
                        if Affectedmap(x,y-1) ==0
                            avheight1 = Emptymap(x,y-2)*Affectedmap(x,y-2);
                            avheight2 = Emptymap(x,y)*Affectedmap(x,y);
                            avheight3 = Emptymap(x+1,y-1)*Affectedmap(x+1,y-1);
                            avheight4 = Emptymap(x-1,y-1)*Affectedmap(x-1,y-1);
                            noavg = Affectedmap(x,y)+Affectedmap(x,y-2)+Affectedmap(x+1,y-1)+Affectedmap(x-1,y-1);
                            avgheight = round((avheight1+avheight2+avheight3+avheight4)/noavg);
                            dec = randomdec(avgheight);
                            Emptymap(x,y-1) = avgheight - dec;
                            Affectedmap(x,y-1) =1;
%                             disp("X="+x+",Y="+(y-1)+",avg="+avgheight+",dec="+dec+",2");
                            Placementmap(x,y-1)=4000-counter;
                            counter = counter+1;

                            

                        end
                    case 3            
                        if Affectedmap(x+1,y) == 0
                            avheight1 = Emptymap(x,y)*Affectedmap(x,y);
                            avheight2 = Emptymap(x+2,y)*Affectedmap(x+2,y);
                            avheight3 = Emptymap(x+1,y-1)*Affectedmap(x+1,y-1);
                            avheight4 = Emptymap(x+1,y+1)*Affectedmap(x+1,y+1);
                            noavg = Affectedmap(x,y)+Affectedmap(x+2,y)+Affectedmap(x+1,y+1)+Affectedmap(x+1,y-1);
                            avgheight = round((avheight1+avheight2+avheight3+avheight4)/noavg);
                            dec = randomdec(avgheight);
                            Emptymap(x+1,y) = Emptymap(x,y) - dec;
                            Affectedmap(x+1,y) = 1;
%                             disp("X="+(x+1)+",Y="+y+",avg="+avgheight+",dec="+dec+",3");
                            Placementmap(x+1,y)=4000-counter;
                            counter = counter+1;

                        end
                    case 4
                        if Affectedmap(x-1,y) ==0
                            avheight1 = Emptymap(x,y)*Affectedmap(x,y);
                            avheight2 = Emptymap(x-2,y)*Affectedmap(x-2,y);
                            avheight3 = Emptymap(x-1,y+1)*Affectedmap(x-1,y+1);
                            avheight4 = Emptymap(x-1,y-1)*Affectedmap(x-1,y-1);
                            noavg = Affectedmap(x-2,y)+Affectedmap(x,y)+Affectedmap(x-1,y+1)+Affectedmap(x-1,y-1);
                            avgheight = round((avheight1+avheight2+avheight3+avheight4)/noavg);
                            dec = randomdec(avgheight);
                            Emptymap(x-1,y) = Emptymap(x,y) - dec;
                            Affectedmap(x-1,y)=1;
%                             disp("X="+(x-1)+",Y="+y+",avg="+avgheight+",dec="+dec+",4" );
                            Placementmap(x-1,y)=4000-counter;
                            counter = counter+1;

                        end
                end
            end





            
        end
    end
    figure(noiterations)
    surf(round((Emptymap))) ;
end

[x,y] = convertXY(500);
% figure(1)
% range = [-5,heightofpeaks];
% imagesc(Emptymap,range);
% figure(2)
% surf(round(smoothdata(Emptymap))) ;
% figure(3)
% surf(Placementmap);


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
    leveloffheight=1;
    if height < leveloffheight
        num = (round(0.4*randn(1)));
    else
        num = abs(round(0.13*height*randn(1)));
    end
%       num = round(randn(1));
end
