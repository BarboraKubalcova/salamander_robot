% MATLAB controller for Webots
% File:          salamandraControl.m
% Date:           
% Description:
% Author:  Barbora Kubalcova
% Modifications:

% uncomment the next two lines if you want to use
% MATLAB's desktop to interact with the controller:
%desktop;
%keyboard;

TIME_STEP = 20;


% get and enable devices, e.g.:
%  camera = wb_robot_get_device('camera');
%  wb_camera_enable(camera, TIME_STEP);
%  motor = wb_robot_get_device('motor');

% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination

for i = 1:6
  p(i) = wb_robot_get_device(num2str(i));
end 


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
  distance = wb_distance_sensor_get_value(dist);
 

 
  if distance < 500

   for i = 1:6
     
     wb_motor_set_position(p(i), sin(0.5));
   end
    wb_motor_set_velocity(motor_back, 10);
   wb_motor_set_velocity(motor_front, 10);
  else

    for i = 1:6
     wb_motor_set_position(p(i), sin(time-i)/2);
     end
    wb_motor_set_velocity(motor_back, 1.5);
    wb_motor_set_velocity(motor_front, 1.5);
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
