
Program eje6;

Type 
    book =   Record
        isbn:   string[13];
        title:   string[50];
        gender:   string[30];
        editorial:   string[30];
        year:   Integer;
    End;

    bookFile =   file Of book;

Procedure txtToBin (Var books: bookFile; Var txtFile: Text);

Var 
    line:   string;
    newBook:   book;
Begin
    Reset(txtFile);
    Rewrite(books);
    While (Not Eof(txtFile)) Do
        Begin
            ReadLn(txtFile,line);
            newBook.isbn := Copy(line, 1, 13);
            newBook.title := Copy(line, 15,50);
            ReadLn(txtFile,line);
            val(copy(line, 1, 4), newBook.year);
            newBook.editorial := Copy(line, 6, 30);
            ReadLn(txtFile, newBook.gender);

            Write(books, newBook);
        End;
    close(txtFile);
    Close(books);
End;

Procedure modBook (Var books: bookFile);

Var 
    modBook:   book;
    isbn:   string[13];
    foundIsbn:   Boolean;
Begin
    Reset(books);
    foundIsbn := False;
    Write('Ingrese el ISBN del libro que desea modificar: ');
    ReadLn(isbn);
    While Not Eof(books) Do
        Begin
            Read(books,modBook);
            If (modBook.isbn = isbn) Then
                Begin
                    foundIsbn := True;
                    Write('Ingrese el titulo: ');
                    ReadLn(modBook.title);
                    Write('Ingrese el genero: ');
                    ReadLn(modBook.gender);
                    Write('Ingrese el editorial: ');
                    ReadLn(modBook.editorial);
                    Write('Ingrese el anio de edicion: ');
                    ReadLn(modBook.year);
                    Break;
                End;
        End;
    If (Not foundIsbn) Then WriteLn('El valor de ISBN no es valido');
End;

Procedure addBook(Var books: bookFile);

Var 
    newBook:   book;
Begin
    Reset(books);
    Write('Ingrese el ISBN del libro: ');
    ReadLn(newBook.isbn);
    Write('Ingrese el titulo del libro: ');
    ReadLn(newBook.title);
    Write('Ingrese el genero del libro: ');
    ReadLn(newBook.gender);
    Write('Ingrese el anio de edicion del libro: ');
    ReadLn(newBook.year);
    Write('Ingrese el editorial del libro: ');
    ReadLn(newBook.editorial);

    Seek(books, FileSize(books));
    Write(books,newBook);
    Close(books);
End;

//Este metodo no era requerido pero lo uso para comprobar el funcionamiento de los otros metodos
Procedure catBinBooks (Var books: bookFile);

Var 
    printBook:   book;
Begin
    Reset(books);
    While Not eof(books) Do
        Begin
            Read(books, printBook);
            WriteLn('ISBN: ', printBook.isbn);
            WriteLn('Titulo: ', printBook.title); 
            WriteLn('Genero: ', printBook.gender);
            WriteLn('Editorial: ', printBook.editorial);
            WriteLn('Anio: ', printBook.year);
            WriteLn('-------------------');
        End;
    Close(books);
End;


Var 
    books:   bookFile;
    txtBooks:   Text;
    fileName:   string;
    isBinCreated:   Boolean;
    option:   Integer;
Begin
    Assign(txtBooks, 'libros.txt');
    Assign(books,'binLibros');
    isBinCreated := False;
    While True Do
        Begin
            WriteLn('-----Menu-----');
            WriteLn('1- Crear archivo de libros');
            WriteLn('2- Modificiar un libro');
            WriteLn('3- Agregar un libro');
            WriteLn('4- Finalizar programa');
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
                             txtToBin(books,txtBooks);
                         End
                     Else WriteLn('El archivo ya se encuentra creado.');
                2:   modBook(books);
                3:   addBook(books);
                4:
                     Begin
                         WriteLn('Programa finalizado');
                         Break;
                     End;
                Else WriteLn('Error. El valor ingresado no se corresponde con las opciones.');

            End;
        End;
        WriteLn('Prueba de funcionamiento');
        catBinBooks(books);
End.
