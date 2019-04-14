<%@ page import="java.io.*,java.util.*" %> 
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%
   File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   
   
   String filePath = "\\dat\\data\\";

   String contentType = request.getContentType();
   if (contentType.indexOf("multipart/form-data") >= 0) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setSizeThreshold(maxMemSize);
      factory.setRepository(new File("c:\\dat"));

      ServletFileUpload upload = new ServletFileUpload(factory);
      upload.setSizeMax( maxFileSize );
      try{ 
         List fileItems = upload.parseRequest(request);
         Iterator i = fileItems.iterator();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <script type="text/javascript" src="js/bootstrap.min.js" ></script>
    <script src="js/jquery.min.js"></script> 
</head>
<body>
<div class="jumbotron">
      <div class="container">
        <h1><center>File(s) Upload</center></h1>
      </div>
</div>
<div class="row">
  <div class="col-sm-2"></div>
  <div class="col-sm-8">
  <label><h3>The following file(s) were uploaded:</h3></label> <br>

<%
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )	
            {
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            if( fileName.lastIndexOf("\\") >= 0 ){
            file = new File( filePath + 
            fileName.substring( fileName.lastIndexOf("\\"))) ;
            }else{
            file = new File( filePath + 
            fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }
            fi.write( file ) ;
            out.println(fileName.substring(fileName.lastIndexOf("\\")+1) + "<br>");
            }
         }

      }catch(Exception ex) {
         System.out.println(ex);
      }
   }
%>
<br>
<form action="NewFile.html" method="POST" >
<button type="submit" class="btn btn-primary">Back</button>
</form>
 </div>
</div>
</body>
</html>