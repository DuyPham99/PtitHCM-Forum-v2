package com.forum.respository;

import com.forum.entity.Notification;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface NotificationRepository  extends CrudRepository<Notification, Integer> {
    Optional<List<Notification>> findAllByReceiver_UsernameOrderByIdNotificationDesc(String username);
}
