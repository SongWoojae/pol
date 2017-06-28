package report.songwoojae.r0007;

public class Exam11 {
	protected int a;	//다른 클래스끼리 protected에서 상속은 가능하기 때문에 a와 b에도  protected를 써줘야한다.
	protected int b;	//다른 클래스끼리 protected에서 상속은 가능하기 때문에 a와 b에도  protected를 써줘야한다.
	int result;

	// a와 b를 초기화 하는 Exam11생성자를 만들어주세요
	// a와 b값을 더하기,빼기,나누기,곱하기 하는 함수를 각각 4개 작성
	// 해당 연산 결과는 printResult()라는 함수를 호출 했을 때 나오게 프로그램 작성
	// 호출은 Exam12 클래스
	public Exam11() {

	}		//Exam12에서 상속받기 위해 빈 생성자를 만들어야함
	//빈 생성자를 쓰지 않을 때는 자손클래스에 super(a,b); 써야 됨

	public Exam11(int a, int b) {
		this.a = a;
		this.b = b;

	}

	protected void add() {
		result = a + b;

	}

	protected void sub() {
		result = a - b;

	}

	protected void mul() {
		result = a * b;

	}

	protected void div() {
		result = a / b;

	}

	protected void printResult() {

		System.out.println(result);

	}

}
