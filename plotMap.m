function [] = plotMap(map,currentFloor)

    % Extract section names.
    sections = fieldnames(map.sections);

    % Define floors except currentFloor.
    otherFloors = setdiff(1:length(sections),currentFloor);

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
    if(~isempty(currentFloor))
        fl = map.sections.(sections{currentFloor});
        graphs = fieldnames(fl);
        for l2 = 1:length(graphs)
            temp = fl.(graphs{l2});
            plot(temp(:,1),temp(:,2),'color',0.2*[1 1 1],'LineWidth',3)
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

