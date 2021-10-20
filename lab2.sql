/* 
1. Napisz polecenie select, za pomocą którego uzyskasz tytuł i numer książki
2. Napisz polecenie, które wybiera tytuł o numerze 10
3. Napisz polecenie select, za pomocą którego uzyskasz numer książki (nr tyułu) i
autora z tablicy title dla wszystkich książek, których autorem jest Charles
Dickens lub Jane Austen
*/

--1
--SELECT title,title_no FROM title 
--2
--SELECT title FROM title WHERE title_no = 10
--3
--SELECT title_no, author FROM title WHERE (author = 'Charles Dickens') OR (author = 'Jane Austen')

/*
1. Napisz polecenie, które wybiera numer tytułu i tytuł dla wszystkich książek,
których tytuły zawierających słowo „adventure”
2. Napisz polecenie, które wybiera numer czytelnika, oraz zapłaconą karę
3. Napisz polecenie, które wybiera wszystkie unikalne pary miast i stanów z tablicy
adult.
4. Napisz polecenie, które wybiera wszystkie tytuły z tablicy title i wyświetla je w
porządku alfabetycznym.
*/

--1
--SELECT title_no,title FROM title WHERE title LIKE '%adventure%'
--2
--SELECT member_no, isnull(fine_paid,0) AS finePaid 
--FROM loanhist WHERE isnull(fine_paid,0)=0 and isnull(fine_assessed,0)>0
--3
--SELECT DISTINCT city,state FROM adult
--4
--SELECT title FROM title ORDER BY title 

/*
1. Napisz polecenie, które:
– wybiera numer członka biblioteki (member_no), isbn książki (isbn) i watrość
naliczonej kary (fine_assessed) z tablicy loanhist dla wszystkich wypożyczeń
dla których naliczono karę (wartość nie NULL w kolumnie fine_assessed)
– stwórz kolumnę wyliczeniową zawierającą podwojoną wartość kolumny
fine_assessed
– stwórz alias ‘double fine’ dla tej kolumny
*/

--SELECT member_no,isbn,fine_assessed,2*fine_assessed AS 'double fine' FROM loanhist WHERE fine_assessed IS NOT NULL 

/*
1. Napisz polecenie, które
– generuje pojedynczą kolumnę, która zawiera kolumny: firstname (imię
członka biblioteki), middleinitial (inicjał drugiego imienia) i lastname
(nazwisko) z tablicy member dla wszystkich członków biblioteki, którzy
nazywają się Anderson
– nazwij tak powstałą kolumnę email_name (użyj aliasu email_name dla
kolumny)
– zmodyfikuj polecenie, tak by zwróciło „listę proponowanych loginów e-mail”
utworzonych przez połączenie imienia członka biblioteki, z inicjałem
drugiego imienia i pierwszymi dwoma literami nazwiska (wszystko małymi
małymi literami).
– Wykorzystaj funkcję SUBSTRING do uzyskania części kolumny
znakowej oraz LOWER do zwrócenia wyniku małymi literami.
Wykorzystaj operator (+) do połączenia stringów.
*/

--SELECT REPLACE(LOWER(firstname+middleinitial+SUBSTRING(lastname,1,2)),' ','') AS 'email_name' 
--FROM member WHERE lastname = 'Anderson'

/*
1. Napisz polecenie, które wybiera title i title_no z tablicy title.
§ Wynikiem powinna być pojedyncza kolumna o formacie jak w przykładzie
poniżej:
The title is: Poems, title number 7
§ Czyli zapytanie powinno zwracać pojedynczą kolumnę w oparciu o
wyrażenie, które łączy 4 elementy:
stała znakowa ‘The title is:’
wartość kolumny title
stała znakowa ‘title number’
wartość kolumny title_no
*/

--SELECT 'The title is: '+title+' , title number '+CAST(title_no AS varchar) FROM title
