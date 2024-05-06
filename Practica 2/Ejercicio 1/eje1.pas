program eje1;
//El codigo se prueba en funcionamiento con dos archivos detalles, funciona para n detalles cambiando el valor de la constante 
//amount
Const 
    highValue = '9999';
    amount = 2;
Type
    reg_det = record
        cod: integer;
        date: string;
        days_requested: integer;
    end;

    reg_master = record
        cod: integer;
        name: string;
        surname: string;
        birthdate: string;
        address: string;
        phoneNumber: string;
        vactationDays: integer;
    end;

    file_det = file of reg_det;
    file_master = file of master;

    array_reg_d = array[1..amount] of reg_det;
    array_file_d = array[1..amount] of file_det;

    procedure leer(var archivo: file_det; var dato: reg_det);
    begin
        if not eof(archivo) then
            read(archivo, dato)
        else
            dato.cod := highValue;
    end;

    function min_pos(var arr: array_reg_d): integer;
    var 
        i, min, pos_min: integer;
    begin
       min := arr[1].cod;
       pos_min := 1;
       for i:= 2 to amount do 
        if (min > arr[i].cod) then 
            begin
              min:= arr[i].cod;
              pos_min := i;
            end;
        min_pos := pos_min;
    end;

    procedure min_cod (var arr_r: array_reg_d; var arr_f: array_file_d; var min: reg_det);
    var
        i: integer;
    begin
        i:= min_pos(arr_r);
        min:= arr_r[i];
        leer(arr_f[i],arr_r[i]); 
    end;

    procedure updateMaster(var master: file_master; var arr_r: array_reg_d; var arr_f: array_file_d; var txt: Text);
    var
        min: reg_det;
        regm: reg_master;
        aux: integer;
        cant_d: integer;
        text: String;
    begin
        min_cod(arr_r,arr_f,min);
        while (min.cod <> highValue) do 
            begin
                while (regm.cod <> min.cod) do 
                    Read(master,regm);
            aux:= min.cod;
            while (aux = min.cod) do
              begin
                cant_d := cant_d + min.days_requested;
                min_cod(arr_r,arr_f,min);
              end;
            if ((regm.vactationDays - cant_d) <  0) then 
                begin
                    Write(txt, regm.cod, regm.name, regm.surname, regm.vactationDays, cant_d);
                end
            else 
                begin
                  regm.vactationDays := regm.vactationDays - cant_d;  
                  Seek(master, FilePos(master) - 1);
                  Write(master, regm);
                end;    
            end;
    end;

Begin 

End.