
Program eje5;

Const 
    VALORCORTE =   'zzz';

Type 
    reg =   Record
        partido:   string;
        localidad:   string;
        barrio:   string;
        cant_n:   integer;
        cant_a:   integer;
    End;

    arch =   file Of reg;

Procedure leer(Var f: arch; Var r: reg);
Begin
    If (Not Eof(f)) Then
        Begin
            Read(f,r);
        End
    Else
        r.partido := VALORCORTE;
End;

Procedure listar(Var f: arch);

Var 
    r:   reg;
    aux_partido:   string;
    aux_localidad:   string;
    total_n:   integer;
    total_a:   integer;
    total_l_n:   integer;
    total_l_a:   integer;
Begin
    Reset(f);
    leer(f,r);
    While (r.partido <> VALORCORTE) Do
        Begin
            aux_partido := r.partido;
            WriteLn('Partido: ',aux_partido);
            total_n := 0;
            total_a := 0;
            While (aux_partido = r.partido) Do
                Begin
                    total_l_n := 0;
                    total_l_a := 0;
                    aux_localidad := r.localidad;
                    WriteLn('Localidad: ',aux_localidad);
                    While (aux_partido = r.partido) And (aux_localidad = r.localidad) Do
                        Begin
                            total_l_n := total_l_n + r.cant_n;
                            total_l_a := total_l_a  + r.cant_a;
                            WriteLn('Cantidad de niños: ',r.cant_n,' Cantidad de adultos: ',r.cant_a);
                            leer(f,r);
                        End;
                    total_n := total_n + total_l_n;
                    total_a := total_a + total_l_a;
                    WriteLn('Total niños en localiad ',aux_localidad,': ',total_l_n,' Total adultos en localidad ',aux_localidad,': ',total_l_a);
                End;
            WriteLn('Total niños en partido ',aux_partido,': ',total_n,' Total adultos en partido ',aux_partido,': ',total_a);    
        End;
      Close(f);  
End;

Var
  
  f: arch;

Begin
  Assign(f,'informe');
  listar(f);
End.
