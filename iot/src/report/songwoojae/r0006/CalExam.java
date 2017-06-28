package report.songwoojae.r0006;

import java.util.Scanner;

public class CalExam {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int sum = 0;

		int[] a = new int[10];

		System.out.println("10개 숫자 입력");
		for (int i = 0; i < a.length; i++) {

			System.out.println((i + 1) + "번째 숫자 입력");
			String input = scanner.nextLine();
			a[i] = Integer.parseInt(input);

			sum += a[i];
		}
		System.out.println("총 합 = " + sum);
		System.out.println("평균 = " + (sum / a.length));

		for (int i = 0; i < a.length; i++) {
			for (int j = i + 1; j < a.length; j++) {

				if (a[i] < a[j]) {

					int tmp = a[i];
					a[i] = a[j];
					a[j] = tmp;
				}

			}

		}
		for (int i = 0; i < a.length; i++) {
			System.out.println(a[i]);
		}

	}
}
