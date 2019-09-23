package com.yi.picturemgm;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yi.domain.PersonalData;
import com.yi.persistence.MemberPictureDao;
import com.yi.persistence.PersonalDataDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class PictureDaoTest {

	@Autowired
	MemberPictureDao mDao;
	@Autowired
	PersonalDataDao pDao;
	
	@Test
	public void test01insert() throws Exception {
		PersonalData data = new PersonalData();
		data.setId("jongho1227");
		data.setRegdate(new Date());
		data.setFile("신예은.jpg");
		pDao.insertData(data);
	}
	
	
}















