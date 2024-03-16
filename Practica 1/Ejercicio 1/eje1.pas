
Program eje1;
//Preguntar si deberiamos verificar tipos, o asegurarnos de problemas a la hora de abrir los archivos.
Const keyWord = 'cemento';
  //Palbra que al ingresarse concluye con la carga de valores al archivo.

Type 

  textFile = file Of string[255];

Var 

  newFile: textFile;
  fileName: string[25];
  newInputWord: string[255];


Begin
    writeln('Ingrese el nombre que le desea colocar al archivo: ');
    Read(fileName);
    Assign(newFile, fileName);
    Rewrite(newFile);
    repeat
      Write('Ingrese el material que desea agregar al archivo: '); //Preguntar porque se produce el problema de la doble escritura.
      ReadLn(newInputWord);
      Write(newFile, newInputWord);
    until (newInputWord = keyWord);
    close(newFile);
End.
