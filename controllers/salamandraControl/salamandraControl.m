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

TIME_STEP = 32;


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

dist_left = wb_robot_get_device('ds_left');
wb_distance_sensor_enable(dist_left, TIME_STEP);

dist_right = wb_robot_get_device('ds_right');
wb_distance_sensor_enable(dist_right, TIME_STEP);


while wb_robot_step(TIME_STEP) ~= -1
  time = wb_robot_get_time();
  distance_left = wb_distance_sensor_get_value(dist_left);
  distance_right = wb_distance_sensor_get_value(dist_right);
 

 
  if distance_left < 500 && distance_left < distance_right
     for i = 1:6
       wb_motor_set_position(p(i), sin(-0.2));
     end
     disp("L");
       wb_motor_set_velocity(motor_back, 3);
       wb_motor_set_velocity(motor_front, 3);
       wb_robot_step(50 * TIME_STEP);
       
  elseif distance_right < 500 && distance_right < distance_left
     for i = 1:6
       wb_motor_set_position(p(i), sin(0.2));
      end
      disp("R");
       wb_motor_set_velocity(motor_back, 3);
       wb_motor_set_velocity(motor_front, 3);
       wb_robot_step(50 * TIME_STEP);
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
