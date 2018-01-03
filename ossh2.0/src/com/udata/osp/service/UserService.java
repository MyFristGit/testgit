package com.udata.osp.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.udata.osp.entity.Service;
import com.udata.osp.entity.ServiceRole;
import com.udata.osp.entity.User;
import com.udata.osp.entity.UserRole;

public interface UserService {

	User getUserBy(String userName, String password);
	List<UserRole> getUserRole(String UserId);
	void  savePassword(String userId,String password);
	void  saveOrder(String userId,String password);
	String getUserOrder(String userId);
	
	
	List<Map<String, Object>> getManageSearchProjectByUserId(String userId);
	List<Map<String, Object>> getParticipateSearchProjectByUserId(String userId);
	//统计科研成果后更新缓存的表ossh_research_project
	void InsertIntoReSearchProject(String who);
	List<String> getUserIdInResearchProjectData();
	
	List<Map<String, Object>> getAchievementsByUserId(String userId);
	
	List<Map<String, Object>> getFinanceByUserId(String userId);
	List<Map<String, Object>> getGuideByUserId(String userId);
	List<Map<String, Object>> getFundingByUserId(String userId);
	
	
	//取得业务直通车的情况
	List<Map<String, Object>> getThroughTrain();
	List<Map<String, Object>> getThroughTrainImg(String id);
	//slide图标
	List<Map<String, Object>> getBannerList();
	void UpdateCommentCountToService(String service_id);
	
	List<Map<String, Object>> getUserRecord(String userId);
	List<Map<String, Object>> userLearning(String userId);
	void setLearningOrderById(String mapString, String mapString2);
	List<Map<String, Object>> getUserJobs(String userId);
	List<Map<String, Object>> getUserRanks(String userId);
	List<Map<String, Object>> getUserActualInformation(String userId);
	List<Map<String, Object>> getQualification(String userId);
	List<Map<String, Object>> getWorkInformation(String userId);
	List<Map<String, Object>> getStudyInformation(String userId);
	List<Map<String, Object>> getPostInformation(String userId);
	List<Map<String, Object>> getTitleInformation(String userId);
	List<Map<String, Object>> getResearch(String userId);
	//科研专利
	List<Map<String, Object>> getPatent(String userId);
	List<Map<String, Object>> getDevice(String userId);
	List<Map<String, Object>> getFinance(String userId);
	List<Map<String, Object>> getHealth(String userId);
	
	
	List<Map<String, Object>> getDeviceAndCondition(  String user_id,
            String code,
            String name,
            String number,
            String unit_price,
            String date_entry,
             String model);
	List<Map<String, Object>> getDeviceAndCondition2(Map<String,String> map);
	boolean getUserIsStudent(String userId);
	List<Map<String, Object>> getFirstWerks();
	List<Map<String, Object>> getSchedules(String userId, String lastYear, String thisYear);
	List<Map<String, Object>> getStudentSchedules(String userId, String string, String string2);
	List<Map<String, Object>> getBasicStudentInformation(String userId);
	List<Map<String, Object>> getTuition(String userId);
	List<Map<String, Object>> getCampusConsumption(String userId);
	List<Map<String, Object>> getBooksArrearage(String userId);
	List<Map<String, Object>> getT_JZG_RZ(String userId);
	int savePersonalImage(Map<String, Object> map);
	int saveOrUpdatePersonalImage(Map<String, Object> param);
	List<Map<String, Object>> getUserImgById(String id);
	void emptyImage(String userId);
	List<Map<String, Object>> getDeaultImg();
	List<Map<String, Object>> getJtgxInformation(String userId);
	List<Map<String, Object>> getXXCJ(String userId);
	List<Map<String, Object>> getDjxs(String userId);
	List<Map<String, Object>> getBooksArrearage2(String userId);
	List<Map<String, Object>> getDeviceAndCondition3(Map map);
	List<Map<String, Object>> getStatementsByUserId(String table, String fieldId, String userId,String other);
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
