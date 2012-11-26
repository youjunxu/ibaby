package com.lhq.prj.bms.service;

import com.lhq.prj.bms.po.GoodFriend;
import com.lhq.prj.bms.po.MemberGz;
import com.lhq.prj.bms.po.UserInfo;

public interface IMemberGzService {
	Integer saveMemberGz(MemberGz a);
	boolean deleteHy(Integer s);
	UserInfo findByUserInfo(UserInfo o);
	GoodFriend findIsMyFriends(GoodFriend o);
}
