package com.test;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.beanutils.PropertyUtilsBean;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.util.*;

/*参考：http://blog.csdn.net/u010882234/article/details/64919885*/
public class JsonToJava {

    public static void main(String[] args) throws Exception {
        Map<String, String> map = new HashMap();
        String jsonMessage = "[{'num':'Score', 'E':88, 'H':65, 'G':99, 'object':{'aaa':'1111','bbb':'2222','cccc':'3333'}}," +
                "{'num':'Fun', 'E':28, 'H':45, 'G':19, 'object':{'aaa':'11a11','bbb':'2222','cccc':'3333'}}," +
                "{'num':'Love', 'E':48, 'H':62, 'G':39, 'object':{'aaa':'11c11','bbb':'2222','cccc':'3333'}}]";
        String jsonString = "[{'key':'score', 'value':'88'}," +
                "{'key':'fun', 'value':'28'}," +
                "{'key':'love', 'value':'48'}]";
        String data = "[{'key':'activity_area_stability','value':'03'}," + "{'key':'last_1y_total_active_biz_cnt','value':'10'}]";
        JSONArray myJsonArray = JSON.parseArray(jsonString);
        for (int i = 0; i < myJsonArray.size(); i++) {
            String string = myJsonArray.get(i).toString();
            map map1 = JSON.parseObject(string, map.class);
            map.put(map1.getKey(), map1.getValue());
        }
        A a = mapToBean(A.class, map);
        System.out.println("map to bean=" + a);
        Map<String, Object> stringObjectMap = beanToMap(a);
        System.out.println("bean to map=" + stringObjectMap);

    }

    /**
     * 将JavaBean实体类转为map类型，然后返回一个map类型的值
     *
     * @param obj，要转化的JavaBean 对象
     * @return 需要返回的map
     */
    public static Map<String, Object> beanToMap(Object obj) {
        Map<String, Object> params = new HashMap<String, Object>(0);
        try {
            PropertyUtilsBean propertyUtilsBean = new PropertyUtilsBean();
            PropertyDescriptor[] descriptors = propertyUtilsBean.getPropertyDescriptors(obj);
            for (int i = 0; i < descriptors.length; i++) {
                String name = descriptors[i].getName();
                if (!"class".equals(name)) {
                    if (propertyUtilsBean.getNestedProperty(obj, name) != null) {
                        params.put(name, propertyUtilsBean.getNestedProperty(obj, name));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return params;
    }

    /**
     * 将一个 Map 对象转化为一个 JavaBean
     *
     * @param clazz 要转化的类型
     * @param map   包含属性值的 map
     * @return 转化出来的 JavaBean 对象
     * @throws IntrospectionException
     * @throws IllegalAccessException
     * @throws InstantiationException
     * @throws InvocationTargetException
     */
    public static <T> T mapToBean(Class<T> clazz, Map<?, ?> map) {
        T obj = null;
        try {
            BeanInfo beanInfo = Introspector.getBeanInfo(clazz);
            obj = clazz.newInstance(); // 创建 JavaBean 对象

            // 给 JavaBean 对象的属性赋值
            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
            for (int i = 0; i < propertyDescriptors.length; i++) {
                PropertyDescriptor descriptor = propertyDescriptors[i];
                String propertyName = descriptor.getName();
                if (map.containsKey(propertyName)) {
                    // 下面一句可以 try 起来，这样当一个属性赋值失败的时候就不会影响其他属性赋值。
                    Object value = map.get(propertyName);
                    if ("".equals(value)) {
                        value = null;
                    }
                    Object[] args = new Object[1];
                    args[0] = value;
                    try {
                        descriptor.getWriteMethod().invoke(obj, args);
                    } catch (InvocationTargetException e) {
                        System.out.println("字段映射失败");
                    }
                }
            }
        } catch (IllegalAccessException e) {
            System.out.println("实例化 JavaBean 失败");
        } catch (IntrospectionException e) {
            System.out.println("分析类属性失败");
        } catch (IllegalArgumentException e) {
            System.out.println("映射错误");
        } catch (InstantiationException e) {
            System.out.println("实例化 JavaBean 失败");
        }
        return (T) obj;
    }

    public static <T> T JsonArrayToBean(Class<T> clazz, String jsonArray) {
        T obj = null;
        try {
            BeanInfo beanInfo = Introspector.getBeanInfo(clazz);
            obj = clazz.newInstance(); // 创建 JavaBean 对象

            // 给 JavaBean 对象的属性赋值
            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
            for (int i = 1; i < propertyDescriptors.length; i++) {
                PropertyDescriptor descriptor = propertyDescriptors[i];
                String propertyName = descriptor.getName();
                System.out.println("propertyName=" + propertyName);
                String string = jsonArray.toString();
                System.out.println(string);
                DemoTest demoTest = JSON.parseObject(jsonArray, DemoTest.class);
                System.out.println(demoTest);

                if (1 > 0) {
                    Object value = propertyName;
                    if ("".equals(value)) {
                        value = null;
                    }
                    Object[] args = new Object[1];
                    args[0] = value;
                    try {
                        descriptor.getWriteMethod().invoke(obj, args);
                    } catch (InvocationTargetException e) {
                        System.out.println("字段映射失败");
                    }
                }
            }
        } catch (IllegalAccessException e) {
            System.out.println("非法接入");
        } catch (IntrospectionException e) {
            System.out.println("分析类属性失败");
        } catch (IllegalArgumentException e) {
            System.out.println("映射错误");
        } catch (InstantiationException e) {
            System.out.println("实例化 JavaBean 失败");
        }
        return (T) obj;
    }

}
