close all;

figure(1);
subplot(311);
plot(t,xe,'r');
xlabel('time(s)');ylabel('x error');
subplot(312);
plot(t,ye,'r');
xlabel('time(s)');ylabel('y error');
subplot(313);
plot(t,te,'r');
xlabel('time(s)');ylabel('angle error');

figure(2);
plot(t,th(:,1),'b');
hold on;
plot(t,th(:,2),'r');
xlabel('time(s)');ylabel('ideal and practical angle');

figure(3);
plot(p(:,3),p(:,4),'r');
xlabel('xr');ylabel('yr');
hold on;
plot(p(:,1),p(:,2),'b');
xlabel('x1');ylabel('y2');

figure(4);
subplot(211);
plot(t,q(:,1),'r');
xlabel('time(s)');ylabel('Control input v');
subplot(212);
plot(t,q(:,2),'r');
xlabel('time(s)');ylabel('Control input w');