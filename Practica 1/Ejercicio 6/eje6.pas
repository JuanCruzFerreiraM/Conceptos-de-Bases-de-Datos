program eje6;

Type 
    book = record
        isbn: string[13];
        title: string[50];
        gender: string[30];
        editorial: string[30];
        year: Integer;    
    end;

    bookFile = file of book;

    procedure binToTxt (var books: bookFile; var txtFile: Text);
    Var
        line: string;
        newBook: book;
    begin
        Reset(txtFile);
        Rewrite(books);
        while (not Eof(txtFile)) do
          begin
            ReadLn(txtFile,line);
            newBook.isbn := Copy(line, 1, 13);
            newBook.title := Copy(line, 15,50);
            ReadLn(txtFile,line);
            newBook.year := val(copy(line, 1, 4));
            newBook.editorial := Copy(line, 6, 30);
            ReadLn(line, newBook.gender);

            Write(books, newBook);
          end;
          close(txtFile);
          Close(books);
    end;    

    procedure modBook (var books: bookFile);
    var 
        modBook: book;
        isbn: string[13];
        foundIsbn: Boolean;
    begin
        Reset(books);
        found := False;
        Write('Ingrese el ISBN del libro que desea modificar: ');
        ReadLn(isbn);
        while not Eof(books) do 
        begin
            Read(books,modBook);
            //Terminar, falta terminar la modificacion del libro preguntando si el isbn es el mismo que el buscado

        end;
    end;


Var
Begin 
End.