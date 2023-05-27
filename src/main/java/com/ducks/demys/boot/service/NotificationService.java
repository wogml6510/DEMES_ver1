package com.ducks.demys.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.NotificationRepository;
import com.ducks.demys.boot.vo.Notification;

@Service
public class NotificationService {
	
	private NotificationRepository notificationRepository;
	
	public NotificationService(NotificationRepository notificationRepository) {
		this.notificationRepository= notificationRepository;
	}
	
	public List<Notification> getNotificationList() {
		return notificationRepository.getNotificationList(0);
	}
	
	public int getNotificationCount() {
		return notificationRepository.getNotificationCount();
		
	}
	
	public void removeNotification(int MSG_NUM) {
		
	}
	
	
//	public List<Message> getMessageListByMEMBER_NUM(int MEMBER_NUM){
//	}
//	
//	public Message getMessageByMSG_NUM(int MSG_NUM){
//		return messageRepository.getMessageByMSG_NUM(MSG_NUM);
//	}
//	
//	public void registMessage(Message Message) {
//		Message.setMSG_NUM(messageRepository.selectMessageSequenceNextValue());
//		messageRepository.registMessage(Message);
//	}
//	
//	public void modifyMessage(Message Message) {
//		messageRepository.modifyMessage(Message);
//	}
//	
//	public void removeMessage(int MB_NUM) {
//		messageRepository.removeMessage(MB_NUM);
//	}
}
