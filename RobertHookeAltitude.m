% Function that plots the attitude for Robert Hooke building.

% pos - Position of point where you want to know the altitude.
% section - The section you are at.
% altitude - The output altitude.

function altitude = RobertHookeAltitude(pos,section)

% Initialize altitude.
altitude = zeros(1,size(pos,2));

% Iterate over positions.
for i = 1:size(pos,2)

    % Set altitude.
    if(section(i)==1)
        altitude(i) = 0;
    elseif(section(i)==2)
        altitude(i) = (pos(1,i)-0.22)*3.3/6.75;       
    elseif(section(i)==3)
        altitude(i) = 3.3;
    end

end

end

