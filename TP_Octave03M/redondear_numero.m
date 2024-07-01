function num_redondeado = redondear_numero(num, cota)
    % Formatear el número con la cantidad de decimales de la cota,
    % se multiplica por 10 para que el mu, me defina bien la cantidad de decimales
    num_formateado = sprintf(formatear(cota*10), num);

    % Convertir el número formateado nuevamente a un número
    num_redondeado = str2double(num_formateado);
end
