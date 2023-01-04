package kr.co.saladay.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kr.co.saladay.admin.model.service.DeliveryService;
import kr.co.saladay.admin.model.vo.DeliveryManage;
import kr.co.saladay.menu.model.vo.Option;

@Controller
public class DeliveryController {
	
	@Autowired
	private DeliveryService service;
	

	// 배송관리
	@GetMapping("/admin/delivery")
	public String deliveryManage(
			@RequestParam(value="cp", required=false, defaultValue="1") int cp,
			Model model) {
		
		Map<String, Object> map = service.selectAdminDelivery(cp);
		model.addAttribute("map", map);
		
		return "admin/delivery/deliveryManage";
	}

	// 배송일정
	@GetMapping("/admin/deliveryCalendar")
	public String adminDelivery(
			@RequestParam(value="cp", required=false, defaultValue="1") int cp,
			Model model) {
		
		List<DeliveryManage> list = service.adminDelivery(cp);
		model.addAttribute("list", list);
		
		return "admin/delivery/deliveryCalendar";
		
	}
	
	@GetMapping("/admin/deliveryList")
	@ResponseBody
	public String adminDeliveryList(
			@RequestParam(value="cp", required=false, defaultValue="1") int cp,
			Model model) {
		
		List<DeliveryManage> list = service.adminDelivery(cp);
		model.addAttribute("list", list);
		
		return new Gson().toJson(list);
		
	}
	
//	@GetMapping(params = "method=data")
//	public String deliveryList(Model model) {
//		
//		
////		model.addAttribute("list", service.adminDelivery());
//		
//		return "/admin/delivery/delivery";
//	}
	

	// 배송상태 수정 
	@GetMapping("/admin/updateDelivery")
	@ResponseBody
	public int updateDelivery(int deliveryNo) {
		// System.out.println(valueArr);
		
		return service.updateDelivery(deliveryNo);
	}
	
	// 캘린더 일정 하나 정보 가져오기
	@GetMapping("/admin/delivery/selectDeliveryCalendar")
	@ResponseBody
	public String selectDeliveryDetail(int deliveryNo, int orderNo
			) {
		
		Map<String, Object> map= new HashMap<String, Object>();
		
		map.put("orderNo", orderNo);
		map.put("deliveryNo", deliveryNo);
		
		List<DeliveryManage> delivery = service.selectDeliveryDetail(map);
		
		return new Gson().toJson(delivery);
	}
	
	// 캘린더에서 배송상태 수정 
	@GetMapping("/admin/calendar/updateDelivery")
	@ResponseBody
	public int updateCalendar(int deliveryNo, String deliveryCode) {
		Map<String, Object> map= new HashMap<String, Object>();
		
		map.put("deliveryCode", deliveryCode);
		map.put("deliveryNo", deliveryNo);
		
		return service.updateCalendar(map);
	}
	

}
