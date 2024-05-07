
%% Map Parameter
% 1. Decide map resolution, i.e., the number of grids for 1 meter.
param.resol = 25;

% 2. Decide the initial map size in pixels
param.size = [250, 250];

% 3. Indicate where you will put the origin in pixels
param.origin = [125,125]; 

% 4. Log-odd parameters 
param.lo_occ = 1;
param.lo_free = 0.5; 
param.lo_max = 100;
param.lo_min = -100;

%% Input Data
initialValue = 0.0270;
step = 0.0265;
angle = initialValue + (0:235) * step;
scanAngles = angle';
Ranges = zeros(236,length(Robot_data));
Pose = zeros(3,length(Robot_data));


for i=1:length(Robot_data)
    if numel(Robot_data(i).Ranges) > 236
        Ranges(:,i) = Robot_data(i).Ranges(1:236);
    elseif numel(Robot_data(i).Ranges) < 236
        Ranges(1:length(Robot_data(i).Ranges),i) = Robot_data(i).Ranges; 
    else
    Ranges(:,i) = Robot_data(i).Ranges;
    end
    Pose(:,i) = Robot_data(i).pose;
end

myMap = occGridMapping(Ranges, scanAngles, Pose, param);

% The final grid map: 
% figure,
% imagesc(myMap); 
% colormap('gray'); axis equal;

