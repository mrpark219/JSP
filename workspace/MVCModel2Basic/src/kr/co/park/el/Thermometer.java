package kr.co.park.el;

import java.util.*;

public class Thermometer {

	private Map<String, Double> degrees = new HashMap<>();
	
	public void setDegrees(String city, double celsius) {
		degrees.put(city, celsius);
	}
	
	public double getDegrees(String city) {
		return degrees.get(city);
	}
	
	//섭씨를 화씨로 변환해주는 메서드.
	public double change(String city) {
		return getDegrees(city) * 1.8 + 32;
	}
	
	
}
