package kr.co.saladay.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class Member {
	private int memberNo;
	private String memberEmail;
	private String memberPw;
	private String memberNickname;
	private String memberName;
	private String memberTel;
	private String memberAddress;
	private String enrollDate;
	private String memberDeleteFlag;
	private int authority;
	private int orderCount;
	private int orderDelCount;
	
}
