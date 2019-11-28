package com.fh.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fh.model.Role;

import java.util.List;

public interface RoleMapper extends BaseMapper<Role> {

    List queryMapRoleList(Role role);

    Long queryCount(Role role);
}
