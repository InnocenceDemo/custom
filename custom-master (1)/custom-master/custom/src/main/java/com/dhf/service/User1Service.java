package com.dhf.service;

import com.dhf.domain.User1;

public interface User1Service {

    Integer reg(User1 user1);
    int checkReg(String name1);
    User1 checkLogin(User1 user1);
}
