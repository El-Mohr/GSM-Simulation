 function [Signal,Previous_Signal]=deInterleave(scrambled)

 Signal=scrambled([1:57, 115:171, 229:285, 343:399] );
 Previous_Signal=scrambled([58:114, 172:228, 286:342, 400:456] );
 
 %Signal_ordered= deShuffle(Signal);
 %Previous_Signal_ordered= deShuffle(Previous_Signal);
 
  end