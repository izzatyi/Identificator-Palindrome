program PalindromeCheck;
uses crt, sysutils;
var
    kata, backwards :string;
    lagi :char;

function PalindromeCheck(kata: string): boolean;
var
    i:integer;
    kataTerbalik :string;

begin
    kata := lowercase(stringreplace(kata, ' ', '', [rfreplaceall])); //mengubah sebuah string menjadi huruf kecil semua dan menghapus spasi yang ada 
    kataTerbalik := ''; //string kosong
    for i := length(kata) downto 1 do
        begin
            kataTerbalik := kataTerbalik + kata[i];
            // backwards := backwards + kata[i];
        end;

    //writeln('Kata Terbalik           : ',backwards); // kata terbalik dengan menggunakan spasi
    writeln('Kata Terbalik           : ',kataTerbalik);
    writeln;
    PalindromeCheck := true;
    for i := 1 to length(kata) do
        begin
            if kata[i] <> kataTerbalik[i] then
                begin
                    PalindromeCheck := false;
                    break;
                end;
        end;
end;

procedure Quit;
begin
    writeln;
    writeln('Tekan <Enter> untuk keluar');
    readln;
end;

begin
    repeat
        clrscr;
        TextColor(Blue); //ubah warna teks menjadi biru
        writeln('===============================================');
        TextColor(White); //kembalikan warna teks menjadi putih
        writeln('       Program PASCAL Cek Kata Palindrom');
        TextColor(Blue); 
        writeln('===============================================');
        TextColor(White); 
        writeln;
        
        //input dari user
        write('Input Kata/Kalimat      : '); readln(kata);
        
        //cek apakah kata tersebut merupakan palindrom menggunakan sub program
        if PalindromeCheck(kata) then 
            begin
                write(kata,' adalah');
                TextColor(Green); //ubah warna teks menjadi hijau
                writeln(' Palindrom');
                TextColor(White); //kembalikan warna teks menjadi putih
            end
        else
            begin
                write(kata);
                TextColor(Red); //ubah warna teks menjadi merah
                writeln(' BUKAN Palindrom');
                TextColor(White); //kembalikan warna teks menjadi putih
            end;

    writeln;
    write('Apakah ingin mencoba lagi ? (Y/T) ');
    lagi := upcase(readkey);
    writeln(lagi);
    until lagi <> 'Y';
    Quit;
end.