package com.qf.cache;

import lombok.Getter;
import lombok.Setter;
import org.apache.shiro.cache.AbstractCacheManager;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;
import org.springframework.data.redis.core.RedisTemplate;
@Setter
@Getter
public class ShiroCacheManager extends AbstractCacheManager {

    private RedisTemplate redisTemplate;
    @Override
    protected Cache createCache(String s) throws CacheException {
        ShiroCache shiroCache=new ShiroCache(s);
        shiroCache.setRedisTemplate(redisTemplate);
        return shiroCache;
    }
}
