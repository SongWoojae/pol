package test;

import java.util.Arrays;
import java.util.Scanner;

public class CalCal {
	public static void main(String[] args){
		Scanner scan = new Scanner(System.in);
		int result = 0;
		int[] num = new int[5];
		
		for(int i=0; i<=num.length; i++){
			System.out.println((i+1) + "번 째 학생의 점수를 입력하세요 ->");
			String numStr = scan.nextLine();
			num[i] = Integer.parseInt(numStr);
			result += num[i];
		}
		System.out.println("입력하신 점수의 총점 = " + result);
		System.out.println("입력하신 점수의 평균 = " + result/num.length);
		
		Arrays.sort(num);
		for(int i=0; i<num.length; i++){
			System.out.println(num[i]);
		}
		
		
	}
}
