package com.ibaby.www.dao;

import com.ibaby.www.domain.valuetypes.Tag;
import com.lhq.prj.bms.po.AclInfo;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-19
 * Time: AM11:05
 * To change this template use File | Settings | File Templates.
 */
public interface TagDao {


    void save(Tag tag);

    Tag findTagById(Integer id);

    List findAllTags();
}
