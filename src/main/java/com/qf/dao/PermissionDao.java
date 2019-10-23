package com.qf.dao;

import java.util.Set;

public interface PermissionDao {
    Set<String> queryPemissionsByUsername(String username);
}
