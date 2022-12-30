package kr.co.saladay.admin.model.service;

import java.util.List;

import kr.co.saladay.admin.model.vo.FAQ;

public interface FaqService {

	/** faqList조회
	 * @return
	 */
	List<FAQ> selectFaqList();

	/** FAQ 작성
	 * @param faq
	 * @return
	 */
	int registFAQ(FAQ faq) throws Exception;

	/** FAQ 삭제
	 * @param faqNo
	 * @return
	 */
	int deleteFAQ(int faqNo);

}
