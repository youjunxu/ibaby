package com.ibaby.www.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import static com.ibaby.www.util.ApplicationHelper.*;

/**
 * Created by IntelliJ IDEA.
 * User: James
 * Date: 12-11-19
 * Time: PM4:58
 * To change this template use File | Settings | File Templates.
 */
public class QueryParamsBuilder {

    private static final Logger LOGGER = LoggerFactory.getLogger(QueryParams.class);

    private static final String CONDITIONS = "conditions";
    private final ConcurrentMap<String, Object> target = new ConcurrentHashMap<String, Object>();
    {
        target.put("limit", 65536);
        target.put("start", 0);
    }

    private StringBuilder conditions = new StringBuilder();

    public QueryParamsBuilder setStart(String startString){
        Integer start = parseInt(startString);
        return addParam("start", start);
    }

    public QueryParamsBuilder setLimit(String limitString){
        Integer start = parseInt(limitString);
        return addParam("start", start);
    }

    public QueryParamsBuilder setStart(Integer start){
        return addParam("start", start);
    }

    public QueryParamsBuilder setLimit(Integer limit){
        return addParam("limit", limit);
    }

    public QueryParamsBuilder and(String clause){
        if(StringUtils.hasText(conditions)){
            conditions.append(" and ").append(clause);
        } else {
            conditions.append(" where ").append(clause);
        }
        return this;
    }

    public QueryParamsBuilder or(String clause){
        if(StringUtils.hasText(conditions)){
            conditions.append(" or ").append(clause);
        } else {
            conditions.append(" where ").append(clause);
        }
        return this;
    }

    public QueryParamsBuilder where(String clause){
        return and(clause);
    }

    public QueryParamsBuilder addParam(String name, Object value){
        if(value != null){
            LOGGER.debug("put name => {}, value => {} to queryParams.", name, value);
            target.put(name, value);
        }
        return this;
    }

    public int getStart(){
        return (Integer)target.get("start");
    }

    public int getLimit(){
        return (Integer)target.get("limit");
    }

    public QueryParams build(){
        if (conditions.length() == 0){
            conditions.append(" where 1 = 1 ");
        }
        target.put(CONDITIONS, conditions.toString());
        LOGGER.debug("DUMP QUERYPARAMS => {}", target);
        return (QueryParams)Proxy.newProxyInstance(QueryParams.class.getClassLoader(),
            new Class<?>[]{QueryParams.class}, new InvocationHandler() {
            public Object invoke(Object o, Method method, Object[] objects) throws Throwable {
                if(method.getName().startsWith("get")){
                    String propertyName = method.getName().replace("get", "").toLowerCase(Locale.getDefault());
                    return target.get(propertyName);
                }
                return null;
            }
        });
    }

}
