package com.ibaby.www.dao.impl;

import com.ibaby.www.dao.TagDao;
import com.ibaby.www.domain.valuetypes.Tag;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-19
 * Time: AM11:04
 * To change this template use File | Settings | File Templates.
 */
public class TagDaoImpl extends SqlMapClientDaoSupport implements TagDao {

    public void save(Tag tag) {
        getSqlMapClientTemplate().insert("Tag.save", tag);
    }

    public Tag findTagById(Integer id)
	{
		return (Tag)getSqlMapClientTemplate().queryForObject("Tag.findTagById", id);
	}

    public List findAllTags()
	{
		return (List)getSqlMapClientTemplate().queryForList("Tag.findAllTags");
	}

}
