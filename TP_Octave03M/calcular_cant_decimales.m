function cant_decimales = calcular_cant_decimales(num)
    str_num = num2str(num);

    esta_en_notacion = strfind(str_num, "e");

    if esta_en_notacion != 0
      indice_signo = esta_en_notacion +1;
      if length(str_num) - indice_signo == 2
         cant_decimales = str2num([str_num(length(str_num)-1), str_num(length(str_num))]);
      else
         cant_decimales = str2num(str_num(length(str_num)));
      end
    else
      indice_punto = strfind(str_num, ".");
      cant_decimales = length(str_num) - indice_punto;
    end
end
