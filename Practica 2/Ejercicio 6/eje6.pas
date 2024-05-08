program eje6;

const 
    VALORALTO = 9999;

Type 
    reg_det = record 
        cod: integer;
        fecha: string;
        monto: real;
    end;

    reg_mast = record 
        cod: integer;
        monto: real;
    end;        

    arch_det = file of reg_det;
    arch_mast = file of reg_mast;

    procedure leer(var f: arch_det; var r: reg_det);
    begin
      if (not Eof(f)) then
        begin
          Read(f,r);
        end
       Else 
        r.cod := VALORALTO;
    end;

    procedure resumirArchivo(var master: arch_mast; var detalle: arch_det);
    var 
        aux:  integer;
        regd: reg_det;
        regm: reg_mast;
    begin
        Rewrite(master);
        Reset(detalle);
        leer(detalle,regd);
        while (regd.cod <> VALORALTO) do 
            begin
              regm.monto := 0;
              regm.cod := regd.cod;
              aux := regd.cod;
              while (aux = regd.cod) do 
                begin
                  regm.monto := regm.monto + regd.monto;
                  leer(detalle,regd);
                end;  
              Write(master,regm);
            end;
        Close(master);
        Close(detalle);    
    end;

Var
    detalle: arch_det;
    master: arch_mast;
    regm: reg_mast;
begin
  Assign(master,'master.dat');
  Assign(detalle,'detalle.dat');
  resumirArchivo(master,detalle);
  Reset(master);
  while (not Eof(master)) do
    begin
        Read(master,regm);    
        WriteLn('Codigo: ',regm.cod,' Monto: $',regm.monto:2:2);
    end;
  Close(master);  
end.
