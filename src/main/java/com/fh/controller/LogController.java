package com.fh.controller;

import com.fh.ProductSearchParm.ProductSearchParm;
import com.fh.common.ServerResponse;
import com.fh.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("log/")
public class LogController {
    @Autowired
    private LogService logService;//

    @RequestMapping("toList")
    public String toList(){
        return "log/list";
    }

    @RequestMapping("queryMapLoginList")
    @ResponseBody
    public ServerResponse queryMapLoginList(ProductSearchParm productSearchParm){
        Long totalCount = logService.queryCount(productSearchParm);
        List list = logService.queryMapLoginList(productSearchParm);
        Map map = new HashMap();
        map.put("draw",productSearchParm.getDraw());
        map.put("recordsTotal",totalCount);
        map.put("recordsFiltered",totalCount);
        map.put("data",list);
        return ServerResponse.success(map);
    }



}
