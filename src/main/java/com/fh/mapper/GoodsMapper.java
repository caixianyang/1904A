package com.fh.mapper;

import com.fh.ProductSearchParm.ProductSearchParm;
import com.fh.model.Brand;
import com.fh.model.Goods;

import java.util.List;
import java.util.Map;


public interface GoodsMapper {
	void addGoods(Goods goods);
	
	void deleteGoods(Integer id);
	
	Long queryCount(ProductSearchParm productSearchParm);

	Goods getGoodsById(Integer id);
	
	void updateGoods(Goods goods);

	List queryBrandList();

	List<Goods> queryGoodsList(Map map);

    List queryMapGoodsList(ProductSearchParm productSearchParm);

	void deleteBatch(List list);

    List<Goods> queryGoods(ProductSearchParm productSearchParm);

    Integer getBranByName(String brandName);

	void addBrand(Brand brand);

    void updateStatusDown(Goods goods);

}
