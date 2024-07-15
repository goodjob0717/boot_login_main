package com.boot.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.boot.dto.UserMemDTO;

//나상엽

@Mapper
public interface UserMemDAO {
	public ArrayList<UserMemDTO> loginyn(HashMap<String, String> param);
	public void write(HashMap<String, String> param);
	public void insertUser(UserMemDTO user);
	public UserMemDTO checkUserId(String userId);
}