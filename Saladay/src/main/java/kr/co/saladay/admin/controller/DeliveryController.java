package kr.co.saladay.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import kr.co.saladay.admin.model.service.DeliveryService;
import kr.co.saladay.admin.model.vo.DeliveryManage;

@Controller
public class DeliveryController {
	
	@Autowired
	private DeliveryService service;
	
	// 배송관리 페이지

	@GetMapping("/admin/delivery")
	public String adminDelivery(
			@RequestParam(value="cp", required=false, defaultValue="1") int cp,
			Model model) {
		
		List<DeliveryManage> list = service.adminDelivery(cp);
		model.addAttribute("list", list);
		
		return "admin/delivery/delivery";
		
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
	

}
