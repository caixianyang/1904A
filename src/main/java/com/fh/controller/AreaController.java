package com.fh.controller;

import com.fh.model.Area;
import com.fh.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("area/")
public class AreaController {
    @Autowired
    private AreaService areaService;//

    @RequestMapping("toList")
    public String toList(){
        return "area/list";
    }

    @RequestMapping("queryArea")
    @ResponseBody
    public List queryArea(Integer pid){
        List<Area> areaList =  areaService.queryArea(pid);

        return areaList;
    }

    @RequestMapping("queryAreaList")
    @ResponseBody
    public List queryAreaList(){
        List<Area> list = areaService.queryAreaList();
        return list;
    }
}
