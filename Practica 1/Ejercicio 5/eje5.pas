
Program eje5;


Type 
    flower =   Record
        numberSp:   Integer;
        height:   Real;
        scName:   String;
        vgName:   String;
        color:   String;

    End;

    flowerFile =   file Of flower;


    //Permite crear un archivo de especies usando el registro flower
Procedure createFile(Var spFile: flowerFile);

Var 
    input:   flower;
Begin
    Rewrite(spFile);
    Write('Ingrese el nombre cientifico, para finalizar ingrese zzz: ');
    ReadLn(input.scName);
    While (input.scName <> 'zzz') Do
        Begin
            Write('Ingrese el numero de especie: ');
            ReadLn(input.numberSp);
            Write('Ingrese la altura maxima: ');
            ReadLn(input.height);
            Write('Ingrese el nombre vulgar de la especie: ');
            ReadLn(input.vgName);
            Write('Ingrese el color de la especie: ');
            ReadLn(input.color);
            Write(spFile,input);
            Write('Ingrese el nombre cientifico, para finalizar ingrese zzz: ');
            ReadLn(input.scName);
        End;
    Close(spFile);
    WriteLn('Archivo creado con exito');
End;

//Permite hacer un reporte via consola de la cantidad de especies, la altura maxima y la minima
Procedure shellReport (Var spFile: flowerFile);

Var 
    maxH:   Real;
    minH:   Real;
    cantSp:   Integer;
    output:   flower;
Begin
    cantSp :=   0;
    minH :=   9999;
    maxH :=   -1;
    Reset(spFile);
    While (Not Eof(spFile)) Do
        Begin
            Read(spFile,output);
            cantSp  :=   cantSp + 1;
            If (output.height > maxH) Then maxH := output.height;
            If (output.height < minH) Then minH := output.height;
        End;
    WriteLn('Cantidad de especies en el archivo: ', cantSp,'. Altura maxima: ',maxH:4:3, '. Altura minima: ',minH:4:3,'.');
End;

//Permite modificar un nombre cientifico
Procedure modScName(Var spFile: flowerFile);

Var 
    modName:   string;
    newName:   string;
    output:   flower;
Begin
    Reset(spFile);
    Write('Ingrese el nombre que desea cambiar: ');
    ReadLn(modName);
    While (Not Eof(spFile)) Do
        Begin
            Read(spFile,output);
            If (output.scName = modName) Then
                Begin
                    output.scName := modName;
                    Seek(spFile, FilePos(spFile) - 1);
                    Write(spFile,output);
                    Break;
                End;
        End;
    Close(spFile);
    WriteLn('Modificacion realizada con exito');
End;

//Permite mostrar por consola el contenido del archivo
Procedure catFile(Var spFile: flowerFile);

Var 
    output:   flower;
Begin
    Reset(spFile);
    While (Not Eof(spFile)) Do
        Begin
            Read(spFile,output);
            WriteLn('Numero de especie: ',output.numberSp,'. Altura maxima: ',output.height,'. Nombre cientifico: ',output.scName,'. Nombre vulgar: ',output.vgName,
                    '. Color: ',output.color,'.');
        End;
    Close(spFile);
End;

//Permite agregar una nueva especie al archivo
Procedure addNewSp(Var spFile: flowerFile);

Var 
    input:   flower;
Begin
    Reset(spFile);
    While (Not Eof(spFile)) Do
        Write('');
    Seek(spFile,FilePos(spFile));
    Write('Ingrese el nombre cientifico, para finalizar ingrese zzz: ');
    ReadLn(input.scName);
    While (input.scName <> 'zzz') Do
        Begin
            Write('Ingrese el numero de especie: ');
            ReadLn(input.numberSp);
            Write('Ingrese la altura maxima: ');
            ReadLn(input.height);
            Write('Ingrese el nombre vulgar de la especie: ');
            ReadLn(input.vgName);
            Write('Ingrese el color de la especie: ');
            ReadLn(input.color);
            Write(spFile,input);
            Write('Ingrese el nombre cientifico, para finalizar ingrese zzz: ');
            ReadLn(input.scName);
        End;
     Close(spFile);
     WriteLn('Especie/es agreada/as con exito');   
End;





//Programa Principal.

Var 
    isFileCreated:   Boolean;
    option:   Integer;
    spFile: flowerFile;
Begin
    Assign(spFile, 'especies');
    isFileCreated := False;
    While True Do
        Begin
            WriteLn('-----Menu-----');
            WriteLn('1- Crear archivo de especies');
            WriteLn('2- Cantidad de especies en archivo, menor y mayor altura');
            WriteLn('3- Mostrar contenido');
            WriteLn('4- Modificar nombre cientifico');
            WriteLn('5- Agregar especie');
            WriteLn('6- Listar contenido en archivo de texto');
            WriteLn('7- Finalizar programa');
            Write('Seleccione una opcion por su valor numerico: ');
            ReadLn(option);
            If ((option <> 1) And Not (isFileCreated)) Then
                Begin
                    WriteLn('Error. La opcion no es valida ya que no existe el archivo de especies, primero debe crearlo');
                    Continue;
                End;
            Case option Of 
                1:
                     Begin
                         If Not (isFileCreated) Then
                             Begin
                                 isFileCreated := True;
                                 createFile(spFile);
                             End
                         Else WriteLn('El archivo de especies ya existe');
                     End;
                2:   shellReport(spFile);
                3:   catFile(spFile);
                4:   modScName(spFile);
                5:   addNewSp(spFile);
                6:   Write('');
                7:
                     Begin
                         WriteLn('Programa Finalizado');
                         Break;
                     End;
                Else
                    Begin
                        WriteLn('Error. El valor ingresado no se corresponde con las opciones.');
                    End;
            End;
        End;
End.
