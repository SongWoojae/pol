package report.songwoojae.r0004;

import java.util.Scanner;

public class CarPoint {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int result = 0;
		int[] num = new int[5];
	

		for (int i = 0; i < num.length; i++) {
			System.out.println("점수 입력");
			String numStr = scanner.nextLine();
			num[i] = Integer.parseInt(numStr);

			result += num[i];

		}
		System.out.println("입력하신 학생의 총점= " + result);
		System.out.println("평균 :" + (result / num.length));

		for (int i = 0; i < num.length; i++) {
			for (int j = i + 1; j < num.length; j++) {

				if (num[i] < num[j]) {

					int tmp = num[i];
					num[i] = num[j];
					num[j] = tmp;
				}

			}

		}
		for (int i = 0; i < num.length; i++) {

			System.out.println(num[i]);

		}

		/*
		 * String input1 = scanner.nextLine(); int num1 =
		 * Integer.parseInt(input1);
		 * 
		 * String input2 = scanner.nextLine(); int num2 =
		 * Integer.parseInt(input2);
		 * 
		 * String input3 = scanner.nextLine(); int num3 =
		 * Integer.parseInt(input3);
		 * 
		 * String input4 = scanner.nextLine(); int num4 =
		 * Integer.parseInt(input4);
		 * 
		 * String input5 = scanner.nextLine(); int num5 =
		 * Integer.parseInt(input5);
		 * 
		 * String input6 = scanner.nextLine(); int num6 =
		 * Integer.parseInt(input6);
		 */

	}

}
