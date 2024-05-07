program eje5;

Const
    VALORCORTE = 'zzz';

Type 
    reg = record
        partido: string;
        localidad: string;
        barrio: string;
        cant_n: integer;
        cant_a: integer;
    end;

    arch = file of reg;

    procedure leer(var f: arch; var r: reg);
    begin
      if (not Eof(f)) then
        begin
          Read(f,r);
        end
      else 
        r.partido := VALORCORTE; 
    end;

    procedure listar(var f: arch);
    var 
        r: reg;
        aux_partido: string;
        aux_localidad: string;
        total_n: integer;
        total_a: integer;
        total_l_n: integer;
        total_l_a: integer;
    begin
        Reset(f);
        leer(f,r);
        while (r.partido <> VALORCORTE) do
          begin 
            aux_partido := r.partido;
            WriteLn('Partido: ',aux_partido);
            total_n := 0;
            total_a := 0;
            while (aux_partido = r.partido) do
              total_l_n := 0;
              total_l_a := 0;
              aux_localidad := r.localidad;
              WriteLn('Localidad: ',aux_localidad);
              while (aux_partido = r.partido) and (aux_localidad = r.localidad) do 
                begin
                  total_l_n := total_l_n + r.cant_n;
                  total_l_a := total_l_a  + r.cant_a;
                end;
                
          end;
    end;
begin
  
end.