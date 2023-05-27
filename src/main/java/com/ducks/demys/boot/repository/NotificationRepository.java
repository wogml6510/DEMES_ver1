package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

import com.ducks.demys.boot.vo.Notification;

@Mapper
public interface NotificationRepository {

	public List<Notification> getNotificationList(int DELSTATUS);
	
	public int getNotificationCount();
	
	public int selectNotificationSequenceNextValue();

	public void removeNotification(int MSG_NUM);
	
}