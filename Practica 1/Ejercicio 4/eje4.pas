
Program eje4;

Type 

    intFile =   file Of Integer;

Procedure txtGenerator (Var arch: intFile);

Var 
    newFile:   Text;
    number:   Integer;
Begin
    Assign(newFile,'votantes.txt');
    Rewrite(newFile);
    Reset(arch);
    While (Not Eof(arch)) Do
        Begin
            Read(arch,number);
            WriteLn(newFile, number);
        End;
    close(arch);
    close(newFile)
End;

Var 
    arch:   intFile;
Begin
    Assign(arch,'votantes');
    txtGenerator(arch);
End.
