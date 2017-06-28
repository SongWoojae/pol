package report.songwoojae.r0003;

public class ArrayExam5 {

	public static void main(String[] args) {
		int[] a = new int[6];

		for (int i = 0; i < 6; i++) {
			int random = (int) (Math.random() * 45) + 1;
			a[i] = random;		
			
			for(int j=1;j>=0;j--){
				if(j<20 && a[j]==a[i] && i!=j){
					j=0;
					i--;
				}
			}
			}
		for(int i=0;i<20;i++){
			System.out.println((i+1)+"번째 로또번호는 : "+ a[i]);
		}
		
		}
	
	
		//System.out.println((i+1)+"번 째 로또번호는 : "+a[i]);
	}
		

