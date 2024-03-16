
Program eje3;

Const KEYWORD =   'zzz';

Var 
    arch:   Text;
    fileName:   string[20];
    inputWord:   string[255];

Begin
    Write('Ingrese el nombre del archivo: ');
    ReadLn(fileName);
    If (fileName <> '') Then
        Begin
            Assign(arch,fileName);
            Rewrite(arch);
            Write('Ingrese el dinosaurio, para finalizar ingrese zzz: ');
            ReadLn(inputWord);
            While (inputWord <> KEYWORD) Do
                Begin
                    WriteLn(arch, inputWord); //Se prodrian anotar seguidos, me gusta mas que sea estilo lista.
                    Write('Ingrese el dinosaurio, para finalizar ingrese zzz: ');
                    ReadLn(inputWord);
                End;
            Close(arch);
    End
    Else
        WriteLn('El nombre del archivo no es valido.');
End.
