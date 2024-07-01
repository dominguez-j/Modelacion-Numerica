source("funciones.m");
%Defino las variables
L = 100.62;
x1 = 10.00;
y1 = 55.00;
c1 = 0;
u0 = 0.1;
max_iter = 1000;
tolerancia = 1e-14;
x = -x1 : 0.5 : x1;
puntos_x = [-10, -8, -6, -4, -2, -1, 1, 2, 4, 6, 8, 10];
puntos_y = [55.000, 27.342, 16.332, 10.796, 7.792, 6.921, 6.616, 7.376, 9.637, 16.597, 28.042, 55.000];

[u_final, error_u] = newton_raphson(u0,x1, L, f, df_du, tolerancia, max_iter);
error_u_acot = calcular_mu(error_u);

u_red = redondear_numero(u_final, error_u_acot);
c2 = f_c2(u_red, x1, c1, y1);

error_c2 = abs(df_c2_du(u_red, x1, c1, y1)) * error_u_acot;
error_c2_acot = calcular_mu(error_c2);

c2_red = redondear_numero(c2, error_c2_acot);

y = f_y(u_red, x, c1, c2_red);
plot(x, y, '-');
hold on;

plot(puntos_x, puntos_y, 'ro', 'MarkerFaceColor', 'r');
hold on;

plot(puntos_x, puntos_y);
hold off;

ecm = calcular_ecm(f_y, puntos_x, puntos_y, u_red, c1, c2_red);
disp(['Error cuadrático medio: ', num2str(ecm)]);
