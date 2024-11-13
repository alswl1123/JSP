package examples;

import java.io.Serializable;

//자바빈즈 작성 규칙
//자바 클래스는 java.io.Serializable 인터페이스를 구현해야 함
//인수가 없는 기본 생성자가 있어야 함
//모든 멤버 변수인 프로퍼티는 private 접근 지정자로 설정해야 함
//모든 멤버 변수인 프로퍼티는 Getter/Setter() 메소드가 존재해야 함.
// Getter 는 변수에 저장된 값 가져옴, Setter 는 멤버 변수에 값 저장


//자바빈즈 작성 예시
public class MemberBean implements java.io.Serializable { // 1. 직렬화
	private int id;               // 3. 멤버 변수(프로퍼티) 정의 
	private String name;
	public MemberBean() {
	}                             // 2. 기본생성자
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;                      // 4. Getter/Setter() 메소드
	}
	
	
	
}
