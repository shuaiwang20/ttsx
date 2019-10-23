package com.qf.session;

import lombok.Getter;
import lombok.Setter;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.eis.AbstractSessionDAO;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.springframework.data.redis.core.RedisTemplate;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

@Setter
@Getter
public class MySessionDAO extends AbstractSessionDAO {
    private RedisTemplate template;

    @Override
    protected Serializable doCreate(Session session) {
        // 生成sessionID
        Serializable sessionId = generateSessionId(session);
        //存入redis
        System.out.println("保存session到redis");
        assignSessionId(session,sessionId);// 将sessionID赋值给Session对象
        // key = 前缀+sessionID  ;  value = session对象
        //template.opsForValue().set("session"+sessionId,session);//Session对象存入Redis，存入时定义了"前缀"
        // Session对象存入Redis，存入时定义了"前缀",且定义了超时时间
        template.opsForValue().set("session:"+sessionId,session,18000, TimeUnit.SECONDS);
        return sessionId;
    }

    @Override
    protected Session doReadSession(Serializable serializable) {
//        System.out.println("获取session");
        Session session = (Session) template.opsForValue().get("session:" + serializable);
        template.expire("session:"+serializable,18000,TimeUnit.SECONDS);
        return session;
    }

    @Override
    public void update(Session session) throws UnknownSessionException {
//        System.out.println("存储session");
        template.opsForValue().set("session:"+session.getId(),session);
        template.expire("session:"+session.getId(),18000,TimeUnit.SECONDS);
    }

    @Override
    public void delete(Session session) {
//        System.out.println("删除session");
        template.delete("session"+session.getId());
    }

    @Override
    public Collection<Session> getActiveSessions() {
        Set keys = template.keys("session*");//通过前缀获取Session
        List<Session> list = template.opsForValue().multiGet(keys);
        return list;
    }
}
