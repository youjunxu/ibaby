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
        map.put("��ҳ", "manager.jsp");
        map.put("����ѧ԰", "firstBA.action");
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
            html.append("<div class=\"pager\"><span class=\"total\">��").append(pageCount).append("ҳ</span>");
            if (pageCurrent <= 1) {
                html.append("<span class=\"first\">��ҳ</span>").append("<span class=\"prev\">��һҳ</span>");
            } else {
                html.append("<span class=\"first\"><a href=\"javascript:void(0);\" data-index=\"1\">��ҳ</a></span>")
                        .append("<span class=\"prev\"><a href=\"javascript:void(0);\" data-index=\"").append(pageCurrent - 1).append("\">��һҳ</a></span>");
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
                html.append("<span class=\"next\">��һҳ</span>").append("<span class=\"last\">ĩҳ</span>");
            } else {
                html.append("<span class=\"next\"><a href=\"javascript:void(0);\" data-index=\"").append(pageCurrent + 1).append("\">��һҳ</a></span>")
                        .append("<span class=\"last\"><a href=\"javascript:void(0);\" data-index=\"").append(pageCount).append("\">ĩҳ</a></span>");
            }

            html.append("<span width=\"50\"><input class=\"page_num\" />")
                    .append("<a href=\"javascript:void(0);\" class=\"goto\">��ת</a></span>")
                    .append("</div>");
        }

        return html.toString();
    }


}
