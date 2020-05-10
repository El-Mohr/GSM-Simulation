function GMSKPassBand=modulateGMSK(burst,Fc)

t = linspace(0,577*(10^-6),1560);
ModObj = comm.GMSKModulator('BitInput', true, 'BandwidthTimeProduct', 0.3 ,'SamplesPerSymbol',10);
GMSKPassBand=zeros(4,1560);

for k=0:3
    GMSKBaseBand = step(ModObj, burst(k+1,:)');
    GMSKPassBand(k+1,:) = real(GMSKBaseBand .* exp(1i*2*pi*Fc*t)');
    
    %plot(t, GMSKPassBand(k+1,:))
end

end

