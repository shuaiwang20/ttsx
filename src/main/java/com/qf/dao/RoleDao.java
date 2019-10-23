package com.qf.dao;

import java.util.Set;

public interface RoleDao {
    Set<String> queryRolesByUsername(String username);
}
