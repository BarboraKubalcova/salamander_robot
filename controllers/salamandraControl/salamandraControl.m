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
p1 = wb_robot_get_device('1');
p2 = wb_robot_get_device('2');
p3 = wb_robot_get_device('3');
p4 = wb_robot_get_device('4');
p5 = wb_robot_get_device('5');
p6 = wb_robot_get_device('6');
%cez for to proste nejak neslo... tak ideme na istotu :D 

motor_front = wb_robot_get_device('motor_front');
wb_motor_set_position(motor_front, inf);
wb_motor_set_velocity(motor_front, 1.5);

motor_back = wb_robot_get_device('motor_back');
wb_motor_set_position(motor_back, inf);
wb_motor_set_velocity(motor_back, 1.5);

dist = wb_robot_get_device('ds');
wb_distance_sensor_enable(dist, TIME_STEP);

while wb_robot_step(TIME_STEP) ~= -1

  time = wb_robot_get_time();
  wb_motor_set_position(p1, sin(time+7)/2);
  wb_motor_set_position(p2, sin(time+5)/2);
  wb_motor_set_position(p3, sin(time+4)/2);
  wb_motor_set_position(p4, sin(time+3)/2);
  wb_motor_set_position(p5, sin(time+1)/2);
  wb_motor_set_position(p6, sin(time)/2);
  
  
  distance = wb_distance_sensor_get_value(dist);
  disp(distance);
  if distance < 500
    wb_motor_set_velocity(motor_front, 0);
    wb_motor_set_velocity(motor_back, 0);
    
  wb_motor_set_position(p1, 0);
  wb_motor_set_position(p2, 0);
  wb_motor_set_position(p3, 0);
  wb_motor_set_position(p4, 0);
  wb_motor_set_position(p5, 0);
  wb_motor_set_position(p6, 0);
  end
 
  
  
  % read the sensors, e.g.:
  %  rgb = wb_camera_get_image(camera);

  % Process here sensor data, images, etc.

  % send actuator commands, e.g.:
  %  wb_motor_set_postion(motor, 10.0);

  % if your code plots some graphics, it needs to flushed like this:
  drawnow;

end

% cleanup code goes here: write data to files, etc.
