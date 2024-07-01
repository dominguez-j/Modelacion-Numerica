%Funcion a la que le buscamos la raiz u
f = @(u, x, L) ((2*sinh(u*x))/u - L);
%Funcion derivada de f con respecto a u
df_du = @(u, x, L) (2*(x*u*cosh(u*x)-sinh(u*x))/u^2);

%Funcion para hallar el C2
f_c2 = @(u, x, c1, y) (y - cosh(u * x + c1)/u);
%Funcion derivada de C2 con respecto a u
df_c2_du = @(u, x, c1, y) (- (x*u*sinh(x*u + c1) - cosh(x*u + c1))/u^2);

%Funcion caternaria
f_y = @(u, x, c1, c2) (cosh(u*x+ c1)/u + c2);
%Funcion derivada caternaria con respecto a u
df_y_du = @(u, x, c1,c2) (-(x*u*sinh(x*u + c1) - cosh(x*u + c1))/u^2);
%Funcion derivada caternaria con respecto a C2
df_y_dc2 = @(u, x, c1, c2) (1);

%Funcion del error cuadratico medio
function ecm = calcular_ecm(f, x_medido, y_estimado, u, c1, c2)
  y_absoluto = f(u, x_medido, c1, c2);

  % Inicializar la suma de los cuadrados de las diferencias
  suma_cuadrados_diff = 0;

  % Calculo la suma de los cuadrados de las diferencias
  for i = 1:length(y_absoluto)
      suma_cuadrados_diff = suma_cuadrados_diff + (y_absoluto(i) - y_estimado(i))^ 2;
  end

  ecm = sqrt(suma_cuadrados_diff / length(y_absoluto));
end
