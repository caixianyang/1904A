package com.fh.service;

import com.fh.model.Category;

import java.util.List;

public interface CategoryService {
    List queryCategory(Integer id);

    List<Category> queryCoregoryList();

    void addCategory(Category category);

    void updateCategory(Category category);

    void deleteCategory(Integer id);
}
