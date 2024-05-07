Program eje4;
//Se prueba su funcionamiento con 3 cines, cambiando la constante CANTIDAD se generaliza para n cines.
Const 
    VALORALTO =   9999;
    CANTIDAD =   3;

Type 
    reg_det =   Record
        cod:   integer;
        nombre:   string;
        genero:   string;
        director:   string;
        duracion:   real;
        fecha:   string;
        cant_asis:   integer;
    End;

    reg_master =   Record
        cod:   integer;
        nombre:   string;
        genero:   string;
        director:   string;
        duracion:   real;
        cant_asis:   integer;
    End;

    arch_det =   file Of reg_det;
    arch_mast =   file Of reg_master;

    array_reg_d =   array[1..CANTIDAD] Of reg_det;
    array_arch_d =   array[1..CANTIDAD] Of arch_det;


Procedure leer(Var f: arch_det; Var r: reg_det);
Begin
    If (Not Eof(f)) Then
        Begin
            read(f,r);
        End
    Else
        r.cod := VALORALTO;
End;

Function minIndex(Var arreglo: array_reg_d):   integer;

Var 
    min_cod,i,min_index:   integer;
Begin
    min_cod := arreglo[1].cod;
    min_index := 1;
    For i:= 2 To CANTIDAD Do
        If (min_cod > arreglo[i].cod) Then
            Begin
                min_cod := arreglo[i].cod;
                min_index := i;
            End;
    minIndex := min_index;
End;

procedure minimo(var arr_f: array_arch_d; var arr_r: array_reg_d; var min: reg_det);
var
    i: integer;
begin
  i := minIndex(arr_r);
  min := arr_r[i];
  leer(arr_f[i],arr_r[i]);
end;

procedure merge (var ruta: string; var arr_f: array_arch_d; var arr_r: array_reg_d; var master: arch_mast);
Var 
    min: reg_det;
    regm: reg_master;
    aux: integer;
    i: integer;
begin
    Assign(master, ruta);
    Rewrite(master);
    for i := 1 to CANTIDAD do 
        begin
          Reset(arr_f[i]);
          leer(arr_f[i],arr_r[i]);
        end;
    minimo(arr_f,arr_r,min);
    while (min.cod <> VALORALTO) do
      begin
        aux := min.cod;
        regm.cod := aux;
        regm.nombre := min.nombre;
        regm.genero := min.genero;
        regm.director := min.director;
        regm.duracion := min.duracion;
        regm.cant_asis := 0;
        while (min.cod = aux) do 
            begin
              regm.cant_asis := regm.cant_asis + min.cant_asis;
              minimo(arr_f,arr_r,min);
            end;
        Write(master,regm);    
      end;
      Close(master);
      for i:= 1 to CANTIDAD do
        Close(arr_f[i]);   
end;

Var 
    ruta: string;
    arr_f: array_arch_d;
    arr_r: array_reg_d;
    master : arch_mast;
    rmaster: reg_master;
    
Begin
    Assign(arr_f[1],'detalle1');
    Assign(arr_f[2],'detalle2');
    Assign(arr_f[3],'detalle3');
    ruta := 'master';
    merge(ruta,arr_f,arr_r,master);
    Reset(master);
    While (not Eof(master)) do 
        begin
          Read(master,rmaster);
          WriteLn('Codigo: ',rmaster.cod,' Nombre: ',rmaster.nombre,' Genero: ',rmaster.genero,' Director: ',rmaster.director);
          WriteLn('Duracion: ',rmaster.duracion:2:2,' Cantidad de asistentes: ',rmaster.cant_asis);
        end; 
    Close(master); 
End.