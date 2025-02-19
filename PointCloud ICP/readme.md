# Turtlebot3 LiDAR Data Processing

This project aims to process LiDAR data from Turtlebot3 using Python. The process includes data collection, data cleaning with pandas, visualization of the LiDAR data, point cloud registration using the ICP algorithm, and estimation of the robot's state.

## Steps

1. **LiDAR Data Collection**: Collect LiDAR data from Turtlebot3 in the desired environment and save it as a text file (e.g., CSV format).

2. **Data Cleaning**: Use pandas library to clean the collected LiDAR data. Perform operations such as removing invalid data, handling missing values, etc.

3. **LiDAR Data Visualization**: Visualize the cleaned LiDAR data using matplotlib library. Plot scatter plots, radar charts, or any other suitable visualizations to represent the data.

4. **Point Cloud Registration with ICP**: Apply the Iterative Closest Point (ICP) algorithm to register and align two sets of point cloud data.

5. **Robot State Estimation**: Estimate the state of the robot based on the processed LiDAR data, which may include position, orientation, velocity, or other relevant parameters.

Please refer to the documentation or source code for detailed information on each step.

## Dependencies

- Python 3.x
- pandas
- matplotlib
- NumPy
- scikit-learn

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install the required dependencies:
