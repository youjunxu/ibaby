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
    private String content;

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

    //TODO
    public String toString(){
        StringBuilder sb = new StringBuilder('{');
        sb.append("id: ").append(id).append(',')
            .append("username: ").append(username).append(',')
            .append("title: ").append(title).append(',')
            .append("content: ").append(content).append(',')
            .append("tags: [").append(StringUtils.collectionToDelimitedString(tags, ", ")).append("],")
            .append("author: ").append(author);
        sb.append('}');
        return sb.toString();
    }
}
