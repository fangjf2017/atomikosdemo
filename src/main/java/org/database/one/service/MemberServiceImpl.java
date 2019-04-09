package org.database.one.service;

import org.database.one.dao.MemberMapper;
import org.database.two.dao.PointMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lisen on 2017/12/8.
 */
@Service("memberServiceWa")
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper memberMapper;

    @Autowired
    private PointMapper pointMapper;

    public void addMemberAndPoints(String name, int point) {
            memberMapper.addMember(name);
            String str = null;
            str.equals("lisen");
            pointMapper.addPoint(point);
    }
}
