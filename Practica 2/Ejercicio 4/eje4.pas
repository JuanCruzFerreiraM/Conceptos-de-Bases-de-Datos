
Program eje4;

Const 
    VALORALTO =   9999;
    CANTIDAD =   20;

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
    min_cod := arreglo[1];
    min_index := 1;
    For i:= 2 To CANTIDAD Do
        If (min_cod > arreglo[i]) Then
            Begin
                min_cod := arreglo[i];
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



Begin

End.
