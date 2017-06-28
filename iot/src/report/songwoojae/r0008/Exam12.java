package report.songwoojae.r0008;

import report.songwoojae.r0007.Exam11;

public class Exam12 extends Exam11 {
	Exam12(int a, int b) {
		this.a = a;
		this.b = b;

	}

	public static void main(String[] args) {
		Exam12 e12 = new Exam12(10, 5);
		e12.add();
		e12.printResult();

		e12.sub();
		e12.printResult();

		e12.mul();
		e12.printResult();

		e12.div();
		e12.printResult();

	}

}