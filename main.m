clear
clc

Fc=270*(10^3);
Previous_secondLev=zeros(1,456);
Channel_Coded_Signal_delayed=zeros(1,456);
for i=0:3

    Channel_Coded_Signal= randi([0,1],1,456);
    %Channel_Coded_Signal= ones(1,456);
    %Channel_Coded_Signal= 1:456;

    Interleaved_Signal=interleave(Channel_Coded_Signal);

    Burst_signal=burstFormat(Interleaved_Signal);

    Modulated_Signal=modulateGMSK(Burst_signal, Fc);

    Rx_Burst_signal=deModulateGMSK(Modulated_Signal, Fc);

    Rx_Interleaved_Signal=burstDeFormat(Rx_Burst_signal);
    
    [secondLev_1,secondLev_2]=deInterleave(Rx_Interleaved_Signal);
    secondLev=[secondLev_1,secondLev_2];
    
    Rx_Channel_Coded_Signal=deShuffle([Previous_secondLev(1:228),secondLev(229:456)]);

    Previous_secondLev=secondLev;

    [num, rat]=biterr(Rx_Channel_Coded_Signal,Channel_Coded_Signal_delayed)
    
    Channel_Coded_Signal_delayed=Channel_Coded_Signal;
    
end