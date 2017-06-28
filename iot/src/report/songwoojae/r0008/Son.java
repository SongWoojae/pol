package report.songwoojae.r0008;

public class Son extends Father {
	// 아빠 클래스에서 값을 str1, str2를 Scanner 클래스의 nextLine()함수를 사용하여 값을 입력받아 주세요
	// 숫자값을 입력받아 정수로 변환해
	// 천번째 값은 반복문의 초기값, 두번째 값은 반복문의 맥스값
	// 반복문만큼 i를 값을 출력하는 함수를 아빠 클래스에 선언해 주시고
	// 아들클래스에서 호출하여 결과값을 나타내주세요

	Son() {

		//System.out.println("기본 아들 생성자 호출!");
	}

	Son(int a) {
		System.out.println("오버로딩 아들 생성자 호출!");
	}

	public static void main(String[] args) {

		Son s = new Son();
	//	s.getSet();
		s.getResult();
		
	}

}

