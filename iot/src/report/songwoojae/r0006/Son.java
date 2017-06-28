package report.songwoojae.r0006;

public class Son extends Father {
	int a;

	public static void main(String[] args) {
		Son s = new Son();
		s.a = 3;
		System.out.println(s.getAddress());
		System.out.println(s.getAge());
		System.out.println(s.getName());
		// Father f = new Father();
		s.getName("송우재");
		System.out.println(s.getName());
	}

}
