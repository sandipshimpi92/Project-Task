package com.prof.Task;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
@EnableJpaRepositories(basePackages={"com.edzeal.Repository.*"})
@SpringBootApplication
@EntityScan(basePackages= {"com.edzeal.POJO.*"})
@Configurable
@EnableAutoConfiguration
@ComponentScan
public class TaskModuleApplication {

	public static void main(String[] args) {
		SpringApplication.run(TaskModuleApplication.class, args);
	}

}
