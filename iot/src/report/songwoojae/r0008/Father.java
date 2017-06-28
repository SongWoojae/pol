package report.songwoojae.r0008;

import java.util.Scanner;

public class Father {

	Scanner scan = new Scanner(System.in);

	String str1;
	String str2;

	int initNum;
	int maxNum;

	Father() {

	}
	/*
	 * void getSet() { System.out.println("초기값 =  "); String str1 =
	 * scan.nextLine(); initNum = Integer.parseInt(str1);
	 * 
	 * System.out.println("맥스값 =  "); String str2 = scan.nextLine(); maxNum =
	 * Integer.parseInt(str2); }
	 */

	int[] arr = new int[10];

	void getResult() {

		System.out.println("10명 학생의 점수 입력 = ");
		for (int i = 0; i < 10; i++) {
			System.out.println((i + 1) + " 번 째 학생 점수 = ");
			arr[i] = Integer.parseInt(scan.nextLine());

		}

		for (int i = 0; i < 10; i++) {

			System.out.print(arr[i] + "  ");
		}
	}

	void inputFormScanner1() {
		str1 = scan.nextLine();
	}

	void inputFromScanner2() {
		str2 = scan.nextLine();
	}

}
// 아빠 클래스에서 배열변수를 선언하시고 10명의 학생의 점수르 ㄹ입력
// 배열 변수의 데이터 타입 int
// 출력함수는 아빠클래스
//
