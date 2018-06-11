package com.nchu.fruit.mapper;

import java.util.List;
import java.util.Map;

import com.nchu.fruit.pojo.Cars;

public interface CarsMapper {
	
	Cars getCarById(String f_id,String u_id) throws Exception;

	int updateAmout(Cars pcar);

	int insertCar(Cars pcar);

	List<Map<String, String>> getMapList(String users_id);
	
	List<Map<String, String>>  getMapListCarAll(String users_id);
	
	int deleteCar(String userid, Integer integer);

	

}
