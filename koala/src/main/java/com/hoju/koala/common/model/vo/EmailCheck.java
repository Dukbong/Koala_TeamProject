package com.hoju.koala.common.model.vo;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class EmailCheck {

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	//인증번호
	private int certiNum;
	private String randomPwd;
	
	//강제 임시비밀번호 발급을 막기 위한 토근
	private Map<String, String> tokenMap = new HashMap<>();
	
	private Properties prop;
	
	//램덤숫자(6자리) 생성후 인증번호에 집어넣기
	public void makeRandomNumber() {
		
		Random r = new Random();
		
		int checkNum = r.nextInt(899999)+100000;
		certiNum = checkNum;
	}
	
	//8자리 임시비밀번호 생성
	public String makeRandomPwd() {
		
		//초기 인덱스 초기화
		int index = 0;
		
		//랜덤으로 넣고싶은 char들 세팅
		char[] charSet = {
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
				'!', '@', '#', '$', '%', '^', '&', '*', '(', ')'
		};
		
		//문자열을 결합할수록 공간이 낭비될 뿐만 아니라 실행 속도도 매우 느려지게 되므로
		//스트링버퍼를 쓰고 공간의 낭비를 줄이자
		StringBuffer password = new StringBuffer();
		
		Random r = new Random();
		System.out.println(charSet.length);

		for (int i=0; i<8; i++) {
			//인덱스 0~71 총72개
			index = r.nextInt(charSet.length);
			password.append(charSet[index]);
		}
		
//		randomPwd = password.toString();
		return password.toString();
	}
	
	
	//이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) throws MessagingException { 
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	//가입시 이메일
	public String joinEmail(String email) throws MessagingException {
		makeRandomNumber();
		String setFrom = "koala123test@naver.com"; // config에 설정한 서버 이메일 주소를 입력 
		String toMail = email;
		String title = "회원 가입 인증 이메일 입니다."; // 이메일 제목 
//		String content = 
//				"회원 가입 인증 번호를 알려드립니다!!" + 
//                "<br><br>" + 
//			    "인증 번호는 " + certiNum + "입니다." + 
//			    "<br>" + 
//			    "해당 인증번호를 Verification Code에 기입하여 주세요."; //이메일 내용 삽입
		//이것도 스트링버퍼 처리
		StringBuffer buf = new StringBuffer();
		buf.append("<h3>회원 가입 인증 번호를 알려드립니다!!</h3><br><br>인증 번호는 ");
		buf.append(certiNum);
		buf.append("입니다.<br>해당 인증번호를 Verification Code에 기입하여 주세요.");
		
		String content = buf.toString();
		
		
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(certiNum);
	}
	
	//아이디와 임시 비밀번호 보내기
	//에서 -> 아이디만 보내고 사용자가 링크를 눌렀을때 기존 pwd에서 임시비밀번호로 발급
	public void forgetUserEmail(String email, String userId) throws MessagingException {
		
//		makeRandomPwd();
		String setFrom = "koala123test@naver.com"; // config에 설정한 서버 이메일 주소를 입력 
		String toMail = email;
		String title = "Koala사이트에서 회원정보를 보냈습니다."; // 이메일 제목 
		
		//고유 식별자 토큰 생성
		String token = UUID.randomUUID().toString();
		
		//맵에 해당유저와 토큰값저장
		tokenMap.put(userId, token);
		
		prop = new Properties();
		
		String localhost = "";
		String port = "";
		try {
			prop.load(new FileInputStream("file:src/main/webapp/WEB-INF/spring/setting-config.properties"));
			
			localhost = prop.getProperty("localhost");
			port = prop.getProperty("port");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		StringBuffer buf = new StringBuffer();
		buf.append("<h3>Koala 회원 정보 입니다.</h3><br><br>아이디 : ");
		buf.append(userId);
		buf.append("<br>");
		buf.append("임시비밀번호를 발급받으시려면 링크를 눌러주세요.<br>	 <a href='http://");
		buf.append(localhost);
		buf.append(":");
		buf.append(port);
		buf.append("/koala/member/tempPwd?userId=");
		buf.append(userId);
		buf.append("&token=");
		buf.append(tokenMap.get(userId));
		buf.append("'>임시비밀번호 발급</a>");
		
		String content = buf.toString();
		mailSend(setFrom, toMail, title, content);
		
//		return randomPwd;
		
	}
	
			
	
}
