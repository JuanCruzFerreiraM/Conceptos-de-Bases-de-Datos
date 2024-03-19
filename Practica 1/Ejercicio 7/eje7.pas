
Program eje7;

Type 
    student =   Record
        dni:   string[7];
        legajo:   String[8];
        name:   string[20];
        surname:   string[20];
        yearOfStudies:   Integer;
        birthdate:   LongInt;
    End;

    studentsFile =   File Of student;

Procedure txtToBin(Var txt: Text; Var bin: studentsFile);

Var 
    readStudent:   student;
    line:   string;
Begin
    //No se aclara el formato del archivo de texto por lo que asumo que hay un valor por linea.
    Rewrite(bin);
    Reset(txt);
    While Not eof(txt) Do
        Begin
            ReadLn(txt, readStudent.dni);
            ReadLn(txt, readStudent.legajo);
            ReadLn(txt, readStudent.name);
            ReadLn(txt, readStudent.surname);
            ReadLn(txt, line);
            Val(line, readStudent.yearOfStudies);
            ReadLn(txt,line);
            Val(line, readStudent.birthdate);
            Write(bin, readStudent);
        End;
    Close(bin);
    Close(txt);
End;

Procedure catByChar(Var bin: studentsFile);

Var 
    printStudent:   student;
    keyChar:   Char;
Begin
    Reset(bin);
    Write('Ingrese el caracter en mayuscula por el cual desea buscar: ');
    ReadLn(keyChar);
    While Not Eof(bin) Do
        Begin
            Read(bin, printStudent);
            If (printStudent.name[1] = keyChar) Then
                Begin
                    WriteLn('DNI: ', printStudent.dni);
                    WriteLn('Legajo: ', printStudent.legajo);
                    WriteLn('Nombre: ', printStudent.name);
                    WriteLn('Apellido: ', printStudent.surname);
                    WriteLn('Anio de estudios: ', printStudent.yearOfStudies);
                    WriteLn('Fecha de nacimiento: ', printStudent.birthdate);
                End;
        End;
End;

Procedure catInTxt (Var bin: studentsFile; Var txt: Text);

Const YEAR =   5;

Var 
    printStudent:   student;
Begin
    Rewrite(txt);
    Reset(bin);
    While Not Eof(bin) Do
        Begin
            Read(bin, printStudent);
            If (printStudent.yearOfStudies = YEAR) Then
                Begin
                    WriteLn(txt, printStudent.dni);
                    WriteLn(txt, printStudent.legajo);
                    WriteLn(txt, printStudent.name);
                    WriteLn(txt, printStudent.surname);
                    WriteLn(txt, printStudent.yearOfStudies);
                    WriteLn(txt, printStudent.birthdate);
                End;
        End;
    Close(txt);
    Close(bin);
End;

Procedure addStudent(Var bin: studentsFile);

Var 
    newStudent:   student;
    cantOfStudents:   integer;
    i:   Integer;
Begin
    Reset(bin);
    Write('Ingrese la cantidad de estudiantes que desea agregar: ');
    ReadLn(cantOfStudents);
    Seek(bin,FileSize(bin));
    For i:= 1 To cantOfStudents Do
        Begin
            Write('Ingrese el DNI del estudiante: ');
            ReadLn(newStudent.dni);
            Write('Ingrese el legajo del estudiante: ');
            ReadLn(newStudent.legajo);
            Write('Ingrese el nombre del estudiante: ');
            ReadLn(newStudent.name);
            Write('Ingrese el apellido del estudiante: ');
            ReadLn(newStudent.surname);
            Write('Ingrese el anio de estudios del estudiante: ');
            ReadLn(newStudent.yearOfStudies);
            Write('Ingrese la fecha de nacimiento del estudiante: ');
            ReadLn(newStudent.birthdate);
            Write(bin, newStudent);
        End;
    Close(bin);
End;

Procedure modifyStudentYearOfStudies(Var bin: studentsFile);

Var 
    modStudent:   student;
    modLegajo:   string[8];
    findLegajo:   Boolean;
    modYearOfS:   Integer;
Begin
    Reset(bin);
    findLegajo := False;
    Write('Ingrese el legajo del estudiante que desea modificar: ');
    ReadLn(modLegajo);
    While (Not Eof(bin)) Do
        Begin
            Read(bin, modStudent);
            If (modLegajo =  modStudent.legajo) Then
                Begin
                    findLegajo := True;
                    Write('Ingrese el anio de estudios correcto: ');
                    ReadLn(modYearOfS);
                    modStudent.yearOfStudies := modYearOfS;
                    Seek(bin, FilePos(bin) - 1);
                    Write(bin,modStudent);
                    Break;
                End;
        End;
    If Not findLegajo Then WriteLn('El legajo ingresado no se corresponde con el de un alumno en el archivo');
    Close(bin);
End;


Var 
    bin:   studentsFile;
    txtFile:   Text;
    txt2File:   Text;
    isBinCreated:   Boolean;
    option:   Integer;
Begin
    Assign(bin, 'binAlumnos');
    Assign(txtFile, 'alumnos.txt');
    Assign(txt2File, 'alumnosAEgresar.txt');
    isBinCreated := False;
    While True Do
        Begin
            WriteLn('-----Menu-----');
            WriteLn('1- Crear archivo de alumnos');
            WriteLn('2- Listar alumnos por caracter');
            WriteLn('3- Listar alumnos por egresarse en txt');
            WriteLn('4- Modificar el anio de un alumno por legajo');
            WriteLn('5- Agregar alumno/s');
            WriteLn('6- Finalizar programa');
            Write('Seleccione una opcion por su valor numerico: ');
            ReadLn(option);
            If (option <> 1) And Not(isBinCreated) Then
                Begin
                    WriteLn('La opcion no es valida ya que no existe un archivo binario para buscar los datos, por favor creelo primero');
                    Continue;
                End;
            Case option Of 
                1:   If Not isBinCreated Then
                         Begin
                             isBinCreated := True;
                             txtToBin(txtFile,bin);
                         End
                     Else WriteLn('El archivo ya se encuentra creado.');
                2:   catByChar(bin);
                3:   catInTxt(bin, txt2File);
                4:   modifyStudentYearOfStudies(bin);
                5:   addStudent(bin);
                6:
                     Begin
                         WriteLn('Programa finalizado');
                         Break;
                     End;
                Else WriteLn('Error. El valor ingresado no se corresponde con las opciones.');

            End;
        End;

End.
