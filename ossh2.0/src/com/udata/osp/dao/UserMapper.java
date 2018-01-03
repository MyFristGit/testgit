package com.udata.osp.dao;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.udata.osp.dao.enumpack.ResearchProjectType;
import com.udata.osp.entity.ResearchProject;
import com.udata.osp.entity.Service;
import com.udata.osp.entity.ServiceRole;
import com.udata.osp.entity.User;
import com.udata.osp.entity.UserRole;
import com.udata.osp.entity.UserThumb;

public interface UserMapper {
    int deleteByPrimaryKey(String userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String userName,String password);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<ServiceRole>  getUserRole(String UserId);
    
    List<Service>  getServiceZXListInRole(List<UserRole>  sr);
    
    List<Service>  getServiceZHListInRole(List<UserRole>  sr);

	void savePassword(String userId, String password);
	void saveOrder(String userId, String order);

	String getUserOrder(String userId);

	List<Map<String, Object>> getSearchProjectByUserId(String userId, int index);

	List<Map<String, Object>> CountResearchProject(String who);

	List<ResearchProject> findResearchProject(String who, int type);

	void addResearchProject(ResearchProject first);

	void changeResearchProject(ResearchProject first);

	List<String> getUserIdInResearchProjectData();
	
	//取得用户的科研成果情况
	List<Map<String, Object>> getAchievementsByUserId(String userId);
	
	
	//取得用户的财务
	List<Map<String, Object>> getFinanceByUserId(String userId);
	
	
	//取得用户的指导学生情况
	List<Map<String, Object>> getGuideByUserId(String userId);
	
	
	//取得用户的科研经费
	List<Map<String, Object>> getFundingByUserId(String userId);

	List<Map<String, Object>> getThroughTrain();

	List<Map<String, Object>> getThroughTrainImg(String id);

	List<Map<String, Object>> getBannerList();

	List<Map<String, Object>> getBannerImg(int id);
	
	//取得用户评论的数量
	List<Map<String, Object>> getCommentCountByServiceId(String serviceId);

	void changeServiceComment(int serviceId,int count);

	List<Map<String, Object>> getUserRecord(String userId);

	List<Map<String, Object>> userLearning(String userId);

	void setLearningOrderById(int first, int second);

	List<Map<String, Object>> getUserJobs(String userId);

	List<Map<String, Object>> getUserRanks(String userId);

	List<Map<String, Object>> getUserActualInformation(String userId);

	List<Map<String, Object>> getQualification(String userId);

	List<Map<String, Object>> getWorkInformation(String userId);

	List<Map<String, Object>> getStudyInformation(String userId);

	List<Map<String, Object>> getPostInformation(String userId);

	List<Map<String, Object>> getTitleInformation(String userId);

	List<Map<String, Object>> getResearch(String userId);

	List<Map<String, Object>> getPatent(String userId);

	List<Map<String, Object>> getDevice(String userId);
	
	public List<Map<String, Object>> getDeviceAndCondition(
            @Param("user_id") String user_id,
            @Param("code") String code,
            @Param("name") String name,
            @Param("number") String number,
            @Param("unit_price") String unit_price,
            @Param("date_entry") String date_entry,
            @Param("model") String model
            );
	
	
	//数组有默认的别名array，列表list
	List<Map<String, Object>> getDeviceAndCondition2(@Param("params")Map<String, String> params);

	List<Map<String, Object>> getFinance(String userId);

	List<Map<String, Object>> getHealth(String userId);
	List<Map<String, Object>> getUserIsStudent(String userId);

	List<Map<String, Object>> getFirstWerks();

	List<Map<String, Object>> getSchedules(String userId, String lastYear, String thisYear);
	List<Map<String, Object>> getStudentSchedules(String userId, String lastYear, String thisYear);

	List<Map<String, Object>> getBasicStudentInformation(String userId);

	List<Map<String, Object>> getTuitionInformation(String userId);

	List<Map<String, Object>> getCampusConsumption(String userId);

	List<Map<String, Object>> getBooksArrearage(String userId);

	List<Map<String, Object>> getT_JZG_RZ(String userId);

	int savePersonalImage(Map<String, Object> map);

	int saveOrUpdatePersonalImage(Map<String, Object> param);

	List<Map<String, Object>> getUserImgById(String id);

	void emptyImage(String userId);

	List<Map<String, Object>> getDeaultImg();

	List<Map<String, Object>> getJtgxInformation(String str);

	List<Map<String, Object>> getXXCJ(String userId);

	List<Map<String, Object>> getDjxs(String userId);

	List<Map<String, Object>> getBooksArrearage2(String userId);
	
	List<Map<String, Object>> getDeviceAndCondition3(@Param("params")Map<String, String> params);

	List<Map<String, Object>> getStatementsByUserId(@Param("params")Map<String, String> params);

	List<Service> getServiceAllList(String userId);

	void bindEmail(String userId, String email_account, String email_password);

	List<Map<String, Object>> getJxgzlInformation(String userId);

	List<Map<String, Object>> getT_jzg(String userId);

	List<Map<String, Object>> getResearchFromThree(String userId);

	List<Map<String, Object>> getKYLW(String userId);

	List<Map<String, Object>> getSJZZ(String userId);

	List<Map<String, Object>> getRJZZ(String userId);

	List<Map<String, Object>> getHJQK(String userId);

	List<Map<String, Object>> getPatent2(String userId);
	
    
    
    
}