source("funciones.m");
%Defino las variables
L = 84.50;
x1 = 31.40;
valores_pertubados = [0.1, 0.01, 0.001];
y1 = 52.30;
c1 = 0;
u0 = 0.1;
max_iter = 1000;
tolerancia = 1e-14;
error_u_acot = 0;
resta_num_mayor_menor = 0;

disp('Valor de la raíz haciendo distintas perturbaciones en x1 y L');
disp('');

disp('Perturbaciones solo en x');
disp('');

for i = 1:length(valores_pertubados)
  x = x1 + valores_pertubados(i);
  [u_final, error_u] = newton_raphson(u0, x, L, f, df_du, tolerancia, max_iter);
  disp(['Valor actual de x1: ', num2str(x)]);
  disp(['Valor actual de L: ', num2str(L)]);
  disp(['Valor u: ', num2str(u_final, formatear(error_u))]);
  disp(['Cota de error u: ', num2str(error_u)]);
  disp('');
end

disp('Perturbaciones solo en L');
disp('');

for i = 1:length(valores_pertubados)
  l_p = L + valores_pertubados(i);
  [u_final, error_u] = newton_raphson(u0, x, l_p, f, df_du, tolerancia, max_iter);
  disp(['Valor actual de x1: ', num2str(x1)]);
  disp(['Valor actual de L: ', num2str(l_p)]);
  disp(['Valor u: ', num2str(u_final, formatear(error_u))]);
  disp(['Cota de error u: ', num2str(error_u)]);
  disp('');
end

resta_num_mayor_menor = 0.04383593119233992 - 0.04336154513500586;
error_u_acot = calcular_mu(resta_num_mayor_menor);
disp(['El error que tiene el cálculo de la raíz mediante este método es: ', num2str(error_u_acot*10)]);

