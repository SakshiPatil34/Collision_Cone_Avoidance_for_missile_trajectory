clear all;
clc;

% Simulation Setup -------------------------------------------------------
dt = 0.001; % sec
tf = 100; % sec
Ns = tf / dt; % time steps
time(1) = 0;



% Initial conditions
x_M(1) = 0;
y_M(1) = 0;
x_T(1) = 1500;
y_T(1) = 1500;
alpha(1) = (47/180)*pi;
beta = pi/3;
R_T = 100;
vM_Max = 50;
vT_Max = 0;
theta(1) = pi/4;
r(1) = sqrt((y_T(1)-y_M(1))^2 + (x_T(1)-x_M(1))^2);
r_dot(1) = vT_Max*cos(beta-theta(1)) - 50*cos(alpha(1)-theta(1));

% Proportional Gain for Lateral Acceleration
a = 5;

% Main simulation
for k = 1:Ns
    % Calculate collision cone
    phi1 = theta(k) + asin(R_T/r(k));
    alpha1(k) = asin((vT_Max/vM_Max)*sin(beta-phi1)) + phi1; % collision cone upper limit
    
    phi2 = theta(k) - asin(R_T/r(k));
    alpha2(k) = asin((vT_Max/vM_Max)*sin(beta-phi2)) + phi2; % collision cone lower limit

      v_theta(k) = vT_Max*sin(beta-theta(k)) - vM_Max*sin(alpha(k)-theta(k));
       
   if alpha2(k) <= alpha(k) && alpha(k) <= alpha1(k)
      
       if abs(alpha1(k)-alpha(k)) >= abs(alpha2(k)-alpha(k))
        desired_alpha = alpha2(k) - pi/30;
           e(k) =  alpha(k) - desired_alpha;
           a_M(k) = vM_Max*(1-(vT_Max*cos(beta-phi2))/(vM_Max*cos(alpha2(k)-phi2)))*((v_theta(k)/r(k))-((R_T*r_dot(k))/(r(k)*sqrt(r(k)^2-R_T^2)))) -vM_Max*a*e(k);
          alpha(k+1) = alpha(k) + a_M(k)/vM_Max*dt;  
          l = 0;
        
       else
           desired_alpha = alpha1(k) + pi/30;
           e(k) =  alpha(k) - desired_alpha;
           a_M(k) = vM_Max*(1-(vT_Max*cos(beta-phi1))/(vM_Max*cos(alpha1(k)-phi1)))*((v_theta(k)/r(k))-((R_T*r_dot(k))/(r(k)*sqrt(r(k)^2-R_T^2)))) -vM_Max*a*e(k);
          alpha(k+1) = alpha(k) + a_M(k)/vM_Max*dt;
          l=1;
       end
    else 
          e(k) =  alpha(k) - desired_alpha;
        if l == 1
        a_M(k)=vM_Max*(1-(vT_Max*cos(beta-phi1))/(vM_Max*cos(alpha1(k)-phi1)))*((v_theta(k)/r(k))-((R_T*r_dot(k))/(r(k)*sqrt(r(k)^2-R_T^2)))) -vM_Max*a*e(k);
        else
        a_M(k) = vM_Max*(1-(vT_Max*cos(beta-phi2))/(vM_Max*cos(alpha2(k)-phi2)))*((v_theta(k)/r(k))-((R_T*r_dot(k))/(r(k)*sqrt(r(k)^2-R_T^2)))) -vM_Max*a*e(k);
        end
        alpha(k+1)=alpha(k) + a_M(k)/vM_Max*dt;    
        
    end
            
    

    v_M = vM_Max * [cos(alpha(k+1)); sin(alpha(k+1))];
    v_T = vT_Max * [cos(beta); sin(beta)];

    % Update missile position
    x_M(k+1) = x_M(k) + v_M(1) * dt;
    y_M(k+1) = y_M(k) + v_M(2) * dt;

    % Update target position
    x_T(k+1) = x_T(k) + v_T(1) * dt;
    y_T(k+1) = y_T(k) + v_T(2) * dt;

    r(k+1) = sqrt((y_T(k+1)-y_M(k+1))^2 + (x_T(k+1)-x_M(k+1))^2);
    theta(k+1) = atan2((y_T(k+1)-y_M(k+1)),(x_T(k+1)-x_M(k+1)));
    r_dot(k+1) = vT_Max*cos(beta-theta(k+1)) - vM_Max*cos(alpha(k+1)-theta(k+1));
    time(k+1) = time(k) + dt;
    
     if r(k+1)<=100
      disp("collision");
      s=k;
      display(alpha(s));
      break;
     end
%      if r_dot(k)>=0
%         p = k;
%          display(alpha(p));
%         break ;
%   
%     end
%     
end
%%

% Plot trajectories ------------------------------------------------------
figure(1);
viscircles([x_T(1), y_T(1)], R_T, 'Color', 'r', 'LineWidth', 2);
hold on;
plot(x_M, y_M, '-y', 'LineWidth', 2);
scatter(x_M(end), y_M(end), 'xk', 'LineWidth', 1);
hold on;
plot(x_T(1:end-1), y_T(1:end-1), '-r', 'LineWidth', 2); % Add target trajectory plot
scatter(x_T(end), y_T(end), 'ok', 'LineWidth', 1); % Mark target final position
grid on;
title('Robot and Obstacle Trajectories');
xlabel('x');
ylabel('y');
axis equal;
legend('Robot Trajectory','Robot Final Position', 'Obstacle Trajectory','Obstacle Final Position');
hold on;

figure(2)
plot(time(1:end-1),e, '-r', 'LineWidth', 2);
grid on;
title('Error with Time');
xlabel('Time (s)');
ylabel('Error');
hold on;

figure(3)
plot(time(1:end),r_dot, '-m', 'LineWidth', 2);
grid on;
title('r_dot with Time');
xlabel('Time (s)');
ylabel('r_dot');
hold on;

figure(4)
plot(time(1:end-1),a_M, '-k', 'LineWidth', 2);
grid on;
title('a_rob with Time');
xlabel('Time (s)');
ylabel('a_rob');
hold on;