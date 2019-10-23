package com.qf.service;

import com.qf.dao.RoleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Set;

@Service("roleService")
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao roleDao;
    @Override
    public Set<String> queryRolesByUsername(String username) {
        return roleDao.queryRolesByUsername(username);
    }
}
