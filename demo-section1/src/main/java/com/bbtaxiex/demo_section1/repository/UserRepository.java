package com.bbtaxiex.demo_section1.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.bbtaxiex.demo_section1.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {

}
