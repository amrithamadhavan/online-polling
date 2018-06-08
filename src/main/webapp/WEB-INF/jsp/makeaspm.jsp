<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css">

<script type="text/javascript" charset="utf8"
	src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<table id="example" class="display table table-hover" cellspacing="0" width="100% ">
		<thead>
			<tr>
				<th>id</th>
				<th>uname</th>
				<th>password</th>
				
                <th>Role</th>
                <th>edit</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th>id</th>
				<th>uname</th>
				<th>password</th>
				
                <th>Role</th>
                <th>makeaspm</th>
			</tr>
		</tfoot>

	</table>
	<script type="text/javascript">
		$('#example').DataTable({
			ajax : {
				url : 'http://localhost:8090/online-polling/admin/listusers',
				dataSrc : ''
			},
			columns : [{
				data : 'id'
			},
			 {
				data : 'uname'
			}, 
			{
				data : 'pwd'
			}, 
			{
				data : 'role'
			}, 
			
			{
				data:'id',
				bSortable:false,
				mRender:function(data,type,full){
					return '<a class="btn btn-info btn-sm" href=${pageContext.request.contextPath}/admin/setaspmforpc/'+data+'>'+'MakeMePollMaster'+'</a>';
				}
			}
			
			
			]
		});
	</script>
	
</body>
</html>