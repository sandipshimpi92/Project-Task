
function databaseBackup() {
  var fileName = document.getElementById("myfile").value;
  alert("fileName"+fileName);
  $.ajax({
		url : "Admin/databaseBackup",
		dataType:'json',
		type : "POST",
		data:{fileName,fileName},
		success:function(jArray)
		{
		
		document.location.reload() ;
			
		}
	});
}