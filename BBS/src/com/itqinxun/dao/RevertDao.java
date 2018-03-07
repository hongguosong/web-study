package com.itqinxun.dao;

import java.util.List;

import com.itqinxun.model.Revert;

public interface RevertDao {

	public   int   addRevert(Revert revert);//新增回帖
    public   boolean   deleteRevert(Revert revert); //根据帖子id删除回帖
    public   boolean   deleteRevertByaccount_account(int account_account);      //根据用户数字账号，删除该用户回帖
    public   boolean   deleteRevertbyMessageid(int messageid);                  //根据主题帖id删除所有回帖
    public     List<Revert>     searchRevertALL();//显示所有回帖
    public     List<Revert>     searchNewRevertALL();//显示最新回帖
    public     List<Revert>     searchRevertById(int account_account);          //根据用户id查询该用户的所有回复
    public   List<Revert> returnRevertBymessage_id( int messageid);             //显示所有主题帖信息给用户，包括发帖人名字，回帖数
    public int returnRevertNum(int messageid);

}
