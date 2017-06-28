package report.songwoojae.r0006;

public class Father {
	private String address = "서울시 강서구 가양동";
	private int age = 65;
	private String name = "박철수";
	
	int getAge(){
	 return age;
	 
	
	 }
	String getAddress(){
		return address;
	}
	String getName(){
		return name;
	}
	void getName(String name){
		this.name = name;
	}
}
