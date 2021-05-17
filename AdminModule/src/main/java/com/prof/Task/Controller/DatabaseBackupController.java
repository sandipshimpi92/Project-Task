package com.edzeal.Admin.Controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class DatabaseBackupController 
{
	@RequestMapping("/Admin/databaseBackup")
	public ModelAndView databaseBackup() throws IOException, InterruptedException {
		
		
		File file = new File("C:\\Edzeal_Technologies_LLP\\ERP_Backup");
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MMM-yyyy");
		LocalDateTime now = LocalDateTime.now();
		String loginDateAndTime = dtf.format(now);
		if (file.getParentFile().mkdir()) {
		    file.createNewFile();
		    System.out.println("File Created Successfully...!");
		} else 
		{
		    System.out.println("Already File Present");
		}
		String path=file+"_"+loginDateAndTime+".sql";
		System.out.println("ds<"+path);
	    Runtime running=Runtime.getRuntime();
		Process p=running.exec("C:\\Program Files\\MySQL/MySQL Server 5.0\\bin\\mysqldump.exe -uroot -proot --add-drop-database -B edzeal_erp2019 -r"+path);
		int processComplete=p.waitFor();
		if(processComplete==0)
		{
			System.out.println("Database Created Successfully...!");
		}else {
			System.out.println("Not Created");
			
		}
		return new ModelAndView("ADMIN/AdminDashboard");
	}

}
