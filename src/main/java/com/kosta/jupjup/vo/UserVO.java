package com.kosta.jupjup.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {

	private String username;

	private String nickname;

	private String id;

	private String pwd;

	private String email;

	private String phone;

	private String gender;

}
