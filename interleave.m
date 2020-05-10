 function scrambled=interleave(ordered)

persistent Previous_Signal;
 
if isempty(Previous_Signal) 
    Previous_Signal =zeros(1,456);
end

 %Previous_Signal=zeros(1,456);
 
 shuffled=Shuffle(ordered);

 scrambled=[shuffled(1:57),  Previous_Signal(229:285), shuffled(58:114), Previous_Signal(286:342), shuffled(115:171), Previous_Signal(343:399), shuffled(172:228), Previous_Signal(400:456)];
 
 Previous_Signal = shuffled;
 end