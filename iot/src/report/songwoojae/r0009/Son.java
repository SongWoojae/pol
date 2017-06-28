package report.songwoojae.r0009;

public class Son extends Father{
	public String toString(){
		return "아부지 아들입니다.";
	}
	
	public static void main(String[] args){
		Father f = new Father();
		System.out.println(f);
		Father s = new Son();
		System.out.println(s);
	}
}
