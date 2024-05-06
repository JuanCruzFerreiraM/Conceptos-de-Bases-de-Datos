
Program eje3;
//Se prueba para 2 sucursales, pero cambiando el valor de cantidad funciona para n sucursales.

Const 
    valorAlto =   9999;
    cantidad =   2;

Type 
    reg_d =   Record
        cod:   integer;
        numero:   integer;
        cant_vend:   integer;
    End;

    reg_m =   Record
        cod:   integer;
        numero:   integer;
        descp:   string;
        precio_unidad:   real;
        color:   string;
        stock:   integer;
        stock_min:   integer;
    End;

    archivo_detalle =   file Of reg_d;
    archivo_maestro =   file Of reg_m;

    arr_reg_d =   array[1..cantidad] Of reg_d;
    arr_arch_d =   array[1..cantidad] Of archivo_detalle;

Procedure leer(Var f: archivo_detalle; Var r: reg_d);
Begin
    If (Not Eof(f)) Then
        Begin
            Read(f,r);
        End
    Else r.cod := valorAlto;
End;

Function minPos(Var arreglo: arr_reg_d):   integer;

Var 
    i,min_num,min_pos,min_cod:   integer;
Begin
    min_cod := arreglo[1].cod;
    min_num := arreglo[1].numero;
    min_pos := 1;
    For i:= 2 To cantidad Do
        If (min_cod >= arreglo[i].cod) Then
            Begin
                If (min_cod = arreglo[i].cod) Then
                    Begin
                        If (min_num > arreglo[i].numero) Then
                            Begin
                                min_num := arreglo[i].numero;
                                min_pos := i;
                            End;
                    End
                Else
                    Begin
                        min_cod := arreglo[i].cod;
                        min_num := arreglo[i].numero;
                        min_pos := i;
                    End;

            End;
    minPos := min_pos;
End;

Procedure minimo(Var ar_r: arr_reg_d; Var ar_f: arr_arch_d; Var min: reg_d);

Var 
    i:   integer;
Begin
    i := minPos(ar_r);
    min := ar_r[i];
    leer(ar_f[i],ar_r[i]);
End;

Procedure actualizar(Var master: archivo_maestro; Var arr_r: arr_reg_d; Var arr_f: arr_arch_d; Var txt: Text);

Var 
    i:   integer;
    min:   reg_d;
    aux_cod:   integer;
    aux_num:   integer;
    total:   integer;
    regm:   reg_m;
Begin
    For i:= 1 To cantidad Do
        Begin
            Reset(arr_f[i]);
            leer(arr_f[i],arr_r[i]);
        End;
    Reset(master);
    Rewrite(txt);
    minimo(arr_r,arr_f,min);
    Read(master,regm);
    While (min.cod <> valorAlto) Do
        Begin
            While (regm.cod <> min.cod) Or (regm.numero <> min.numero) Do
                Read(master,regm);

            aux_num := min.numero;
            aux_cod := min.cod;
            total := 0;
            While (aux_cod = min.cod) And (aux_num = min.numero) Do
                Begin
                    total := total + min.cant_vend;
                    minimo(arr_r,arr_f,min);
                End;

            If (total = 0) Then
                Begin
                    WriteLn('El calzado de codigo: ',aux_cod,' y numero: ',aux_num,' no registro ventas ');
                End
            Else
                Begin
                    regm.stock := regm.stock - total;
                    If (regm.stock < regm.stock_min) Then WriteLn(txt, 'Codigo: ',regm.cod,' Numero: ',regm.numero);
                    Seek(master,FilePos(master) - 1);
                    Write(master,regm)
                End;

        End;
    Close(txt);
    Close(master);
    For i:= 1 To cantidad Do
        Close(arr_f[i]);
End;

Var 
    master:   archivo_maestro;
    arr_f:   arr_arch_d;
    arr_r:   arr_reg_d;
    txt:   Text;
    regm:   reg_m;
Begin
    Assign(master,'maestro');
    Assign(arr_f[1],'detalle1');
    Assign(arr_f[2],'detalle2');
    Assign(txt,'calzadosinstock.txt');
    actualizar(master,arr_r,arr_f,txt);
    Reset(master);
    While Not eof(master) Do
        Begin
            read(master,regm);
            writeln('Codigo: ',regm.cod,' Numero: ',regm.numero,' Stock: ',regm.stock);
        End;

End.
