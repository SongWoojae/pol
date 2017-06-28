package report.songwoojae.r0007;

public class Exam10{
	//Exam9에 private a,b,result
	//Exam9 생성자에서 a와 b값을 Scanner클래스의 nextline()함수를 사용하여 대입
	//i가 a부터  b까지
	//result의 i를 반복문만큼 더하기
	//result의 값을 출력하는 함수를 Exam10에서 출력
	public static void main(String[] agrs){
		Exam9 e9 = new Exam9();
		e9.doLoop();
		System.out.println(e9.getResult());
	}

}
