function burst=burstFormat(scrambled)

TailBits=zeros(1,3);
FlagBit=0;
TrainingBits=[1,1,1,1,1,0,0,1,1,0,1,0,1,0,0,0,0,0,1,1,0,0,1,0,1,0];
GuardBits=zeros(1,8);
burst=zeros(4,156);

for i=0:3
    burst(i+1,:)=[TailBits, scrambled(1+57*i*2:57*(i*2+1)), FlagBit, TrainingBits, FlagBit, scrambled(1+57*(2*i+1):57*(2*i+2)),TailBits,GuardBits];
    
end
end