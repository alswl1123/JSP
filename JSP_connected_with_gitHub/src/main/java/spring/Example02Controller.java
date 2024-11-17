package spring;

@Controller
@RequestMapping("/home")
public class Example02Controller
{
	//exam02/IT전문서/publisher/길벗
	@GetMapping("/exam02/{category}/publisher/{publisher}")
	public String requestMethod(@PathVariable String category, //IT전문서
						@PathVariable String publisher, Model model) //길벗
	{
		System.out.println("도서 분야 : " + category);
		System.out.println("출판사 : " + publisher);
		model.addAttribute("data", "도서 분야 : " + category + "<br>" + "출판사 : " + publisher);
		return "webpage06";
	}
}