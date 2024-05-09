
Program eje7;
//El programa se probo con tres archivos detalle pero se puede generalizar para n cambiando el valor de CANTIDAD.


Const 
    VALORALTO =   9999;
    CANTIDAD =   3;

Type 
    reg_det =   Record
        cod:   integer;
        cant:   integer;
    End;

    reg_mast =   Record
        cod:   integer;
        nombre:   string;
        descripcion:   string;
        precio:   Real;
        stock_actual:   integer;
        stock_minimo:   integer;
    End;

    arch_det =   file Of reg_det;
    arch_master =   file Of reg_mast;

    arreglo_reg =   array[1..CANTIDAD] Of reg_det;
    arreglo_arch =   array[1..CANTIDAD] Of arch_det;

Procedure leer(Var f: arch_det; Var r: reg_det);
Begin
    If (Not Eof(f)) Then
        Begin
            read(f,r);
        End
    Else
        r.cod := VALORALTO;
End;

Function minIndex(Var arreglo: arreglo_reg):   integer;

Var 
    i,minCod,pos:   integer;

Begin
    minCod := arreglo[i].cod;
    pos := 1;
    For i:= 2 To CANTIDAD Do
        If (minCod < arreglo[i].cod) Then
            Begin
                minCod := arreglo[i].cod;
                pos := i;
            End;
    minIndex := pos;
End;

Procedure minimo(Var arr_r: arreglo_reg; Var arr_f: arreglo_arch; Var min: reg_det);

Var 
    i:   integer;
Begin
    i := minIndex(arr_r);
    min := arr_r[i];
    leer(arr_f[i],arr_r[i]);
End;

Procedure actualizarMaster(Var master: arch_master; Var arr_f: arreglo_arch);

Var 
    aux_cod:   integer;
    i:   Integer;
    arr_r:   arreglo_reg;
    min:   reg_det;
    regm: reg_mast;
Begin
    For i:= 1 To CANTIDAD Do
        Begin
            Reset(arr_f[i]);
            leer(arr_f[i]);
        End;
    Reset(master);
    Read(master,regm);
    minimo(arr_r,arr_f,min);
    While (min.cod <> VALORALTO) Do
        Begin
            while (regm.cod <> min.cod) do 
                Read(master,regma);
            aux := min.cod;
            while (aux = min.cod) do 
                begin
                  regm.stock_actual = regm.stock_actual - min.cant;
                  minimo(arr_r,arr_f,min);
                end;
            Seek(master, FilePos(master) - 1);
            Write(master,regm);
        End;
    for i:= 1 to CANTIDAD do 
        Close(arr_f[i]);
    Close(master);        
End;

//Queda a medio terminar hasta que solucione el problema con el sysutils.

procedure crearMaster(var txt: Text; var ruta: string; var master: arch_master);
begin
  Assign(master, ruta);
  Rewrite(master);

end;

Begin

End.
