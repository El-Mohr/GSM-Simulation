   
function ordered=deShuffle(shuffled)
ordered=shuffled;

for j=0:56
    for i=0:7
        ordered((i+1)+j*8)=shuffled(57*i+(j+1));
    end
end
end