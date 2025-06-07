package com.chenwanyu.service.impl;

import com.chenwanyu.mapper.RoleMapper;
import com.chenwanyu.po.Role;
import com.chenwanyu.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    public Role findByid(Integer id) throws Exception {
        return roleMapper.selectByPrimaryKey(id);
    }
}
