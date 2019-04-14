# String-Search

It’s a utility page from which we can upload files to the server and we can also search all the .pdf, .doc, .txt, .docx, .xls, .xlsx files in a folder for a particular string.

For this task, an HTML page was made using bootstrap. The page was divided into two
halves, the top half was used for uploading the files on the server while the bottom half dealt
with searching the files for a particular string.

On clicking upload button in the top half, the page redirected to a JSP file named
UploadFiles.jsp This page contained both HTML as well as Java code. The front end of the
page was designed via bootstrap and the backend was responsibility of Java and its vast
resources! For uploading the file, commons.io and commone.fileupload libraries was used
along with default Java libraries. All the uploaded files were stored in the server at the
location “c:\dat\data” folder.

On clicking the search button in the bottom half, the HTML page redirected to a JSP file
named SearchFiles.jsp This page contained both Java and HTML code as well. The front end
was designed using bootstrap and backend was the responsibility of Java and its famous
resouces. Various libraries was used for searching inside the files along with th default Java
libraries, like itext (for reading inside a pdf), and Apache POI( for reading doc, docx, xls,
xlsx files). All the files which contained the given string were displayed on the screen and the
user can then select any of these files and open it. The folder which was searched was
“c:\dat\data”.

This task was extremely useful and enabled uploading of files on a server and searching that
server computer for a particular string. This is particularly useful in an intranet network.
