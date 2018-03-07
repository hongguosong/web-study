package com.itqinxun.dao;

import java.util.List;

import com.itqinxun.model.Image;

public interface ImageDao {
	public int addImage(Image img);//新增图片信息
	public List<Image> searchImageAll();//查询所有图片信息
}
