package com.example.pet.domain;
import java.io.Serializable;

@SuppressWarnings("serial")
public class User implements Serializable {
	private int m_num;
	private String id;
	private String pw;
	private String name;
	private String nickname;
	private String phone;
	private String addr;
	private String m_type;
	
	public User() {
	}

	public User(int m_num, String id, String pw, String name, String nickname, String phone, String addr, String m_type) {
	super();
	this.m_num = m_num;
	this.id = id;
	this.pw = pw;
	this.name = name;
	this.nickname = nickname;
	this.phone = phone;
	this.addr = addr;
	this.m_type = m_type;
	}

	public int getM_num() { return m_num; }
	public void setM_num(int m_num) { this.m_num = m_num; }

	public String getId() { return id; }
	public void setId(String id) { this.id = id; }

	public String getPw() { return pw; }
	public void setPw(String pw) { this.pw = pw; }

	public String getName() { return name; }
	public void setName(String name) { this.name = name; }

	public String getNickname() { return nickname; }
	public void setNickname(String nickname) { this.nickname = nickname; }

	public String getPhone() { return phone; }
	public void setPhone(String phone) { this.phone = phone; }

	public String getAddr() { return addr; }
	public void setAddr(String addr) { this.addr = addr; }

	public String getM_type() { return m_type; }
	public void setM_type(String m_type) { this.m_type = m_type; }

	@Override
	public String toString() {
		return "User [m_num=" + m_num + ", id=" + id + ", pw=" + pw + ", name=" + name + ", nickname=" + nickname
				+ ", phone=" + phone + ", addr=" + addr + ", m_type=" + m_type + "]";
	}
}
