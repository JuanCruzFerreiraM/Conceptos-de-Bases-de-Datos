
Program eje2;

Const
    VALORALTO = 9999;

Type 
    tVehiculo =   Record
        codigoVehiculo:   integer;
        patente:   String;
        motor:   String;
        cantidadPuertas:   integer;
        precio:   real;
        descripcion:   Integer; //No me funciona el sysutils, el tipo original es String.
    End;
    
    tArchivo =   File Of tVehiculo;

    procedure leer(var f: tArchivo; var r: tVehiculo); 
    begin
      if not(Eof(f)) then
        begin
        Read(f,r);
        end
      Else 
        r.codigoVehiculo := VALORALTO;
    end;
    procedure agregar(var arch: tArchivo; var vehiculo: tVehiculo);
    var 
        pos: integer;
        reg_aux: tVehiculo;
    begin
        leer(arch,reg_aux);
        if (reg_aux.codigoVehiculo <> VALORALTO) then //Comprobamos que el archivo no este vacio
            begin
                pos := vehiculo.descripcion; 
                if (pos = 0) then //No hay ningun elemento borrado. 
                    begin
                      Seek(arch,FileSize(arch));
                      Write(arch,vehiculo);
                    end
                else 
                    begin
                      Seek(arch,pos);
                      Write(arch,vehiculo);
                    end; 
            end;
    end;


procedure eliminar(var arch: tArchivo; var codigoVehiculo: integer);
var 
    pos: integer;
    reg: tVehiculo;
begin
  pos := 1; //Sabemos seguro que no vamos a eliminar el elemento 0 por ser el header.
  leer(arch,reg);
  while (reg.codigoVehiculo <> VALORALTO) and (reg.codigoVehiculo <> codigoVehiculo) do
    begin
      leer(arch,reg);
      pos := pos + 1;
    end;
end;


Begin
End.
