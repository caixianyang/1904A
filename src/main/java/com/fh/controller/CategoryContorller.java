package com.fh.controller;

import com.fh.common.ServerResponse;
import com.fh.model.Category;
import com.fh.service.CategoryService;
import com.fh.util.RedisLocker;
import com.fh.util.SystemConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping("category/")
public class CategoryContorller {

        @Autowired
      private CategoryService categoryService;//

        @RequestMapping("toList")
        public String toList(){
            return "categoryList";
        }

    @RequestMapping("queryCategory")
    @ResponseBody
        public List queryResource(Integer pid){
       List<Category> categoryList =  categoryService.queryCategory(pid);

            return categoryList;
        }

        @RequestMapping("queryCoregoryList")
        @ResponseBody
        public List queryCoregoryList(){
            List<Category> list = categoryService.queryCoregoryList();
            return list;
        }

    @RequestMapping("addCategory")
    @ResponseBody
        public ServerResponse addCategory(Category category){
        categoryService.addCategory(category);
            return ServerResponse.success();
        }


    @RequestMapping("updateCategory")
    @ResponseBody
    public ServerResponse updateCategory(Category category){
        categoryService.updateCategory(category);
        return ServerResponse.success();
    }

    @RequestMapping("deleteCategory")
    @ResponseBody
    public ServerResponse deleteCategory(Integer id){
        categoryService.deleteCategory(id);
        return ServerResponse.success();
    }


}
