package com.fh.mapper;

import com.fh.ProductSearchParm.ProductSearchParm;
import com.fh.model.Log;

import java.util.List;

public interface LogMapper {

    void addLog(Log log);


    Long queryCount(ProductSearchParm productSearchParm);

    List queryMapLoginList(ProductSearchParm productSearchParm);
}
