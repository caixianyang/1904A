package com.fh.controller;


import com.fh.ProductSearchParm.ProductSearchParm;
import com.fh.common.LogMsg;
import com.fh.common.ServerResponse;
import com.fh.model.Brand;
import com.fh.model.Goods;
import com.fh.service.GoodsService;
import com.fh.util.FileUtil;
import com.fh.util.SystemConstant;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("goods")
public class GoodsController {
	@Resource
	private GoodsService goodsService ;



    @RequestMapping("queryMapGoodsList")
    @ResponseBody
    public ServerResponse queryMapGoodsList(ProductSearchParm productSearchParm){
    	Long totalCount = goodsService.queryCount(productSearchParm);
		List list = goodsService.queryMapGoodsList(productSearchParm);

        Map map = new HashMap();
        map.put("draw",productSearchParm.getDraw());
        map.put("recordsTotal",totalCount);
        map.put("recordsFiltered",totalCount);
        map.put("data",list);
        return ServerResponse.success(map);
    }



	@RequestMapping("queryBrandList")
	@ResponseBody
	public ServerResponse queryBrandList(Goods goods, Integer start, Integer length){
		List<Brand> BrandList = goodsService.queryBrandList();
		return ServerResponse.success(BrandList);
	}


	@RequestMapping("addGoods")
	@ResponseBody
    @LogMsg("添加商品")
	public ServerResponse addGoods(Goods goods){
			goodsService.addGoods(goods);
		return ServerResponse.success();

	}

	@RequestMapping("bootTables")
	public String bootTables(Model model){
		return "bootTables";
	}


	@RequestMapping("deleteGoods")
	@ResponseBody
	@LogMsg("删除商品")
	public ServerResponse deleteGoods(Integer id){
			goodsService.deleteGoods(id);
		return ServerResponse.success();
	}

	@RequestMapping("updateStatusDown")
	@ResponseBody
	@LogMsg("上下架商品")
	public ServerResponse updateStatusDown(Integer id,Integer status){
			goodsService.updateStatusDown(id,status);
		return ServerResponse.success();
	}


	@RequestMapping("getGoodsById")
	@ResponseBody
	public ServerResponse getGoodsById(Integer id){
		Goods goods = goodsService.getGoodsById(id);
		return ServerResponse.success(goods);
	}

	@RequestMapping("updateGoods")
	@ResponseBody
	@LogMsg("修改商品")
	public ServerResponse updateGoods(Goods goods){
			goodsService.updateGoods(goods);
		return new ServerResponse();

	}
	@RequestMapping("deleteBatch")
	@ResponseBody
	public ServerResponse deleteBatch(@RequestParam("idsList[]")List list){
			goodsService.deleteBatch(list);
		return ServerResponse.success();
	}


	@RequestMapping("exportWord")
	public void exportWord(ProductSearchParm productSearchParm, HttpServletRequest request,HttpServletResponse response) {
		/*  */
		List<Goods> list = goodsService.queryGoods(productSearchParm);
		Map map = new HashMap();
		map.put("list",list);
		File file = FileUtil.buildWord(map, SystemConstant.WORD_TIMPATE_FILE_PATH);
		FileUtil.downloadFile(request,response,file);
	}

	@RequestMapping("exportExcel")
	public void exportExcel(ProductSearchParm productSearchParm,HttpServletRequest request,HttpServletResponse response) {

		List<Goods> list = goodsService.queryGoods(productSearchParm);
		Map map = new HashMap();
		map.put("list",list);
		File file = FileUtil.buildExcel(map,SystemConstant.EXCEL_TIMPATE_FILE_PATH);
		FileUtil.downloadFile(request,response,file);

	}

	@RequestMapping("downloadPtf")
	public void downloadPtf(ProductSearchParm productSearchParm,HttpServletRequest request,HttpServletResponse response) {

		List<Goods> list = goodsService.queryGoods(productSearchParm);
		Map map = new HashMap();
		map.put("list",list);
		String pdfHtml = FileUtil.buildPdfHtml(map,SystemConstant.PDF_TIMPATE_FILE_PATH);
		FileUtil.pdfDownloadFile(response,pdfHtml);

	}

	@RequestMapping("addExcelDrug")
	public void addExcelDrug(String filePath,HttpServletRequest request){
		goodsService.addExcelDrug(filePath,request);
	}


}
