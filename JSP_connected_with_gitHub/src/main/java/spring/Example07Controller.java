package spring;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/home")
public class Example07Controller 
{
	@GetMapping("/exam07")
	public ModelAndView requestMethod(ModelMap model)
	{
		ModelAndView mav = new ModelAndView(); //객체 생성
		mav.addObject("data", "ModelAndView 예제입니다");
		mav.addObject("data2", "웹 요청 URL은 /home/exam07 입니다");
		mav.setViewName("webpage05");
		return mav;
		
		//실행 결과 URL : http://localhost:8080/spring/home/exam07
	}
}
