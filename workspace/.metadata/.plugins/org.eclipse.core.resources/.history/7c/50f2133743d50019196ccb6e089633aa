import java.util.*;

public class ListExample {

	public static void main(String[] args) {
		
		//String[] str = new String[100];
		List<String> list = new ArrayList<>();
		
		String str1 = "개구리";
		
		//list에 객체를 추가: add(객체)
		list.add("멍멍이");
		list.add("야옹이");
		list.add("짹짹이");
		list.add(str1);
		list.add("야옹이"); //list는 객체의 중복 저장을 허용합니다.
		System.out.println(list);
		
		//list에 객체 삽입(내가 지정한 위치에): add(index, 객체): 객체를 해당 인덱스에 삽입.
		list.add(2,"어흥이");
		System.out.println(list);
		
		//list에 저장된 총 객체의 수 얻기: size()
		int size = list.size();
		System.out.println("list에 저장된 요소의 갯수: " + size);
		
		//list의 데이터 수정: set(index, 수정할 객체)
		list.set(3,"메롱이");
		System.out.println(list);
		
		//list의 저장된 객체 참조하기: get(index)
		String nick = list.get(4);
		System.out.println("4번 인덱스의 값: " + nick);
		
		//list에서 객체 데이터 삭제: remove(index), remove (객체);
		list.remove(5);
		System.out.println(list);
		
		list.remove("멍멍이");
		System.out.println(list);
		
		//list내부에 저장된 객체의 존재 유무를 파악: contains(객체)
		System.out.println(list.contains("어흥이"));
		System.out.println(list.contains("삐약이"));
		
		//list의 반복문 처리
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i));
		}
		System.out.println("------------------------------------");
		
		//list의 향상 for문
		for(String n :list) {
			System.out.println(n);
		}
		/*
		String[] week = {"월", "화", "수", "목", "금", "토", "일"};
		System.out.println();
		//System.out.println(Arrays.toString(week)); //배열 값 전체 출력
		for(String str : week) {
			System.out.println(str+"요일");
		}
		*/
		
		//리스트 내부 객체의 인덱스 확인: indexOf(객체)
		int idx = list.indexOf("어흥이");
		System.out.println("어흥이가 위치한 인덱스: "+idx);
		
		//list 내부 객체 전체 삭제: clear()
		list.clear();
		System.out.println(list);
		
		//list내부가 비어있는지의 여부를 확인: isEmpty()
		System.out.println(list.isEmpty());
		
		
		//리스트의 정렬
		
		List<Integer> scores = new ArrayList<>();
		scores.add(95); scores.add(47); scores.add(69);
		scores.add(80); scores.add(100); scores.add(21);
		
		System.out.println(scores);
		
		//오름차순 정렬
		Collections.sort(scores);
		System.out.println(scores);
		
		//내림차순 정렬
		Collections.sort(scores, Collections.reverseOrder());
		System.out.println(scores);
	}

}
