package org.database.one.dao;

import org.springframework.stereotype.Repository;

@Repository("memberMapper")
public interface MemberMapper {
    void addMember(String name);
}
