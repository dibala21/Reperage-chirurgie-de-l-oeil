% La version utilisée pour run ce code était R2021b Update 1

a1 = [67.25, -179.5, -402];
a2 = [-60.4, -179.5, -402];
a3 = [67.25, -179.5, -291.2];
a4 = [-60.4, -179.5, -291.2];

%%Don't change z coordinates!!!
b1 = [94.5784, 74.2501, 92.5];
b2 = [96.6345, 202.3917, 92.5];
b3 = [207.8452, 77.2285, 92.5];
b4 = [205.6620, 202.0816, 92.5];

t= [3.5, -120, -371];
t_above= [3.5, -133, -371];

t_r= [3.5, -133, -410];

a = [a1; a2; a3; a4];
b = [b1; b2; b3; b4];

a_mean = sum(a)./4;
b_mean = sum(b)./4;

h= zeros(3);

for i= 1:1:4
    
   for j= 1:1:3

       for k= 1:1:3

           h(j, k)= h(j, k) + (a(i, j)- a_mean(j))*(b(i,k)-b_mean(k));
           
       end
   end
end


[U,S,V]=svd(h);

R=V*transpose(U);

fprintf('determinant rotation = %.1f\n', det(R));

P=transpose(b_mean)-R*transpose(a_mean);


pos_ret=R*transpose(t_r)+P;
fprintf('coordinates robot for position before target = %.3f\n', pos_ret(1:3));
pos_above=R*transpose(t_above)+P;
fprintf('coordinates robot for position above target = %.3f\n', pos_above(1:3));
pos_target=R*transpose(t)+P;
fprintf('coordinates robot for tumor position = %.3f\n', pos_target(1:3));

Rot= [1 0 0; 0 -1 0; 0 0 -1];

eul = rad2deg(rotm2eul(R,'XYZ'));
disp(eul);
