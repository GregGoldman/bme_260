clear
time = 0.001:0.001:8;   % sec
Ts = 0.33;           % sec
T = 60/75;            % sec
Q = 370;            % mL/s 
R = 1.3;            % Arterial resistance, mmHg-sec/cm^3
C = 0.6;            % cm^3 / mmHg
dt=0.001;
numTS=floor(Ts/dt);
P=80;
for k=1:10
for j=1:800
   if j<=numTS
      out((k-1)*800+j)=Q*sin(pi*j*dt/Ts);
   else
      out((k-1)*800+j)=0;
   end
end
end
plot(time,out)
h=0.001;
N=7999;
for n=1:N
     P(n+1)= P(n)+h.*((out(n)./C)-(P(n)/(R*C)));
    t(n+1)=n.*h;
    n=n+1;
end
P1=P(5000:7999);
DP1=min(P1);
SP1=max(P1);
PP1=SP1-DP1
MAP1=(1/3)*SP1+(2/3)*DP1
figure(2)
clf
plot(time, P)
hold on
C=0.6;
R=0.95;
for n=1:N
     P(n+1)= P(n)+h.*((out(n)./C)-(P(n)/(R*C)));
    t(n+1)=n.*h;
    n=n+1;
end
P2=P(5000:7999);
DP2=min(P2);
SP2=max(P2);
PP2=SP2-DP2
MAP2=(1/3)*SP2+(2/3)*DP2

plot(time, P)
hold off
xlabel('time (seconds)')
ylabel('Arterial Pressure (mmHg)')
title('Arterial Pressures as a Function of Time (sfp11)')
legend('diseased (C=0.6, R=1.3)','Resistance change (C=0.6, R=0.95)', 'location', 'Southeast')
axis([5 8 0 180])

