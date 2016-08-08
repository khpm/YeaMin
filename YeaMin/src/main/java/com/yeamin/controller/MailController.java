package com.yeamin.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeamin.dto.SMTPAuthenticator;

@Controller
public class MailController {

	protected final Log log = LogFactory.getLog(getClass());
	
	public MailController() {
		
	}
	
	@RequestMapping("/mailService.json")
	public @ResponseBody Map<String, Object> mailService(@RequestParam Map<String, Object> paramMap){

		String smtpUser = "kimsg891104@gmail.com";
		String smtpId = "kimsg891104";
		String smtpPw = "1074119s";

		String sendEmail = "kimsg891104@gmail.com";
		String receiveEmail = (String) paramMap.get("user_email");
		
		String subject = "인증 번호 발송";
		String content = "인증 번호 : ";
		
		int authNumberLength = 4;
		int authNumber = 0;
		do {
			authNumber = (int) (Math.random() * Math.pow(10, authNumberLength));
			content += String.valueOf(authNumber) ;
		} while(authNumber < Math.pow(10, authNumberLength-1));
		
		Properties prop = new Properties();
		prop.put("mail.smtp.user", smtpUser);
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "465");
		prop.put("mail.smtp.starttls.enable","true");
		prop.put( "mail.smtp.auth", "true");
		
		prop.put("mail.smtp.debug", "true");
		prop.put("mail.smtp.socketFactory.port", "465"); 
		prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		prop.put("mail.smtp.socketFactory.fallback", "false");
		
		Map<String, Object> ret = new HashMap<String, Object>();
		
		try {
			Authenticator auth = new SMTPAuthenticator(smtpId, smtpPw);
			Session mailSession = Session.getInstance(prop, auth);
			
			MimeMessage msg = new MimeMessage(mailSession);
			Address fromAddr = new InternetAddress(sendEmail);
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(receiveEmail);
			msg.addRecipient(Message.RecipientType.TO, toAddr); 
			
			msg.setSubject(subject);
			msg.setContent(content, "text/plain;charset=utf-8");
			Transport.send(msg);
			
			ret.put("result", "ok");
			ret.put("authNumber",authNumber);	//인증번호
		} catch(Exception e) {
			ret.put("result", "error");
		}
		return ret;
	}
	
}
