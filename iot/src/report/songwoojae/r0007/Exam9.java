package report.songwoojae.r0007;

import java.util.Scanner;

public class Exam9 {
	private int a;
	private int b;
	private int result;
	Scanner scan;

	public Exam9() {// 생성자는 초기값을 생성할 때 주로 사용
		scan = new Scanner(System.in);

		System.out.println("초기값 = ");
		this.a = Integer.parseInt(scan.nextLine());

		System.out.println("마지막 값 = ");
		this.b = Integer.parseInt(scan.nextLine());
	}

	public void doLoop() {
		for (int i = a; i <= b; i++) {
			result += i;
		}
		
	}

	public int getResult() {
		return result;
 
	}

}
