package com.yeamin.dto;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {
	private String id;
	private String pw;

	public SMTPAuthenticator(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	public PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(this.id, this.pw);
	}
}