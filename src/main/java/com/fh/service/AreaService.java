package com.fh.service;

import com.fh.model.Area;

import java.util.List;

public interface AreaService {
    List<Area> queryArea(Integer pid);

    List<Area> queryAreaList();
}
