//Preguntar por que anda mal.
Program eje2;

Type 
  intFile = file of Integer;

Var 
  arch: intFile;
  readValue: Integer;
  minValue: Integer;
  maxValue: Integer;
  fileName: string[20];

Begin
  Write('Ingrese el nombre del archivo que desea procesar: ');
  ReadLn(fileName);
  If  (fileName <> '') Then
    Begin
      Assign(arch,fileName);
      Reset(arch);
      minValue := 9999;
      maxValue := -1;
      While (Not Eof(arch)) Do
        Begin
          Read(arch, readValue);
          Write(readValue, ' - ');
          If (readValue > maxValue) Then
            Begin
              maxValue := readValue;
            End;
          If (readValue < minValue )  Then
            Begin
              minValue := readValue;
            End;
        End;
      WriteLn(' ');
      WriteLn('La cantidad mas chica de votantes fue: ', minValue);
      WriteLn('La cantidad mas grande de votantes fue: ', maxValue);
    End;
  Close(arch);
End.
