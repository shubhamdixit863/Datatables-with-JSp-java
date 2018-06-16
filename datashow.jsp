<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/schoolproject"
     user="root"  password=""/>

	 <sql:query dataSource="${db}" var="rs">
select * from staff_attendance
</sql:query>







<table id="example" class="table table-bordered">
<thead>
<tr>
<th>Id</th>
<th>StaffId</th>
<th>Date</th>
<th>Status</th>
<th>Comments</th>
<th>Images</th>
</tr>
</thead>
 </table>

</table>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" charset="utf-8"></script>

<script type="text/javascript">
$( document ).ready(function() {
$('#example').dataTable({
       "bProcessing": true,
               "sAjaxSource": "data.jsp",
               "search": {
                 "smart": false
               },
       "aoColumns": [
    	   { type: "number"},
           { type: "number" },
           { type: "text" },
           { type: "text" },
                       { type: "text" },
                       { type: "text" },

              ]
      });
});
</script>


</body>
</html>
