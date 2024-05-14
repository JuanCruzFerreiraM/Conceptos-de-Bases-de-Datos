Program eje1;

Const 
    VALORALTO =   9999;

Type 

    reg_mast =   Record
        cod :   Integer;
        nom_vul,nom_cien,descrip,zona:   string[25];
        altura:   real
    End;

    arch_mast =   file Of reg_mast;


Procedure leer(Var f: arch_mast; Var r: reg_mast);
Begin
    If (Not Eof(f)) Then
        Begin
            Read(f,r);
        End
    Else
        r.cod := VALORALTO;
End;

Procedure marcado(Var arch: arch_mast; Var reg: reg_mast);

Var 
    cod:   integer;
Begin
    Write('Ingrese el codigo de planta que desea eliminar: (9999 para finalizar): ');
    ReadLn(cod);
    reg.cod := -2;
    While (reg.cod <> VALORALTO) And (cod <> VALORALTO) Do
        Begin
            Seek(arch,0);
            //Ponemos el archivo en el principio
            While (reg.cod <> cod) And (reg.cod <> VALORALTO) Do
                leer(arch,reg);
            If (reg.cod = cod) Then
                Begin
                    reg.cod := -1;
                    Seek(arch,FilePos(arch) -1);
                    Write(arch,reg);
                End;
            reg.cod := -1;
            Write('Ingrese el codigo de planta que desea eliminar: (9999 para finalizar): ');
            ReadLn(cod);
        End;
End;

Procedure compactar(Var arch_original: arch_mast; Var arch_compact: arch_mast; Var reg: reg_mast);

Begin
    Reset(arch_original);
    Rewrite(arch_compact);
    marcado(arch_original,reg);
    Seek(arch_original,0);
    leer(arch_original,reg);
    While (reg.cod <> VALORALTO) Do
        Begin
            If  (reg.cod <> -1) Then
                Write(arch_compact,reg);
            leer(arch_original,reg);    
        End;
    Close(arch_original);
    Close(arch_compact);
End;

Procedure remplazarReg(Var f: arch_mast; Var r: reg_mast);

Var 
    pos:   integer;
    cod:   integer;
Begin
    Reset(f);
    Write('Ingrese el codigo de planta que desea eliminar: (9999 para finalizar): ');
    ReadLn(cod);
    r.cod := -1;
    While (r.cod <> VALORALTO)  And (cod <> VALORALTO) Do
        Begin
            Seek(f,0);
            While (r.cod <> cod) And (r.cod <> VALORALTO) Do
                leer(f,r); 
            If (r.cod = cod)  Then
                Begin
                    pos := FilePos(f) - 1;
                    Seek(f,FileSize(f) - 1);
                    Read(f,r);
                    Seek(f,pos);
                    Write(f,r);
                    Seek(f,FileSize(f) -1);
                    Truncate(f);
                End;
            Write('Ingrese el codigo de planta que desea eliminar: (9999 para finalizar): ');
            ReadLn(cod);
            r.cod := -1;
        End;
    Close(f);
End;

Var 
    arch_original:   arch_mast;
    arch_compact:   arch_mast;
    reg:   reg_mast;
Begin
    Assign(arch_original,'original');
    Assign(arch_compact,'compacto');
    remplazarReg(arch_original,reg);
    Reset(arch_original);
    While Not(Eof(arch_original)) Do
        Begin
            Read(arch_original,reg);
            WriteLn('Codigo: ',reg.cod,' Nombre vulgar: ',reg.nom_vul,' Altura: ',reg.altura:4:2);
        End;
    close(arch_original);
    compactar(arch_original,arch_compact,reg);
    Reset(arch_compact);
    While Not(Eof(arch_compact)) Do
        Begin
            Read(arch_compact,reg);
            WriteLn('Codigo: ',reg.cod,' Nombre vulgar: ',reg.nom_vul,' Altura: ',reg.altura:4:2);
        End;
    Close(arch_compact);
End.
