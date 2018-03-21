% Floor plan data for the Robert Hooke building.

%%%%%%%%%%%
% Floor 1 %
%%%%%%%%%%%

map.sections.floor1.graph1 = [-1.03  -3.63  -3.63  -3.63  -5.08  -5.08   0  0     0  -0.62  -0.62  -4.33  -4.33  -5.83  -5.83  -5.33 -5.33  -3.63  -3.63   0       0;
                               7.85   7.85   9.15   8.78   8.78   0      0  2.38  0   0     -0.46  -0.46   0      0      8.78   8.78  9.15   9.15  10.32  10.32  3.63]';

map.sections.floor1.graph2 = [-8.69  -8.69  -7.12  -9.04  -9.04  -5.83  -5.83  -0.81  -5.83  -5.83   4.82   4.82   0.09   1.57   1.57   1.57   4.82  4.82  1.57   1.57  1.57  4.82  4.82  1.57  1.57   1.57   2.57   1.62   0.62  -5.20  -5.20  -4.51  -7.79  -7.79 -5.67 -5.67 -8.69 -8.69  -8.69  -7.12  -7.12; 
                               0.22  -1.91  -1.91  -1.91  -3.76  -3.76  -1.91  -1.91  -1.91  -7.11  -7.11  -1.91  -1.91  -1.91  -1.73  -1.91  -1.91  3.29  3.29  -0.84  3.29  3.29  5.06  5.06  4.19  10.98  11.98  12.93  11.93  11.93  10.32  10.32  10.32  12.98 12.98 15.59 15.59 12.98   6.97   6.97  -0.89]'; 
                                                          
%%%%%%%%%%
% Stairs %
%%%%%%%%%%
                           
map.sections.stairs.graph1 = [-8.69  0.22; 
                              -8.69  6.97];
                        
map.sections.stairs.graph2 = [-7.12  0.22;  
                              -7.12  6.97];

%%%%%%%%%%%
% Floor 2 %
%%%%%%%%%%%
                           
map.sections.floor2.graph1 = [-7.12  -7.12  -9.95  -9.95  -9.65  -9.65  -10.09  -10.09  -7.12  -7.12  -8.69  -8.69;
                               6.97   9.12   9.12   7.20   7.20   0.56    0.56   -1.70  -1.70   0.56   0.56   6.97]';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define altitude function %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map.altitude = @(pos,section) RobertHookeAltitude(pos,section);   

%%%%%%%%%%%%%%%
% Orientation %
%%%%%%%%%%%%%%%
map.orientation = 19;
% the map is 19 degree anticlockwise from true north

%%%%%%%%%%%%%%%
% Transitions %
%%%%%%%%%%%%%%%
                           
map.transitions = zeros(2,2,3,3);
map.transitions(:,:,1,2) = [-7.12  0.22;
                            -8.69  0.22];
                        
map.transitions(:,:,2,1) = map.transitions(:,:,1,2); 
map.transitions(:,:,2,3) = [-7.12  6.97;
                            -8.69  6.97];                    

map.transitions(:,:,3,2) = map.transitions(:,:,2,3);

%%%%%%%%
% Plot %
%%%%%%%%

clf
hold on
plotMap(map,1)
axis equal
grid on
xlabel('X (m)')
ylabel('Y (m)')
set(gca, 'FontSize', 24)
%%%%%%%%%%%%%%%%%%%%
% Remove variables %
%%%%%%%%%%%%%%%%%%%%

clearvars sections transition colors floor graphs temp