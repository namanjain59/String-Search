<%@ page language="java" import="java.io.*,java.util.*" %> 
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook" %> 
<%@ page import="org.apache.poi.xssf.usermodel.XSSFSheet" %> 
<%@ page import="org.apache.poi.ss.usermodel.Cell" %>
<%@ page import="org.apache.poi.ss.usermodel.Row" %> 
<%@ page import="org.apache.poi.hwpf.HWPFDocument" %> 
<%@ page import="org.apache.poi.hwpf.extractor.WordExtractor" %> 
<%@ page import="org.apache.poi.xwpf.extractor.XWPFWordExtractor" %> 
<%@ page import="org.apache.poi.xwpf.usermodel.XWPFDocument" %> 
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook" %>

<%@ page import="com.itextpdf.text.pdf.*" %> 
<%@ page import="com.itextpdf.text.pdf.parser.*" %> 


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
        <h1><center>Search Files</center></h1>
      </div>
</div>
<div class="row">
  <div class="col-sm-2"></div>
  <div class="col-sm-8">
  <label><h3>The following file(s) contains the string:</h3></label> 


<%!

public static boolean searchXlx(String path, String str)
{
	   try
	    {
	        FileInputStream x = new FileInputStream(new File(path));

	        XSSFWorkbook workbook = new XSSFWorkbook(x);

	        XSSFSheet sheet = workbook.getSheetAt(0);
	        Iterator<Row> rowIterator = sheet.iterator();


         while ( rowIterator.hasNext()) {
	        	  Row row = rowIterator.next();
	              Iterator<Cell> cellIterator = row.cellIterator();
	       
	            while ( cellIterator.hasNext()) {
	               Cell cell = cellIterator.next();
		        
	                switch (cell.getCellType()) 
	                {
	                    case Cell.CELL_TYPE_STRING:
	                    	if ((cell.getStringCellValue()).contains(str))
		                        {
	                    		x.close();
	                    		return true;
	                    		}
	                    	
	                    default:
	                }
	            }  

	        }         
	        x.close();
	    }
	    catch (Exception e)
	    {
	        e.printStackTrace();
	    }
	   
	   return false;
}

public static boolean searchXl(String path, String str)
{
	   try
	    {
	        FileInputStream x = new FileInputStream(new File(path));

	        HSSFWorkbook workbook = new HSSFWorkbook(x);

	        HSSFSheet sheet = workbook.getSheetAt(0);
	        Iterator<Row> rowIterator = sheet.iterator();


         while ( rowIterator.hasNext()) {
	        	  Row row = rowIterator.next();
	              Iterator<Cell> cellIterator = row.cellIterator();
	       
	            while ( cellIterator.hasNext()) {
	               Cell cell = cellIterator.next();
		        
	                switch (cell.getCellType()) 
	                {
	                    case Cell.CELL_TYPE_STRING:
	                    	if ((cell.getStringCellValue()).contains(str))
		                        {
	                    		x.close();
	                    		return true;
	                    		}
	                    	
	                    default:
	                }
	            }  

	        }         
	        x.close();
	    }
	    catch (Exception e)
	    {
	        e.printStackTrace();
	    }
	   
	   return false;
}

public static boolean searchTxt(String path, String str)
{
	   try{
		   
	   File f = new File(path);
	   
	   Scanner scanner = new Scanner(new FileReader(f));

	   while(scanner.hasNextLine())
	   {
	       if(scanner.nextLine().indexOf(str) >= 0)
	       {
	           return true;
	       }
	   }
	   scanner.close();
	   }
	   catch (Exception e)
	   {
		   e.printStackTrace();
	   }
	   
	   return false;
}

public static boolean searchPdf(String path, String str) throws IOException
{
     PdfReader reader = new PdfReader(path);
     int i=1;
     int tno=reader.getNumberOfPages();
     
     while (i<=tno) {
     	String p=PdfTextExtractor.getTextFromPage(reader, i);
     	if (p.contains(str))
     	{
     		return true;
     	}
     	i++;
     }
    
  
     reader.close();
	   
	   return false;
}

public static boolean searchDocx(String path, String str)
{
	  try
	  {
		  FileInputStream x = new FileInputStream(new File(path));
	      XWPFDocument document= new XWPFDocument(x); 
	      XWPFWordExtractor we = new XWPFWordExtractor(document);
	      if (we.getText().contains(str))
	      {
	    	  return true;
	      }
	    	  
	      
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	 
	   return false;
}
public static boolean searchDoc(String path, String str)
{
	  try
	  {
		  FileInputStream x = new FileInputStream(new File(path));
	      HWPFDocument document= new HWPFDocument(x); 
	      WordExtractor we = new WordExtractor(document);
	      if (we.getText().contains(str))
	      {
	    	  return true;
	      }
	    	  
	      
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	 
	   return false;
}
%>


<%
	String s=request.getParameter("str");

	File folder = new File("c:/dat/data");


	File[] listOfFiles = folder.listFiles();


    out.println("<body>");
    
	try
	{
		for (File file : listOfFiles) {
	
	    if (file.isFile()) {
	       
	    	String fname=file.getName();
	        String fpath=file.getPath();
	        if (fpath.contains(".xlsx"))
	        {
	        	if (searchXlx(fpath,s))
	        		
	        	out.println("<p><a HREF="+fpath+">"+fname+"</a></p>");
	        }
	        else if (fpath.contains(".xls"))
	        {
	        	if (searchXl(fpath,s))
		        out.println("<p><a HREF="+fpath+">"+fname+"</a></p>");
	        }
	        if (fpath.contains(".docx"))
	        {
	        	if (searchDocx(fpath,s))
		        	out.println("<p><a HREF="+fpath+">"+fname+"</a></p>");
	        }
	        else if (fpath.contains(".doc"))
	        {
	        	if (searchDoc(fpath,s))
		        	out.println("<p><a HREF="+fpath+">"+fname+"</a></p>");
	        }
	        if (fpath.contains(".txt") || fpath.contains(".c") || fpath.contains(".h"))
	        	if (searchTxt(fpath,s))
		        	out.println("<p><a HREF="+fpath+">"+fname+"</a></p>");
	        
	        if (fpath.contains(".pdf"))
	        	if (searchPdf(fpath,s))
	        	{
	        		System.out.println(fpath);
		        	out.println("<p><a HREF=\""+fpath+"\">"+fname+"</a></p>");
	    
	        	}
	    }
	}}
	catch (Exception e)
	{
		e.printStackTrace();
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
