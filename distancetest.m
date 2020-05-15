Map = zeros(10,10);

startpoint = [9,9];
endpoint = [10,10];

next1 = [10,9];
next2 = [2,2];

diffnewx = endpoint(1) - next1(1);
diffnewy = endpoint(2) - next1(2); 

diffoldx = endpoint(1) - startpoint(1);
diffoldy = endpoint(2) - startpoint(2);

olddist = (sqrt((diffoldx*diffoldx)+(diffoldy*diffoldy)));
newdist = (sqrt((diffnewx*diffnewx)+(diffnewy*diffnewy)));

disp(olddist);
disp(newdist);

changeindist = ((olddist-newdist))*(100/newdist)/olddist