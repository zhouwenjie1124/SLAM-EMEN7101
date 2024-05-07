# Course Project 2 - Occupancy grid mapping

Occupancy grid mapping (OGM) is an algorithm in probabilistic robotics that generates maps with known poses, measurements and constant environments. Occupancy grids were first proposed by H. Moravec and A. Elfes in 1985.

## Preknowledge

***A lots of math TBA here.***

## OGM with 1-D laser range-finder

***A little bit of math and gragh TBA here.***

## Implement

Data is acquired using turtlebot lidar with manual maneuvering, logged by `rosbag` in ROS. Pose estimation using `gampping` package.

That `bag` format data is processed and merged into a list of frames that consist of state and measurement vector `pose`, `Range` and `angle` for further procedure.

`pose`: $[x, y, \psi]$ (X, Y position and yaw rotation)

`Range`, `angle`: Where laser projected and the detected distance.

OGM algorithm is implemented in `occGridMapping.m`.

### Determine grids using __Bresenham__ line algorithm

Bresenham's line algorithm is a line-drawing algorithm that determines points that should be selected in a gridded graph as an approximation of a line between 2 points. It is usually used in drawing lines in bitmaps.

<img src = "Bresenham.svg" alt="Bresenham SVG"/>

In our case, it is used to determine points that have a change in occupancy.

```
% Find grids hit by the rays (in the gird map coordinate)
x_occ = ranges(i,j) * cos(scanAngles(i,1) + theta) + x;
y_occ = -ranges(i,j) * sin(scanAngles(i,1) + theta) + y;

% Find occupied-measurement cells and free-measurement cells
ix_occ = ceil(x_occ * r) + myorigin(1);
iy_occ = ceil(y_occ * r) + myorigin(2);
[freex,freey]  = bresenham(car(1),car(2),ix_occ,iy_occ);
```

Here, `freex` and `freey` give the list of "free" grids; `x_occ` and `y_occ` indicate the occupied grid (where the laser hits). 

### Update occupancy

```
% update the map
myMap(occ) = myMap(occ) + lo_occ;
myMap(free) = myMap(free) - lo_free;
```

where `lo_occ` and `lo_free` are changes in the belief of occupation by a single measurement.

### Visualization 

```
imagesc(myMap);
```