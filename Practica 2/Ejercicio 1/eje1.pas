
Program eje1;
//El codigo se prueba en funcionamiento con 10 archivos detalles, funciona para n detalles cambiando el valor de la constante amount

Const 
    highValue =   9999;
    amount =   10;

Type 
    reg_det =   Record
        cod:   integer;
        date:   string;
        days_requested:   integer;
    End;

    reg_master =   Record
        cod:   integer;
        name:   string;
        surname:   string;
        birthdate:   string;
        address:   string;
        phoneNumber:   string;
        vactationDays:   integer;
    End;

    file_det =   file Of reg_det;
    file_master =   file Of reg_master;

    array_reg_d =   array[1..amount] Of reg_det;
    array_file_d =   array[1..amount] Of file_det;

Procedure leer(Var archivo: file_det; Var dato: reg_det);
Begin
    If Not eof(archivo) Then
        read(archivo, dato)
    Else
        dato.cod := highValue;
End;

Function min_pos(Var arr: array_reg_d):   integer;

Var 
    i, min, pos_min:   integer;
Begin
    min := arr[1].cod;
    pos_min := 1;
    For i:= 2 To amount Do
        If (min > arr[i].cod) Then
            Begin
                min := arr[i].cod;
                pos_min := i;
            End;
    min_pos := pos_min;
End;

Procedure min_cod (Var arr_r: array_reg_d; Var arr_f: array_file_d; Var min: reg_det);

Var 
    i:   integer;
Begin
    i := min_pos(arr_r);
    min := arr_r[i];
    leer(arr_f[i],arr_r[i]);
End;

Procedure updateMaster(Var master: file_master; Var arr_r: array_reg_d; Var arr_f: array_file_d; Var txt: Text);

Var 
    min:   reg_det;
    regm:   reg_master;
    aux:   integer;
    cant_d:   integer;
    i:  integer;
Begin
    Reset(master);
    Rewrite(txt);
    For i:= 1 To amount Do
        Begin
            Reset(arr_f[i]);
            leer(arr_f[i],arr_r[i]);    
        End;
    Read(master,regm);    
    min_cod(arr_r,arr_f,min);
    While (min.cod <> highValue) Do
        Begin
        cant_d := 0;    
            While (regm.cod <> min.cod) Do
                Read(master,regm);
            aux := min.cod;
            
            While (aux = min.cod) Do
                Begin
                    cant_d := cant_d + min.days_requested;
                    min_cod(arr_r,arr_f,min);
                    
                End;
            If ((regm.vactationDays - cant_d) <  0) Then
                Begin
                    WriteLn(txt, regm.cod,' ', regm.name,' ', regm.surname,' ', regm.vactationDays,' ', cant_d);
                End
            Else
                Begin
                    regm.vactationDays := regm.vactationDays - cant_d;
                    Seek(master, FilePos(master) - 1);
                    Write(master, regm);
                End;
        End;
        Close(master);
        Close(txt);
        for i:= 1 To amount Do
            Close(arr_f[i]);
End;

var 
    master:   file_master;
    arr_f:   array_file_d;
    arr_r:   array_reg_d;
    txt:   Text;
    regm:   reg_master;
Begin
    //Las asignaciones se puede realizar haciendo un for para los archivos detalles pero no me funciona sysutils
    Assign(master, 'master');
    Assign(txt, 'txt');
    Assign(arr_f[1],'det1');
    Assign(arr_f[2],'det2');
    Assign(arr_f[3],'det3');
    Assign(arr_f[4],'det4');
    Assign(arr_f[5],'det5');
    Assign(arr_f[6],'det6');
    Assign(arr_f[7],'det7');
    Assign(arr_f[8],'det8');
    Assign(arr_f[9],'det9');
    Assign(arr_f[10],'det10');
    updateMaster(master,arr_r,arr_f,txt);
    Reset(master);
    while not Eof(master) do
        begin
            read(master, regm);
            writeln('Codigo: ',regm.cod,' Nombre: ', regm.name,' Apellido: ', regm.surname,' Dias restantes: ', regm.vactationDays);
        end;
    Close(master);
End.
