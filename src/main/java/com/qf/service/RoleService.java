package com.qf.service;

import java.util.Set;

public interface RoleService {
    Set<String> queryRolesByUsername(String username);
}
