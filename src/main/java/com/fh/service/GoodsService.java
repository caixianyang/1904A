package com.fh.service;


import com.fh.ProductSearchParm.ProductSearchParm;
import com.fh.model.Goods;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface GoodsService {
	void addGoods(Goods goods);
	
	void deleteGoods(Integer id);

	Goods getGoodsById(Integer id);
	
	void updateGoods(Goods goods);

	List queryBrandList();

    List<Goods> queryGoodsList(Map map);

    /*Fenye queryCount(Goods goods, Integer start, Integer length);*/

    Long queryCount(ProductSearchParm productSearchParm);

    List queryMapGoodsList(ProductSearchParm productSearchParm);

    void deleteBatch(List list);

    List<Goods> queryGoods(ProductSearchParm productSearchParm);

    void addExcelDrug(String filePath, HttpServletRequest request);

    void updateStatusDown(Integer id, Integer status);

}
