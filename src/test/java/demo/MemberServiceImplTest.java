package demo;

import org.database.one.service.MemberService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by gjffs on 2019/4/9.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:applicationContext.xml"})
public class MemberServiceImplTest {

    @Autowired
    private MemberService memberServiceWa;

    @Test
    public void addMemberAndPointTest() {
        String name = "测试";
        int points = 50;
        memberServiceWa.addMemberAndPoints(name, points);
    }
}
