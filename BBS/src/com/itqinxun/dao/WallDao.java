package com.itqinxun.dao;

import java.util.List;

import com.itqinxun.model.Wall;

public interface WallDao {
	public List<Wall> searchWall();
	public boolean deleteWall(int wall_id);
	public boolean addWall(Wall wall);
}
