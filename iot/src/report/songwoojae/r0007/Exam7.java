package report.songwoojae.r0007;

public class Exam7 {
	// private 접근제어자를 사용하여 int a,b,c 3개의 변수 선언
	// Exam7 생성자에서 위의 3개의 변수의 값을 바꿔주세요
	// a,b,c 의 값을 리턴하는 함수 3개
	// Exam8클래스를 생성하여 Exam7에 선언한 a,b,c의 값을 받아 출력하는 예제 작성
	private int a;
	private int b;
	private int c;

	Exam7(int a, int b, int c) {
		this.a = a;
		this.b = b;
		this.c = c;
	}
	public int getA() {
		return this.a;
	}
	public int getB() {
		return this.b;
	}
	public int getC() {
		return this.c;
	}
}
