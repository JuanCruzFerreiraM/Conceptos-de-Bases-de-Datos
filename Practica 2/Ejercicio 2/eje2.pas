
Program eje2;
const 
    valorAlto = 9999;

Type 

    cds =   Record
        cod_author:   integer;
        name:   string;
        record_name:   string;
        genre:   string;
        amount_sell:   integer;
    End;

    cds_file =   file Of cds;

procedure leer(var archivo: cds_file; var dato: cds);
begin
    if (not eof(archivo)) then
        read(archivo, dato)
    else 
        dato.cod_author := valorAlto;
end;


Procedure listContent(Var f: cds_file; Var r: cds; Var txt: text);

Var 
    act_cod:   integer;
    act_genre:   string;
    total_genre:   integer;
    total_author:   Integer;
    total_discography:   integer;
Begin
    Reset(f);
    Rewrite(txt);
    leer(f,r);
    total_discography := 0;
    While (r.cod_author <> valorAlto) Do
        Begin
            act_cod := r.cod_author;
            total_author := 0;
            writeln('Autor: ',r.name);
            writeln(txt,'Autor: ',r.name);
            While (act_cod = r.cod_author) Do
                Begin
                    act_genre :=  r.genre;
                    total_genre := 0;
                    WriteLn('Genero: ',act_genre);
                    WriteLn(txt,'Genero: ',act_genre);
                    While (act_genre = r.genre) And (act_cod = r.cod_author) Do 
                    //Si concide el ultimo genero de uno con el primero del otro se agregan mal por eso agrego la condicion de autor
                        Begin
                            total_genre := total_genre + 1;
                            total_author := total_author + 1;
                            total_discography := total_discography + 1;
                            WriteLn('Nombre del disco: ',r.record_name,' Cantidad vendida: ',r.amount_sell);
                            WriteLn(txt,'Nombre del disco: ',r.record_name,' Cantidad vendida: ',r.amount_sell);
                            leer(f,r);
                        End;
                    WriteLn('Total Genero: ',total_genre);
                    WriteLn(txt,'Total Genero: ',total_genre);
                End;
            Writeln('Total autor: ',total_author);
            Writeln(txt,'Total autor: ',total_author);
        End;
    Writeln('Total discografia: ', total_discography);
    Writeln(txt,'Total discografia: ', total_discography);
    Close(txt);
    Close(f);
End;

Var 
    fileCD:   cds_file;
    reg:   cds;
    txt:   Text;
Begin
    Assign(fileCD,'cds');
    Assign(txt,'informe');
    listContent(fileCD,reg,txt);
End.
