package com.fh.service.impl;

import com.fh.ProductSearchParm.ProductSearchParm;
import com.fh.mapper.LogMapper;
import com.fh.model.Log;
import com.fh.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogServiceImpl implements LogService {
    @Autowired
    private LogMapper logMapper;//

    @Override
    public void addLog(Log log) {
        logMapper.addLog(log);
    }

    @Override
    public Long queryCount(ProductSearchParm productSearchParm) {
        return logMapper.queryCount(productSearchParm);
    }

    @Override
    public List queryMapLoginList(ProductSearchParm productSearchParm) {
        return logMapper.queryMapLoginList(productSearchParm);
    }
}
