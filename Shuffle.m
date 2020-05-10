
function [shuffled]=Shuffle(ordered)
shuffled=ordered;

for i=1:8
    for j=0:56
        shuffled(57*(i-1)+(j+1))=ordered(i+j*8);
    end
end
end