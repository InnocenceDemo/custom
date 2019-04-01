package com.dhf.mapper;

import com.dhf.domain.User1;
import com.dhf.domain.UserDetail;
import com.sun.tools.internal.xjc.reader.xmlschema.bindinfo.BIConversion;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface MyinformationMapper {
    Map<String,Object> selectMyinformation(Integer id);

    List<Map<String,Object>> selectMyTasks(Integer userId);

    Map<String, Object> selectMyinformationByuserId(Integer userId);

    Integer updateUserMessage(@Param("user")User1 user, @Param("userdetail")UserDetail userdetail);
}
