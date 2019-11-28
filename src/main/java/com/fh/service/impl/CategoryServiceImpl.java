package com.fh.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.fh.mapper.CategoryMapper;
import com.fh.model.Category;
import com.fh.service.CategoryService;
import com.fh.util.RedisLocker;
import com.fh.util.RedisUtil;
import com.fh.util.SystemConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryMapper categoryMapper;//

    @Override
    public List queryCategory(Integer pid) {
        return categoryMapper.queryCategory(pid);
    }

    @Override
    public List<Category> queryCoregoryList() {
        return categoryMapper.queryCoregoryList();
    }

    @Override
    public void addCategory(Category category) {
        categoryMapper.insert(category);
        setdataRedis();

    }



    @Override
    public void updateCategory(Category category) {
        categoryMapper.updateById(category);
        setdataRedis();
    }

    @Override
    public void deleteCategory(Integer id) {
        categoryMapper.deleteById(id);
        setdataRedis();
    }

    /**
     * 将最新的分类数据放到redis中
     */
    private void setdataRedis() {
        boolean hasKey = RedisLocker.isAcquired(SystemConstant.CATEGORYLIST_LOCK, SystemConstant.REDIS_KEY_OUT_TIME);
        if (hasKey) {
            List<Category> list = categoryMapper.queryCoregoryList();
            String jsonString = JSONArray.toJSONString(list);
            RedisUtil.set(SystemConstant.CATEGORYLIST, jsonString);
            RedisLocker.release(SystemConstant.CATEGORYLIST_LOCK);
        }
    }

}
