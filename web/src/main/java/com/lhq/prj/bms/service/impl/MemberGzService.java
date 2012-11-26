package com.lhq.prj.bms.service.impl;

import com.lhq.prj.bms.dao.IMemberGzDao;
import com.lhq.prj.bms.service.IMemberGzService;
import com.lhq.prj.bms.po.GoodFriend;
import com.lhq.prj.bms.po.MemberGz;
import com.lhq.prj.bms.po.UserInfo;
public class MemberGzService implements IMemberGzService{
	private IMemberGzDao memberGzDao;
	public void setMemberGzDao(IMemberGzDao a)
	{
		this.memberGzDao=a;
	}
	public Integer saveMemberGz(MemberGz a)
	{
		return memberGzDao.saveMemberGz(a);
	}
	public boolean deleteHy(Integer s) {
		Integer flag = memberGzDao.deleteHy(s);
		if (flag != null) {
			return true;
		}
		return false;
	}
	public UserInfo findByUserInfo(UserInfo o)
	{
		return memberGzDao.findByUserInfo(o);
	}
	public GoodFriend findIsMyFriends(GoodFriend o)
	{
		return memberGzDao.findIsMyFriends(o);
	}
}
