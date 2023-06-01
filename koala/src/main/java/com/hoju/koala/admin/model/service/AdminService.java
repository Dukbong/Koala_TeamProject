package com.hoju.koala.admin.model.service;

import java.util.ArrayList;

import com.hoju.koala.admin.model.vo.AllCount;
import com.hoju.koala.admin.model.vo.Supporters;

public interface AdminService {
	AllCount selectAllCount();

	ArrayList<Supporters> selectSupporters();
}
