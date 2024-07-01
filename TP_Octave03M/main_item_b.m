source("funciones.m");
%Defino las variables
L = 84.50;
x1 = 31.40;
y1 = 52.30;
c1 = 0;
u0 = 0.1;
max_iter = 1000;
tolerancia = 1e-14;

[u_final, error_u] = newton_raphson(u0,x1, L, f, df_du, tolerancia, max_iter);
disp(['Valor u: ', num2str(u_final, formatear(error_u))]);
disp(['Cota de error u: ', num2str(error_u)]);
disp('');

error_u_acot = calcular_mu(error_u);
u_red = redondear_numero(u_final, error_u_acot);
disp(['Valor u red: ', num2str(u_red, formatear(error_u_acot*10))]);
disp(['Cota de error u acot: ', num2str(error_u_acot)]);
disp('');

c2 = f_c2(u_red, x1, c1, y1);
error_c2 = abs(df_c2_du(u_red, x1, c1, y1)) * error_u_acot;
disp(['C2: ', num2str(c2, formatear(error_c2*10))]);
disp(['Cota de error C2: ', num2str(error_c2)]);
disp('');

error_c2_acot = calcular_mu(error_c2);
c2_red = redondear_numero(c2, error_c2_acot);
disp(['C2 red: ', num2str(c2_red, formatear(error_c2_acot*10))]);
disp(['Cota de error C2 acot: ', num2str(error_c2_acot)]);
disp('');

x_en_cero = 0;

y = f_y(u_red, x_en_cero, c1, c2);
error_y = abs(df_y_du(u_red, x_en_cero, c1, c2)) * error_u_acot + abs(df_y_dc2(u_red, x_en_cero, c1, c2)) * error_c2_acot;
disp(['Y en X = 0: ', num2str(y, formatear(error_y*10))]);
disp(['Cota de error Y en X = 0: ', num2str(error_y)]);
disp('');

error_y_acot = calcular_mu(error_y);
y_red = redondear_numero(y, error_y_acot);
disp(['Y en X = 0 red: ', num2str(y_red, formatear(error_y_acot*10))]);
disp(['Cota de error Y en X = 0 acot: ', num2str(error_y_acot)]);
