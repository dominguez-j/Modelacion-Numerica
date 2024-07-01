function mu = calcular_mu(cota)

    % Convierte el número a una cadena de caracteres
    str_num = num2str(cota);

    primer_decimal = 0;
    cant_decimales_cota = 0;

    % Se verifica si esta en notacion cientifica
    esta_en_notacion = strfind(str_num, "e");

    if esta_en_notacion == 0
      % Encuentra el índice del punto decimal
      indice_punto = strfind(str_num, '.');

      % Encuentra el primer dígito diferente de cero después del punto decimal
      for i = (indice_punto + 1):length(str_num)
          if str_num(i) ~= '0'
              primer_decimal = str2num(str_num(i));
              cant_decimales_cota = i - indice_punto;
              break;
          end
      end
    else
      primer_decimal = str2num(str_num(1));
      indice_signo = esta_en_notacion +1;
      if length(str_num) - indice_signo == 2
         cant_decimales_cota = str2num([str_num(length(str_num)-1), str_num(length(str_num))]);
      else
         cant_decimales_cota = str2num(str_num(length(str_num)));
      end
    end

    % Calcula k según el primer decimal
    if primer_decimal < 5
        k = cant_decimales_cota;
    else
        k = cant_decimales_cota -1;
    end

    % Calcula mu
    mu = 5 * 10^(-k);
end
