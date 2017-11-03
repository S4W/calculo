function gershdisc(A)

for i=1:size(A,1)
    h=real(A(i,i)); k=imag(A(i,i)); 
    
    r=0;
    for j=1:size(A,1)
       if i ~= j 
           r=r+(norm(A(i,j)));
       end    
    end 
    
    N=256;
    t=(0:N)*2*pi/N;
    
    plot( r*cos(t)+h, r*sin(t)+k ,'-');
    hold on;
end
    
ev=eig(A);
k = size(ev);
for i=1:k
    rev=plot(real(ev(i)),imag(ev(i)),'ro');
end

legend(rev,'Valor de los Autovalores');
hold off

end