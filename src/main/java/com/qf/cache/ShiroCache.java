package com.qf.cache;

import lombok.Getter;
import lombok.Setter;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.Collection;
import java.util.Set;

@Setter
@Getter
public class ShiroCache implements Cache {

    private RedisTemplate<String,Object> redisTemplate;
    private String name;//“com.qf.realm.MyRealm.authorizationCache”

    public ShiroCache(String name){
        this.name=name;
        System.out.println(name);
    }
    @Override
    public Object get(Object o) throws CacheException {
        System.out.println("Shiro的权限缓存Key为"+o.toString());
        Object o1 = redisTemplate.opsForValue().get("name"+o.toString());//使用"name:"+name作为key存储
        return o1;
    }

    @Override
    public Object put(Object o, Object o2) throws CacheException {
        redisTemplate.opsForValue().set("name"+o.toString(),o2);
        return null;
    }

    @Override
    public Object remove(Object o) throws CacheException {
        Set<String> keys = redisTemplate.keys("name:" + o.toString());
        redisTemplate.delete(keys);
        return null;
    }

    @Override
    public void clear() throws CacheException {

    }

    @Override
    public int size() {
        return 0;
    }

    @Override
    public Set keys() {
        return null;
    }

    @Override
    public Collection values() {
        return null;
    }
}
