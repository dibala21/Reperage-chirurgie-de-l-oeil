
a1 = [6.93, -56, -515];
a2 = [11.22, -53, -415.13];
a3 = [-14.08, -53, -412.13];
a4 = [-20.08, -53, -435.71];

%%Don't change z coordinates!!!
b1 = [226.840, 23.44, 36.5];
b2 = [148.490, 86.420, 33.5];
b3 = [129.76, 68.92, 33.5];
b4 = [146.89, 50.15, 33.5];

t= [-8.07, -44.25, -504.32];
t_above= [-8.07, -110, -504.32];

surface= [-8.07, -60, -504.32];

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


pos_above=R*transpose(t_above)+P;
fprintf('coordinates robot for position above organ = %.3f\n', pos_above(1:3));
pos_surface=R*transpose(surface)+P;
fprintf('coordinates robot for organ surface position = %.3f\n', pos_surface(1:3));
pos_target=R*transpose(t)+P;
fprintf('coordinates robot for tumor position = %.3f\n', pos_target(1:3));

Rot= [1 0 0; 0 -1 0; 0 0 -1];

eul = rad2deg(rotm2eul(Rot,'XYZ'));
disp(eul);
