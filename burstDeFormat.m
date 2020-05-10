function scrambled=burstDeFormat(burst)


scrambled=zeros(1,456);

for i=0:3
    scrambled(1+i*114:(i+1)*114)=burst(i+1,[4:60, 89:145]);
end
end