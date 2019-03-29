package com.dhf.service;

public interface CreateRequestService {
    Integer InsertCreateRequestMessage(Integer userId, String date, Integer categoryId, String category, String bonus, String maxbonus, String desc, String address, String nowDate);
}
