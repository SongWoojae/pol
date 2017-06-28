package report.songwoojae.r0011;

import java.util.Scanner;

public class ExceptionExam2 {

	int[] arrNum = new int[4];

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		ExceptionExam2 ee2 = new ExceptionExam2();

		for (int i = 0; i < ee2.arrNum.length; i++) {
			try {
				ee2.arrNum[i] = Integer.parseInt(scan.nextLine());
			} catch (Exception e) {
				i--;
				System.out.println("다시 입력하세요");
			}
		}

	}

}
