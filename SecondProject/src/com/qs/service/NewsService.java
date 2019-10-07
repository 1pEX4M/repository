package com.qs.service;

import java.util.List;

import com.qs.javabean.News;
import com.qs.utils.PageBean;

/**
 * @author 张玉环
 *
 */
public interface NewsService {

	List<News> getAllNews();

	News getNewsByNid(String nid);

	PageBean getNewsByPage(int pageSize, int currentPage);

}
