package report.songwoojae.r0009;

import java.util.HashMap;

public class MapExam2 {
	HashMap<String, Integer> hm;
	
	MapExam2(){
		hm = new HashMap<String, Integer>();
	}
	
	public static void main(String[] args){
		MapExam2 me = new MapExam2();
		me.hm.put("1",1);
		me.hm.put("2",2);
		me.hm.put("3",3);
		me.hm.put("4",4);
		me.hm.put("5",5);
		me.hm.toString();
		System.out.println(me.hm.containsKey("6"));
//		Iterator it = me.hm.keySet().iterator();
//		while(it.hasNext()){
//			String key = (String)it.next();
//			System.out.print(key + ",");
//			System.out.println(me.hm.get(key));
//		}
	}
}
