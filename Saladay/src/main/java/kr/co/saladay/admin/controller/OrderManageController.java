package kr.co.saladay.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.saladay.admin.model.service.OrderManageService;
import kr.co.saladay.admin.model.vo.DeliveryManage;
import kr.co.saladay.admin.model.vo.OrderManage;

@Controller
public class OrderManageController {
	
	@Autowired
	private OrderManageService service;
	
	// 전체 주문 목록 조회
	@GetMapping("/admin/orderManage")
	public String selectOrderList(Model model,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp) {
		
		Map<String, Object> map = service.selectOrderList(cp);
		model.addAttribute("map", map);
		
		return "/admin/orderManage/orderManageList";
	}
	
	// 주문 상세 조회
	@GetMapping("/admin/orderManage/{orderNo}")
	public String selectOrderDetail(
			@PathVariable("orderNo") int orderNo,
			Model model,
			HttpServletRequest req
			) {
		
		// 주문 상세조회 서비스
		OrderManage orderDetail = service.selectOrderDetail(orderNo);
		
		// 주문별 배송정보 조회 서비스
		List<DeliveryManage> orderDetailDelivery= service.selectOrderDetailDelivery(orderNo);
		
		// 이전 주소 얻어오기
		String referer = req.getHeader("referer");
		
		
		model.addAttribute("orderDetail", orderDetail);
		model.addAttribute("orderDetailDelivery", orderDetailDelivery);
		model.addAttribute("referer", referer);
		
		return "/admin/orderManage/orderManageDetail";
	}
	
	

}
