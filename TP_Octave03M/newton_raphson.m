%{
f: función para la cual se busca la raíz
df: derivada de la función
u: estimación inicial
max_iter: número máximo de iteraciones
tolerancia: criterio de convergencia
%}
function [raiz, error] = newton_raphson(u, x, L, f, df, tolerancia, max_iter)
    u1 = u - f(u, x, L) / df(u, x, L);
    error = abs(u1 - u);
    if error < tolerancia || max_iter == 0
        raiz = u1;
        return;
    end
    [raiz, error] = newton_raphson(u1, x, L, f, df, tolerancia, max_iter-1);
end
