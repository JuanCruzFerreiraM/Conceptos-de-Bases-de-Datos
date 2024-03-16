//Nos permite crear el archivo de votantes usando valores randoms.

Program auxiliar;

Const municipalidades =   135;
    //Lo hice por municipalidades para que sea mas simple.

Type 
    intFile =   file Of Integer;

Var 
    randNum:   Integer;
    newFile:   intFile;
    fileName:   string[15];
    i:   Integer;

Begin
    Randomize;
    fileName := 'votantes';
    Assign(newFile, fileName);
    Rewrite(newFile);
    For i := 0 To municipalidades Do
        Begin
            randNum := Random(100) + 5;
            //Suponemos que como minimo deben votar 5 y como maximo 105
            Write(newFile, randNum);
        End;
    Close(newFile);
End.
