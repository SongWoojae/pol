package report.songwoojae.r0002;

public class ArrayExam {

	public void printMultipleTable(int[] a, int[] b) {
		for (int j = 0; j < b.length; j++) {
			System.out.println();
			for (int i = 0; i < a.length; i++) {
				System.out.print(a[i] + " X " + b[j] + " = " + (a[i] * b[j])+"  ");
				
			}

		}

	}

	public static void main(String[] args) {
		int[] a = { 2, 3, 4, 5, 6, 7, 8, 9 };
		int[] b = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };

		ArrayExam ae = new ArrayExam();
		ae.printMultipleTable(a, b);
	}

}
