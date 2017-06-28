package report.songwoojae.r0005;

public class Robot {

	String name;
	int age;

	public Robot(String name, int age) {
		this.name = name;
		this.age = age;
	}

	void doKick() {
		System.out.println(age + "살 된 로봇" + name + "이 발차기를 하다");
	}

	void doRun() {
		System.out.println(age + "살 된 로봇" + name + "이 달리기를 하다");

	}

	void doChange() {
		System.out.println(age + "살 된 로봇" + name + "이 변신 하다");

	}

	public static void main(String[] args) {
		Robot r = new Robot("RRR", 48);
		r.doKick();
		r.doRun();
		r.doChange();
		
		

	}

}
