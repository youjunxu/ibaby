package com.lhq.prj.bms.dao;

import com.lhq.prj.bms.po.GoodFriend;
import com.lhq.prj.bms.po.MemberGz;
import com.lhq.prj.bms.po.UserInfo;
public interface IMemberGzDao {
	public Integer saveMemberGz(MemberGz a);
	public Integer deleteHy(Integer s);
	public UserInfo findByUserInfo(UserInfo o);
	public GoodFriend findIsMyFriends(GoodFriend o);
}
