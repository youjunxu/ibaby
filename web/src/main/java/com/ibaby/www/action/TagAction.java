package com.ibaby.www.action;

import com.ibaby.www.dao.QueryParams;
import com.ibaby.www.dao.QueryParamsBuilder;
import com.ibaby.www.domain.service.TagService;
import com.ibaby.www.domain.valuetypes.Article;
import com.ibaby.www.domain.valuetypes.Tag;
import com.ibaby.www.util.ModuleConfig;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.ibaby.www.util.ApplicationHelper.*;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-20
 * Time: AM9:03
 * To change this template use File | Settings | File Templates.
 */
public class TagAction extends BaseAction {

    public static final String STATUS = "status";
    public static final String REASON = "reason";
    private TagService tagService;
    private List<Tag> tags;

    private Map<String, Object> result = new HashMap<String, Object>();

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }

    public Map<String, Object> getResult() {
        return result;
    }

    public void setTagService(TagService tagService) {
        this.tagService = tagService;
    }


    public String manageTags() {
        if (!checkUserPermission()) {
            return actionResult;
        }

        String limit = getRequest().getParameter("limit");
        Integer pageSize = parseInt(limit, 10);

        Integer tagCount = tagService.count();
        Integer pageCount = (int) Math.ceil(tagCount * 1.0 / pageSize);

        int start = doPager(pageCount, pageSize);

        HttpServletRequest request = getRequest();

        request.setAttribute("tagCount", tagCount);
        request.setAttribute("tagList", tagService.where(new QueryParamsBuilder().setStart(start).setLimit(pageSize).build()));
        return SUCCESS;
    }


    public String newTag() {
        if (!checkUserPermission()) {
            return actionResult;
        }
        HttpServletRequest request = getRequest();
        request.setAttribute("action", "saveTag.action");
        request.setAttribute("tag", new Tag());
        return SUCCESS;
    }

    public String saveTag() {
        if (!checkUserPermission()) {
            result.put(STATUS, "false");
            result.put(REASON, "Not have permission.");
        } else {
            try {
                tagService.save(tagMapFromParams());
                result.put(STATUS, true);
            } catch (Exception e){
                result.put(REASON, "Error for add tag:" + e.getMessage());
                result.put(STATUS, false);
            }
        }
        return SUCCESS;
    }

    public String editTag() {
        if (!checkUserPermission()) {
            return actionResult;
        }
        Integer id = parseInt(getRequest().getParameter("id"), -1);
        HttpServletRequest request = getRequest();
        request.setAttribute("action", "updateTag.action?id=" + id);
        request.setAttribute("tag", tagService.find(id));
        return SUCCESS;
    }

    public String updateTag() {
        if (!checkUserPermission()) {
            result.put(STATUS, "false");
            result.put(REASON, "Not have permission.");
        } else {
            Integer id = parseInt(getRequest().getParameter("id"), null);
            try {
                int count = 0;
                if(id != null){
                    count = tagService.update(tagMapFromParams(id));
                }
                if(count > 0){
                    result.put(STATUS, true);
                }else{
                    result.put(STATUS, false);
                    result.put(REASON, "Tag not changed.");
                }
            } catch (Exception e){
                result.put(REASON, "Error for update tag " + id + ", " + e.getMessage());
                result.put(STATUS, false);
            }
        }
        return SUCCESS;
    }

    public String deleteTag() {
        if (!checkUserPermission()) {
            result.put(STATUS, "false");
            result.put(REASON, "Not have permission.");
        } else {
            Integer id = parseInt(getRequest().getParameter("id"), -1);
            boolean status = tagService.delete(id);
            result.put(STATUS, status);
            if(!status){
                result.put(REASON, "Doesn't exist the tag with id " + id);
            }
        }
        return SUCCESS;
    }

    public String findTags() {
        String term = getRequest().getParameter("term");
        String module = getRequest().getParameter("module");
        tags = tagService.search(term, parseInt(module, -1));
        return SUCCESS;
    }


    public String findCatalogs() {
        String term = getRequest().getParameter("term");
        result.put("catalogs", tagService.findCatalogs(term));
        return SUCCESS;
    }


    private Map<String, Object> tagMapFromParams(){
        return tagMapFromParams(null);
    }

    private Map<String, Object> tagMapFromParams(Integer id){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", id);
        map.put("name", getRequest().getParameter("tag[name]"));
        map.put("description", getRequest().getParameter("tag[description]"));
        map.put("catalog_id", getRequest().getParameter("tag[catalog]"));
        return map;
    }
}
