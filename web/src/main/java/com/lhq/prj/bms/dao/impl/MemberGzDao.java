package com.lhq.prj.bms.dao.impl;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import com.lhq.prj.bms.po.MemberGz;
import com.lhq.prj.bms.po.UserInfo;
import com.lhq.prj.bms.po.GoodFriend;
import com.lhq.prj.bms.dao.IMemberGzDao;

public class MemberGzDao extends SqlMapClientDaoSupport implements IMemberGzDao{
	public Integer saveMemberGz(MemberGz a)
	{
		return (Integer)getSqlMapClientTemplate().insert("MemberGz.save", a);
	}
	public Integer deleteHy(Integer s)
	{
		return (Integer)getSqlMapClientTemplate().delete("MemberGz.deleteById", s);
	}
	public UserInfo findByUserInfo(UserInfo o)
	{
		return (UserInfo)getSqlMapClientTemplate().queryForObject("UserInfo.findByUserName", o);
	}
	public GoodFriend findIsMyFriends(GoodFriend o)
	{
		return (GoodFriend)getSqlMapClientTemplate().queryForObject("GoodFriend.findIsMyFriends", o);
	}
}
