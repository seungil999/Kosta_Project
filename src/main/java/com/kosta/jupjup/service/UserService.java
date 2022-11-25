package com.kosta.jupjup.service;

import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface UserService {

	Map<String, Object> Join(Map<String, Object> param);

	Map<String, Object> checkgetLoginAvailable(Map<String, Object> param);

	



}
