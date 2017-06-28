package report.songwoojae.r0012;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;

public class DataTypeExam5_3 {

	Scanner scan = new Scanner(System.in);

	public HashMap getHashMap() {
		HashMap hm = new HashMap();
		System.out.print("클래스 정보를 입력하세요");
		hm.put("클래스", scan.nextLine());
		System.out.print("이름 정보를 입력하세요");
		hm.put("이름", scan.nextLine());
		System.out.print("나이 정보를 입력하세요");
		hm.put("나이", scan.nextLine());
		System.out.print("성별 정보를 입력하세요");
		hm.put("성별", scan.nextLine());
		return hm;

	}
	public static void main(String[] args) {
		ArrayList<HashMap> numList = new ArrayList<HashMap>();
		DataTypeExam5_3 dte5 = new DataTypeExam5_3();
		for (int i = 0; i < 2; i++) {
			HashMap hm = dte5.getHashMap();
			numList.add(dte5.getHashMap());
		}
		for (HashMap hm : numList) {
			System.out.print(hm.get("클래스") + ",");
			System.out.print(hm.get("이름") + ",");
			System.out.print(hm.get("나이") + ",");
			System.out.println(hm.get("성별"));

		}

	}
}
