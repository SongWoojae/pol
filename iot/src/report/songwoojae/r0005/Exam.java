package report.songwoojae.r0005;

public class Exam {
	public static void main(String[] args) {
		Robot r = new Robot("지로봇", 10);

		r.doKick();
		r.doRun();
		r.doChange();

		for (int i = 1; i < 11; i++) {
			Cal c = new Cal(i, 11-i, "+");
			c.printCal();
			
		}

	}

}
