package report.songwoojae.r0005;

public class Cal {
	int a; // 멤버 변수
	int b;
	String c;
	
	
	Cal(){
		
	}

	Cal(int a){
		System.out.println(a + "인트형 변수 파라메터를 한개를 가진 생성자를 호출하셨네요!");
		this.a =a;
	}
	Cal(int a, int b, String c) {
		this.a = a;
		this.b = b;
		this.c = c;
	}

	void printCal() {
		if (c.equals("+")) {
			System.out.println((a + c + b) + "=" + (a + b));
		} else if (c.equals("-")) {
			System.out.println((a + c + b) + "=" + (a - b));

		} else if (c.equals("*")) {
			System.out.println((a + c + b) + "=" + (a * b));

		} else if(c.equals("/")){
			System.out.println((a + c + b) + "=" + (a / b));
			}else
			{
				System.out.println("ERROR");
			}
	}

	public void printPlus() {
		System.out.println("출력 값 = " + (a + b));

	}

	public static void main(String[] agrs) {
		Cal c = new Cal(4, 2, "/");
		c.printPlus();
		c.printCal();

	}

}
