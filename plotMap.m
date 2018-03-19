% Function that plots floor plan.

% map - floor plan data.
% currentSections - The sections that will be highlighted in the plot.

function [] = plotMap(map,currentSections)

    % Extract section names.
    sections = fieldnames(map.sections);

    % Define floors except currentFloor.
    otherFloors = setdiff(1:length(sections),currentSections);

    % Make plots of floors except currentFloor.
    for l1 = otherFloors 
        fl = map.sections.(sections{l1});
        graphs = fieldnames(fl);
        for l2 = 1:length(graphs)
            temp = fl.(graphs{l2});
            plot(temp(:,1),temp(:,2),'color',0.9*[1 1 1],'LineWidth',3)
        end
    end

    % Make plots of currentFloor.

    if(~isempty(currentSections))
        for se = 1:length(currentSections)
            fl = map.sections.(sections{currentSections(se)});
            graphs = fieldnames(fl);
            for l2 = 1:length(graphs)
                temp = fl.(graphs{l2});
                plot(temp(:,1),temp(:,2),'color',0.2*[1 1 1],'LineWidth',3)
            end
        end
    end
    
    % Make plots of transitions.
    for l1 = 1:size(map.transitions,3)
        for l2 = l1+1:size(map.transitions,3)
            transition = map.transitions;
            plot(transition(:,1,l1,l2),transition(:,2,l1,l2),'color',[1 0 0],'LineWidth',2)
        end
    end
    
end

