program eje8;

//Se prueba para el caso de 3 zonas, se puede generalizar para n zonas cambiando la constate cantidad.

const
    VALORALTO = 9999;
    CANTIDAD = 15;

Type
    reg_det = record
        cod_zona: integer;
        nombre_zona: String;
        descripcion: String;
        fecha: string;
        cant_m: real;
    end;

    reg_mast = record
        cod_zona: integer;
        nombre_zona: string;
        cant_m: real;
    end;

    arch_mas = file of reg_mast;
    arch_det = file of reg_det;

    arreglo_arch_d = array[1..CANTIDAD] of arch_det;
    arreglo_reg_d = array[1..CANTIDAD] of reg_det;

    procedure leer(var f: arch_det; var r: reg_det);
    begin
      if (not Eof(f)) then
        begin
          Read(f,r);
        end
      Else
        r.cod_zona := VALORALTO;  
    end;        

    function minIndex(var arreglo: arch_det): integer;
    var 
        i,min_cod,pos: integer;
    begin
        min_cod := arreglo[1].cod_zona;
        pos := 1;
        for i:= 1 to CANTIDAD do
          begin
            if (min_cod < arreglo[i].cod_zona) then 
                begin
                  min_cod := arreglo[i].cod_zonal;
                  pos := i;
                end;
          end;
        minIndex := pos;  
    end;

    procedure minimo(var arr_f: arreglo_arch_d; var arr_r: arreglo_reg_d; var min: reg_det);
    var 
        i: integer;
    begin
        i := minIndex(arr_r);
        min := arr_r[i];
        leer(arr_r[i],arr_r[i]);
    end;        

    procedure merge(var master: arch_mas;var arr_f: arreglo_arch_d);
    var 
        i,aux: integer;

begin
end.
