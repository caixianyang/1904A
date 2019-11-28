package com.fh.service.impl;


import com.fh.ProductSearchParm.ProductSearchParm;
import com.fh.mapper.GoodsMapper;
import com.fh.model.Brand;
import com.fh.model.Goods;
import com.fh.service.GoodsService;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import java.util.Map;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	@Autowired
	private GoodsMapper goodsMapper;


	@Override
	public void addGoods(Goods goods) {
		goodsMapper.addGoods(goods);
	}

	@Override
	public void deleteGoods(Integer id) {
		goodsMapper.deleteGoods(id);
	}

	@Override
	public Goods getGoodsById(Integer id) {
		return goodsMapper.getGoodsById(id);
	}

	@Override
	public void updateGoods(Goods goods) {
		goodsMapper.updateGoods(goods);
	}

	@Override
	public List queryBrandList() {
		return goodsMapper.queryBrandList();
	}

	@Override
	public List<Goods> queryGoodsList(Map map) {
		return goodsMapper.queryGoodsList(map);
	}

    @Override
    public Long queryCount(ProductSearchParm productSearchParm) {
        return goodsMapper.queryCount(productSearchParm);
    }

    @Override
    public List queryMapGoodsList(ProductSearchParm productSearchParm) {
        return goodsMapper.queryMapGoodsList(productSearchParm);
    }

	@Override
	public void deleteBatch(List list) {
		goodsMapper.deleteBatch(list);
	}

	@Override
	public List<Goods> queryGoods(ProductSearchParm productSearchParm) {
		return goodsMapper.queryGoods(productSearchParm);
	}

	@Override
	public void addExcelDrug(String filePath, HttpServletRequest request) {
		//文件的所在目录
		String path = request.getServletContext().getRealPath("/");
		//获取文件的所在路径
		String realPath =path + "/" + filePath;
		File file = new File(realPath);

		try {
			Workbook workbook = WorkbookFactory.create(new FileInputStream(file));
			Sheet sheet = workbook.getSheetAt(0);
			int rowNum = sheet.getLastRowNum();
			for (int i = 0; i <= rowNum ; i++) {
				Row row = sheet.getRow(1);
				String goodsName = row.getCell(0).getStringCellValue();
				double peice = row.getCell(1).getNumericCellValue();
				String brandName = row.getCell(2).getStringCellValue();

				Integer brandId = goodsMapper.getBranByName(brandName);
				if(brandId == null){
					Brand brand = new Brand();
					brand.setName(brandName);
					goodsMapper.addBrand(brand);
					brandId = brand.getId();
				}

				Goods goods = new Goods();
				goods.setName(goodsName);
				goods.setPrice(peice);
				goods.setBrand_id(brandId);
				goodsMapper.addGoods(goods);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void updateStatusDown(Integer id,Integer status) {

		Goods goods = new Goods();
		goods.setId(id);
		goods.setStatus(status);
		goodsMapper.updateStatusDown(goods);
	}

}
