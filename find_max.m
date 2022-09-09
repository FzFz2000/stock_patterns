function [points] = find_max(signal,margin)
%This function get 
points=[];
for index=1:length(signal)
    is_max=1;
    is_min=1;
    points=[points 1];
    if index-1<margin
    %left
    starting=1;
    ending=2*margin;
    interp_range=signal(starting:ending);
    max_point=find(interp_range==max(interp_range));
    min_point=find(interp_range==min(interp_range));
    points=[points min_point max_point];
    elseif length(signal)-index<margin
    %right
    starting=length(signal)-margin+1;
    ending=length(signal);
    interp_range=signal(starting:ending);
    max_point=find(interp_range==max(interp_range));
    min_point=find(interp_range==min(interp_range));
    points=[points min_point max_point];
    else
    %middle
        for j=index-margin:index+margin
            if signal(index)>signal(j)
            is_max=is_max*1;
            is_min=is_min*0;
            elseif signal(index)<signal(j)
            is_max=is_max*0;
            is_min=is_min*1;
            end
        end
        if is_max==1 && is_min==0
            points=[points index];
        end
    end
    points=[points length(signal)];

end

