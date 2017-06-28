package report.songwoojae.r0006;

public class NewExam {
	public static void main(String[] args) {
		String str1 = "a";
		String str2 = "a";//위의 주소를 갖다씀
		System.out.println(str1 == str2);//주소값 비교
		str1 = new String("b");
		str2 = new String("b");//주소를 새로 만듬
		System.out.println(str1 == str2);
	}

}
