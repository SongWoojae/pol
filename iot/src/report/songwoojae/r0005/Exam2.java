package report.songwoojae.r0005;

public class Exam2 {
	public static void main(String[] args) {
		Cal[] c = new Cal[5];
		
		for (int i = 0; i < 5; i++) {
			c[i] = new Cal(i + 1);
		}
		for (int i = 0; i < 5; i++){
			System.out.println(c[i].a);
		}

		// Cal c0 = null;
	}

}
