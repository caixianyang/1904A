package com.fh.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fh.model.Category;

import java.util.List;

public interface CategoryMapper extends BaseMapper<Category> {

    List queryCategory(Integer pid);

    List<Category> queryCoregoryList();
}
