% MATLAB controller for Webots
% File:          salamandraControl.m
% Date:
% Description:
% Author:
% Modifications:

% uncomment the next two lines if you want to use
% MATLAB's desktop to interact with the controller:
%desktop;
%keyboard;

TIME_STEP = 64;

% get and enable devices, e.g.:
%  camera = wb_robot_get_device('camera');
%  wb_camera_enable(camera, TIME_STEP);
%  motor = wb_robot_get_device('motor');

% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination

%pivot_1 = wb_robot_get_device('1'); %pivot front
%wb_motor_set_position(pivot_1, 0.5);
motor_front = wb_robot_get_device('motor_front');
wb_motor_set_position(motor_front, inf);
wb_motor_set_velocity(motor_front, 4);

motor_back = wb_robot_get_device('motor_back');
wb_motor_set_position(motor_back, inf);
wb_motor_set_velocity(motor_back, 4);
% hello there
% general kenobi
while wb_robot_step(TIME_STEP) ~= -1

  
 
  % read the sensors, e.g.:
  %  rgb = wb_camera_get_image(camera);

  % Process here sensor data, images, etc.

  % send actuator commands, e.g.:
  %  wb_motor_set_postion(motor, 10.0);

  % if your code plots some graphics, it needs to flushed like this:
  drawnow;

end

% cleanup code goes here: write data to files, etc.
