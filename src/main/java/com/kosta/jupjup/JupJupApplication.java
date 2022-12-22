package com.kosta.jupjup;

import java.time.LocalDateTime;

/*import java.time.LocalDateTime;*/

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

//@EnableScheduling - 스케줄러 실행용 
@EnableScheduling
@SpringBootApplication
public class JupJupApplication {

	public static void main(String[] args) {
		SpringApplication.run(JupJupApplication.class, args);
	}

	// 매달 1일 00시에 실행
	@Scheduled(cron = "0 0 0 1 * *")
		public void testScheduling() {
		     LocalDateTime now = LocalDateTime.now();
		     System.out.println(now.getHour() + ":" + now.getMinute() + ":" + now.getSecond());
	}
	
}
