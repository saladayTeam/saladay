package kr.co.saladay.admin.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FAQ {
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private String faqDeleteFlag;
}
