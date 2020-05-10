function burst=deModulateGMSK(GMSKPassBand,Fc)

burst=zeros(4,156);

t = linspace(0,577*(10^-6),1560);
DeModObj= comm.GMSKDemodulator('BitOutput', true,'BandwidthTimeProduct', 0.3,'SamplesPerSymbol',10,'TracebackDepth', 1);

%fcutoff = 4000;
Wn = 1;

%LPF_filter = firceqrip(1000,Wn,[0.01 0.0001]);
filter_design = fdesign.lowpass('Fp,Fst,Ap,Ast',(Wn-0.1),Wn,.9,1000);
LPF_filter = design(filter_design,'butter');

for k=0:3
    GMSK_demod_Signal = GMSKPassBand(k+1,:).*exp(-1i*2*pi*Fc*t);
    
    %After_LPF = filter(LPF_filter,1,GMSK_demod_Signal);
    %burst(k+1,:) = (step(DeModObj,After_LPF'))';
    
    After_LPF = filter(LPF_filter,GMSK_demod_Signal');
    burst(k+1,:) = step(DeModObj,After_LPF);
    burst(k+1,:) = burst(k+1,[2:end ,1]);
    
end
end




