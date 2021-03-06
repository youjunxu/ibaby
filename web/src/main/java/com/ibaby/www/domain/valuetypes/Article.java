package com.ibaby.www.domain.valuetypes;

import com.lhq.prj.bms.po.UserInfo;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-24
 * Time: PM3:12
 * To change this template use File | Settings | File Templates.
 */
public class Article implements Serializable{

    private Integer id;
    private UserInfo user;
    private String title;
    private String author;
    private String username;
    private List<String> deprecateTags;
    private List<Tag> tags;
    private String summary;
    private String content;
    private Integer readCount;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public UserInfo getUser() {
        return user;
    }

    public void setUser(UserInfo user) {
        this.user = user;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<String> getDeprecateTags() {
        return deprecateTags;
    }

    public void setDeprecateTags(String deprecateTags) {
        if(StringUtils.hasText(deprecateTags)){
            this.deprecateTags = Arrays.asList(StringUtils.tokenizeToStringArray(deprecateTags, ","));
        }
    }

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public Integer getReadCount() {
        return readCount;
    }

    public void setReadCount(Integer readCount) {
        this.readCount = readCount;
    }
}
