
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
    Write('Ingrese el codigo de planta que desea eliminar: (9999 para finalizar)');
    ReadLn(cod);
    reg.cod := -2;
    While (reg.cod <> VALORALTO) And (cod <> VALORALTO) Do
        Begin
            Seek(arch,0);
            //Ponemos el archivo en el principio
            While (reg.cod <> cod) and (reg.cod <> VALORALTO) Do
                leer(arch,reg);
            If (reg.cod = cod) Then
                Begin
                    reg.cod := -1;
                    Seek(arhc,FilePos(arch) -1);
                    Write(arch,reg);
                End;
            reg.cod := -1;
            Write('Ingrese el codigo de planta que desea eliminar: (9999 para finalizar)');
            ReadLn(cod);
        End;
End;

procedure compactar(var arch_original: arch_mast; var arch_compact: arch_mast; var reg: reg_mast);
Var
begin
  marcado(arch_original,reg);
  leer(arch_original,reg);
  while(reg.cod <> VALORALTO) do
    begin
      if  (reg.cod <> -1) then
        Write(arch_compact,reg);
    end;
end;



Begin

End.
