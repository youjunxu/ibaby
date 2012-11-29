package com.ibaby.www.util;

import com.sun.org.apache.bcel.internal.generic.NEW;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-20
 * Time: PM3:23
 * To change this template use File | Settings | File Templates.
 */
public abstract class ApplicationHelper {

    private final static Logger LOGGER = LoggerFactory.getLogger(ApplicationHelper.class);
    private final static DateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

    private ApplicationHelper() {
    }

    public static String toString(Object obj) {
        if (obj == null) {
            return "";
        } else {
            return obj.toString();
        }
    }


    public static Date parseDate(String dateString) {
        try {
            return DATE_FORMAT.parse(dateString);
        } catch (ParseException e) {
            LOGGER.warn("Can't parse {} to date", dateString);
        }
        return new Date();
    }

    public static Integer parseInt(String str) {
        return parseInt(str, null);
    }

    public static Integer parseInt(String str, Integer defaultValue) {
        if (StringUtils.hasText(str)) {
            try {
                return Integer.parseInt(str);
            } catch (Exception e) {
                //NO PMD
            }
        }
        LOGGER.warn("Can't parse {} to integer, use default: {}", str, defaultValue);
        return defaultValue;
    }

    public static String userNav(Integer moduleId) {
        String moduleName = ModuleConfig.moduleName(moduleId);
        return userNav(moduleName);
    }

    public static String userNav(String current) {
        Map<String, String> map = new LinkedHashMap<String, String>();
        map.put("首页", "manager.jsp");
        map.put("贝爱学园", "firstBA.action");
        return userNav(map, current);
    }

    public static String userNav(Map<String, String> map, String current) {
        StringBuilder html = new StringBuilder();
        for (String name : map.keySet()) {
            String link = map.get(name);
            html.append("<a class=\"navigation\" href=\"").append(link).append("\">")
                    .append(name).append("</a>").append(" > ");
        }
        html.append(current);
        return html.toString();
    }


    public static String pager(int pageCount, int pageSize, int pageCurrent) {
        StringBuilder html = new StringBuilder();
        if (pageCount > 1 && pageSize > 0) {
            html.append("<div class=\"pager\"><span class=\"total\">共").append(pageCount).append("页</span>");
            if (pageCurrent <= 1) {
                html.append("<span class=\"first\">首页</span>").append("<span class=\"prev\">上一页</span>");
            } else {
                html.append("<span class=\"first\"><a href=\"javascript:void(0);\" data-index=\"1\">首页</a></span>")
                        .append("<span class=\"prev\"><a href=\"javascript:void(0);\" data-index=\"").append(pageCurrent - 1).append("\">上一页</a></span>");
            }

            int max = 8, i = 0, start = 1, end = pageCount;
            if (pageCount > max) {
                start = end = pageCurrent;
                while (i < max) {
                    if (start > 1) {
                        start--;
                        i++;
                    }
                    if (end < pageCount) {
                        end++;
                        i++;
                    }
                }
            }

            for (i = start; i <= end; i++) {
                html.append("<span");
                if (i == pageCurrent) {
                    html.append(" class=\"current\">").append(i).append("</span>");
                } else {
                    html.append("><a href=\"javascript:void(0);\" data-index=\"")
                            .append(i).append("\">").append(i).append("</a></span>");
                }
            }

            if (pageCurrent >= pageCount) {
                html.append("<span class=\"next\">下一页</span>").append("<span class=\"last\">末页</span>");
            } else {
                html.append("<span class=\"next\"><a href=\"javascript:void(0);\" data-index=\"").append(pageCurrent + 1).append("\">下一页</a></span>")
                        .append("<span class=\"last\"><a href=\"javascript:void(0);\" data-index=\"").append(pageCount).append("\">末页</a></span>");
            }

            html.append("<span width=\"50\"><input class=\"page_num\" />")
                    .append("<a href=\"javascript:void(0);\" class=\"goto\">跳转</a></span>")
                    .append("</div>");
        }

        return html.toString();
    }


}
