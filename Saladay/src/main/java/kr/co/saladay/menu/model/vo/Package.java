package kr.co.saladay.menu.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Package {
	private int packageNo;
	private String packageName;
	private int packageType;
	private String packageImage; 
}
