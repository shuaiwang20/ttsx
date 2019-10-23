package com.qf.realm;

import com.qf.dao.PermissionDao;
import com.qf.dao.RoleDao;
import com.qf.dao.UserDao;
import com.qf.pojo.User;
import com.qf.service.PermissionService;
import com.qf.service.RoleService;
import com.qf.service.UserService;
import lombok.Setter;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import java.util.Set;

@Setter
public class Myrealm extends AuthorizingRealm {

    private UserService userService;
    private PermissionService permissionService;
    private RoleService roleService;

    //获取所有权限
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String username = (String) principalCollection.getPrimaryPrincipal();
        Set<String> roles = roleService.queryRolesByUsername(username);
        Set<String> permissions = permissionService.queryPemissionsByUsername(username);
        SimpleAuthorizationInfo simpleAuthorizationInfo=new SimpleAuthorizationInfo(roles);
        simpleAuthorizationInfo.setStringPermissions(permissions);
        return simpleAuthorizationInfo;
    }

    //获取身份信息
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String username = (String) authenticationToken.getPrincipal();

        User user = userService.selectByUsernameAndPassword(username, null);
        if (user==null){
            return null;
        }
        SimpleAuthenticationInfo simpleAuthenticationInfo=new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), ByteSource.Util.bytes(user.getSalt()),this.getName());
        return simpleAuthenticationInfo;
    }
}
