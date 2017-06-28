package report.songwoojae.r0002;

public class Test {
	public void printMultipleTable(int initNum, int maxNum) {
		for (int i = initNum; i <= maxNum; i++) {
			if (i != 2) {
				System.out.println();
			}
			for (int j = 1; j <= 9; j++) {
				if (j == 1) {
					System.out.print(i + " X " + j + " = " + (i * j));
				} else {

					System.out.print("  " + i + " X " + j + " = " + (i * j));
				}
			}
		}

	}

	public static void main(String[] args) {
		Test t = new Test();
		t.printMultipleTable(3, 5);
	}

}
