package test;

import java.util.Arrays;
import java.util.Collections;
import java.util.Scanner;

public class Test3 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int result = 0;
		int [] nums = new int[10];
		
		for(int i = 0; i<nums.length; i++) {
			System.out.println((i+1) + "번째 10의 배수 입력 : ");
			String numStr = scan.nextLine();
			nums[i] = Integer.parseInt(numStr);
		}
		
		for(int  i=nums.length-1; i>=0; i--) {
			System.out.println(nums[i]);
		}
	}
}
