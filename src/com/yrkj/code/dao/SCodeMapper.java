package com.yrkj.code.dao;

import com.yrkj.code.bean.SCode;
import com.yrkj.code.bean.SCodeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SCodeMapper {
    int countByExample(SCodeExample example);

    int deleteByExample(SCodeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SCode record);

    int insertSelective(SCode record);

    List<SCode> selectByExample(SCodeExample example);

    SCode selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SCode record, @Param("example") SCodeExample example);

    int updateByExample(@Param("record") SCode record, @Param("example") SCodeExample example);

    int updateByPrimaryKeySelective(SCode record);

    int updateByPrimaryKey(SCode record);
}