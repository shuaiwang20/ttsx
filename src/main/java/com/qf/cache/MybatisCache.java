package com.qf.cache;

import org.apache.ibatis.cache.Cache;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.context.ContextLoader;

import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

public class MybatisCache implements Cache {
    private RedisTemplate<String,Object> template;
    private String id;
    private ReentrantReadWriteLock lock;

    public MybatisCache(String id){
        this.id=id;
        lock=new ReentrantReadWriteLock();
        System.out.println(id);
    }
    @Override
    public String getId() {
        return id;
    }

    @Override
    public void putObject(Object o, Object o1) {
        template=ContextLoader.getCurrentWebApplicationContext().getBean("redisTemplate",RedisTemplate.class);
        System.out.println("把Mybatis二级缓存数据存放到redis中");
        System.out.println(o.toString());
        System.out.println("****************");
        System.out.println(o1.toString());
        template.opsForValue().set(o.toString(),o1);
    }

    @Override
    public Object getObject(Object o) {
        template= ContextLoader.getCurrentWebApplicationContext().getBean("redisTemplate",RedisTemplate.class);
        System.out.println("从redis缓存中取出Mybatis二级缓存数据");
        return template.opsForValue().get(o.toString());
    }

    @Override
    public Object removeObject(Object o) {
        template.delete(o.toString());
        return null;
    }

    @Override
    public void clear() {
        template= ContextLoader.getCurrentWebApplicationContext().getBean("redisTemplate",RedisTemplate.class);
        template.delete("*"+this.id+"*");
    }

    @Override
    public int getSize() {
        return 0;
    }

    @Override
    public ReadWriteLock getReadWriteLock() {
        return lock;
    }
}
