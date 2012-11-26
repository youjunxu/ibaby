package com.ibaby.www.action;

import com.ibaby.www.domain.service.ArticleService;
import com.ibaby.www.domain.service.TagService;
import com.ibaby.www.domain.valuetypes.Article;
import com.ibaby.www.domain.valuetypes.Tag;
import com.ibaby.www.util.ModuleConfig;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.ibaby.www.util.ApplicationHelper.parseInt;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-25
 * Time: AM1:51
 * To change this template use File | Settings | File Templates.
 */
public class ArticleAction extends BaseAction {

    private TagService tagService;
    private ArticleService articleService;

    private Map<String, Object> result = new HashMap<String, Object>();

    public String listByModule(){
        Integer moduleId = findModuleId();
        Integer total = articleService.countByModule(moduleId);

        List<Article> articles = findArticles(1, moduleId, total);
        list(articles);
        return SUCCESS;
    }

    public String listByTag(){
        Integer tagId = parseInt(getRequest().getParameter("tag_id"), 1);
        Integer total = tagService.articleCount(tagId);

        List<Article> articles = findArticles(0, tagId, total);
        list(articles);
        return SUCCESS;
    }

    private List<Article> findArticles(int type, int id, int total) {
        String limit = getRequest().getParameter("limit");
        Integer pageSize = parseInt(limit, 10);

        Integer pageCount = (int) Math.ceil(total * 1.0 / pageSize);
        int start = doPager(pageCount, pageSize);

        if (type == 0) {//FIND BY TAG.
            return tagService.findArticles(id, start, pageSize);
        } else {//FIND BY MODULE.
            return articleService.findWithModule(id, start, pageSize);
        }
    }

    private void list(List<Article> articles){
        int moduleId = findModuleId();

        String moduleName = ModuleConfig.moduleName(moduleId);
        List<Tag> tags = tagService.findTagsByGroup(moduleId);

        HttpServletRequest request = getRequest();
        request.setAttribute("articles", articles);
        request.setAttribute("moduleId", moduleId);
        request.setAttribute("moduleName", moduleName);
        request.setAttribute("tagList", tags);

        result.put("articles", articles);
    }

    private int findModuleId(){
       //TODO we will remove the lmCode and just use module_id.
        Integer moduleId = parseInt(getRequest().getParameter("lmCode"), 6);
        moduleId = parseInt(getRequest().getParameter("module_id"), moduleId);
        return moduleId;
    }


    public TagService getTagService() {
        return tagService;
    }

    public void setTagService(TagService tagService) {
        this.tagService = tagService;
    }

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }


    public Map<String, Object> getResult() {
        return result;
    }
}
