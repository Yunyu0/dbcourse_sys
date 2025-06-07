SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college` (
  `collegeID` int(11) NOT NULL,
  `collegeName` varchar(200) NOT NULL COMMENT '课程名',
  PRIMARY KEY (`collegeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES ('1', '计算机系');
INSERT INTO `college` VALUES ('2', '设计系');
INSERT INTO `college` VALUES ('3', '财经系');
INSERT INTO `college` VALUES ('4', '体育系');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `courseID` int(11) NOT NULL,
  `courseName` varchar(200) NOT NULL COMMENT '课程名称',
  `teacherID` int(11) NOT NULL,
  `courseTime` varchar(200) DEFAULT NULL COMMENT '开课时间',
  `classRoom` varchar(200) DEFAULT NULL COMMENT '开课地点',
  `courseWeek` int(200) DEFAULT NULL COMMENT '学时',
  `courseType` varchar(20) DEFAULT NULL COMMENT '课程类型',
  `collegeID` int(11) NOT NULL COMMENT '所属院系',
  `score` int(11) NOT NULL COMMENT '学分',
  PRIMARY KEY (`courseID`),
  KEY `collegeID` (`collegeID`),
  KEY `teacherID` (`teacherID`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`collegeID`) REFERENCES `college` (`collegeID`),
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'C语言程序设计', '1001', '周二', '教1-401', '18', '必修课', '1', '3');
INSERT INTO `course` VALUES ('2', 'Python爬虫技巧', '1001', '周四', '教1-301', '18', '必修课', '1', '3');
INSERT INTO `course` VALUES ('3', '数据结构', '1001', '周四', '教2-401', '18', '必修课', '1', '2');
INSERT INTO `course` VALUES ('4', 'Java程序设计', '1002', '周五', '教6-401', '18', '必修课', '1', '2');
INSERT INTO `course` VALUES ('5', '英语', '1002', '周四', '教1-401', '18', '必修课', '2', '2');
INSERT INTO `course` VALUES ('6', '服装设计', '1003', '周一', '教3-401', '18', '选修课', '2', '2');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleID` int(11) NOT NULL,
  `roleName` varchar(20) NOT NULL,
  `permissions` varchar(255) DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('0', 'admin', null);
INSERT INTO `role` VALUES ('1', 'teacher', null);
INSERT INTO `role` VALUES ('2', 'student', null);

-- ----------------------------
-- Table structure for selectedcourse
-- ----------------------------
DROP TABLE IF EXISTS `selectedcourse`;
CREATE TABLE `selectedcourse` (
  `courseID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `mark` int(11) DEFAULT NULL COMMENT '成绩',
  KEY `courseID` (`courseID`),
  KEY `studentID` (`studentID`),
  CONSTRAINT `selectedcourse_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`),
  CONSTRAINT `selectedcourse_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of selectedcourse
-- ----------------------------
INSERT INTO `selectedcourse` VALUES ('2', '10001', '12');
INSERT INTO `selectedcourse` VALUES ('1', '10001', '95');
INSERT INTO `selectedcourse` VALUES ('1', '10002', '66');
INSERT INTO `selectedcourse` VALUES ('1', '10003', null);
INSERT INTO `selectedcourse` VALUES ('2', '10003', '99');
INSERT INTO `selectedcourse` VALUES ('5', '10001', null);
INSERT INTO `selectedcourse` VALUES ('3', '10001', null);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) NOT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `birthYear` date DEFAULT NULL COMMENT '出生日期',
  `grade` date DEFAULT NULL COMMENT '入学时间',
  `collegeID` int(11) NOT NULL COMMENT '院系id',
  PRIMARY KEY (`userID`),
  KEY `collegeID` (`collegeID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`collegeID`) REFERENCES `college` (`collegeID`)
) ENGINE=InnoDB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('10001', '张三', '男', '2004-09-02', '2022-09-02', '1');
INSERT INTO `student` VALUES ('10002', '李四', '女', '2003-09-14', '2022-09-02', '3');
INSERT INTO `student` VALUES ('10003', '王五', '女', '2003-09-02', '2022-09-02', '2');
INSERT INTO `student` VALUES ('10004', '刘六', '男', '2004-09-02', '2022-09-02', '2');
INSERT INTO `student` VALUES ('10005', '小米', '女', '2004-09-02', '2022-09-02', '2');
INSERT INTO `student` VALUES ('10006', '小陈', '女', '2003-09-02', '2022-09-02', '1');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) NOT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `birthYear` date NOT NULL,
  `degree` varchar(20) DEFAULT NULL COMMENT '学历',
  `title` varchar(255) DEFAULT NULL COMMENT '职称',
  `grade` date DEFAULT NULL COMMENT '入职时间',
  `collegeID` int(11) NOT NULL COMMENT '院系',
  PRIMARY KEY (`userID`),
  KEY `collegeID` (`collegeID`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`collegeID`) REFERENCES `college` (`collegeID`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1001', '刘老师', '女', '1990-03-08', '硕士', '副教授', '2015-09-02', '2');
INSERT INTO `teacher` VALUES ('1002', '张老师', '男', '1996-09-02', '本科', '普通教师', '2015-09-02', '1');
INSERT INTO `teacher` VALUES ('1003', '软老师', '男', '1996-09-02', '硕士', '助教', '2017-07-07', '1');

-- ----------------------------
-- Table structure for userlogin
-- ----------------------------
DROP TABLE IF EXISTS `userlogin`;
CREATE TABLE `userlogin` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '2' COMMENT '角色权限',
  PRIMARY KEY (`userID`),
  KEY `role` (`role`),
  CONSTRAINT `userlogin_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userlogin
-- ----------------------------
INSERT INTO `userlogin` VALUES ('1', 'admin', '123', '0');
INSERT INTO `userlogin` VALUES ('8', '10001', '123', '2');
INSERT INTO `userlogin` VALUES ('9', '10002', '123', '2');
INSERT INTO `userlogin` VALUES ('10', '10003', '123', '2');
INSERT INTO `userlogin` VALUES ('11', '10005', '123', '2');
INSERT INTO `userlogin` VALUES ('12', '10004', '123', '2');
INSERT INTO `userlogin` VALUES ('13', '10006', '123', '2');
INSERT INTO `userlogin` VALUES ('14', '1001', '123', '1');
INSERT INTO `userlogin` VALUES ('15', '1002', '123', '1');
INSERT INTO `userlogin` VALUES ('16', '1003', '123', '1');
SET FOREIGN_KEY_CHECKS=1;
-- 插入第一条数据
INSERT INTO teacher (userID, userName, sex, birthYear, degree, title, grade, collegeID)
VALUES (1005, '李老师', '女', '1992-05-10', '硕士', '讲师', '2018-09-01', 1);

-- 插入第二条数据
INSERT INTO teacher (userID, userName, sex, birthYear, degree, title, grade, collegeID)
VALUES (1006, '王老师', '男', '1993-08-20', '本科', '助教', '2019-03-02', 2);

-- 插入第三条数据
INSERT INTO teacher (userID, userName, sex, birthYear, degree, title, grade, collegeID)
VALUES (1007, '赵老师', '女', '1994-12-05', '硕士', '副教授', '2020-07-15', 1);

-- 插入第四条数据
INSERT INTO teacher (userID, userName, sex, birthYear, degree, title, grade, collegeID)
VALUES (1008, '孙老师', '男', '1991-03-12', '博士', '教授', '2017-02-28', 3);

-- 插入第五条数据
INSERT INTO teacher (userID, userName, sex, birthYear, degree, title, grade, collegeID)
VALUES (1009, '周老师', '女', '1995-09-30', '本科', '助教', '2021-09-01', 2);

-- 插入第六条数据
INSERT INTO teacher (userID, userName, sex, birthYear, degree, title, grade, collegeID)
VALUES (1010, '吴老师', '男', '1997-04-22', '硕士', '讲师', '2022-03-18', 1);

-- 插入第七条数据
INSERT INTO teacher (userID, userName, sex, birthYear, degree, title, grade, collegeID)
VALUES (1011, '郑老师', '女', '1993-11-08', '博士', '副教授', '2019-12-05', 3);

-- 插入第八条数据
INSERT INTO teacher (userID, userName, sex, birthYear, degree, title, grade, collegeID)
VALUES (1012, '冯老师', '男', '1996-07-19', '本科', '助教', '2020-08-25', 2);

-- 插入第九条数据
INSERT INTO teacher (userID, userName, sex, birthYear, degree, title, grade, collegeID)
VALUES (1013, '陈老师', '女', '1998-02-03', '硕士', '讲师', '2023-01-10', 1);

-- 插入第十条数据
INSERT INTO teacher (userID, userName, sex, birthYear, degree, title, grade, collegeID)
VALUES (1014, '杨老师', '男', '1994-09-28', '博士', '教授', '2018-04-09', 3);
-- 插入第一条数据
INSERT INTO course (courseName, teacherID, courseID, courseTime, classRoom, courseWeek, courseType, collegeID, score)
VALUES ('计算机图形学', 1004, 8, '周一', '教5-301', 18, '必修课', 1, 3);

-- 插入第二条数据
INSERT INTO course (courseName, teacherID, courseID, courseTime, classRoom, courseWeek, courseType, collegeID, score)
VALUES ('算法设计与分析', 1005, 9, '周三', '教4-202', 18, '必修课', 1, 3);

-- 插入第三条数据
INSERT INTO course (courseName, teacherID, courseID, courseTime, classRoom, courseWeek, courseType, collegeID, score)
VALUES ('编译原理', 1004, 10, '周二', '教3-402', 18, '必修课', 1, 3);

-- 插入第四条数据
INSERT INTO course (courseName, teacherID, courseID, courseTime, classRoom, courseWeek, courseType, collegeID, score)
VALUES ('数字图像处理', 1006, 11, '周四', '教2-301', 18, '选修课', 2, 2);

-- 插入第五条数据
INSERT INTO course (courseName, teacherID, courseID, courseTime, classRoom, courseWeek, courseType, collegeID, score)
VALUES ('软件测试', 1005, 12, '周五', '教6-201', 20, '必修课', 1, 3);

-- 插入第六条数据
INSERT INTO course (courseName, teacherID, courseID, courseTime, classRoom, courseWeek, courseType, collegeID, score)
VALUES ('人机交互技术', 1007, 13, '周一', '教7-101', 18, '选修课', 3, 2);

-- 插入第七条数据
INSERT INTO course (courseName, teacherID, courseID, courseTime, classRoom, courseWeek, courseType, collegeID, score)
VALUES ('游戏开发基础', 1006, 14, '周三', '教4-302', 18, '选修课', 2, 2);

-- 插入第八条数据
INSERT INTO course (courseName, teacherID, courseID, courseTime, classRoom, courseWeek, courseType, collegeID, score)
VALUES ('数据挖掘', 1008, 15, '周二', '教8-202', 20, '必修课', 3, 3);

-- 插入第九条数据
INSERT INTO course (courseName, teacherID, courseID, courseTime, classRoom, courseWeek, courseType, collegeID, score)
VALUES ('分布式系统', 1007, 16, '周四', '教5-401', 18, '选修课', 3, 2);

-- 插入第十条数据
INSERT INTO course (courseName, teacherID, courseID, courseTime, classRoom, courseWeek, courseType, collegeID, score)
VALUES ('区块链技术', 1009, 17, '周五', '教9-302', 18, '选修课', 3, 2);

-- 插入第一条数据
INSERT INTO student (userID, userName, sex, birthYear, grade, collegeID)
VALUES (10007, '小赵', '男', '2005-03-12', '2023-09-01', 3);

-- 插入第二条数据
INSERT INTO student (userID, userName, sex, birthYear, grade, collegeID)
VALUES (10008, '小钱', '女', '2004-08-23', '2023-09-01', 2);

-- 插入第三条数据
INSERT INTO student (userID, userName, sex, birthYear, grade, collegeID)
VALUES (10009, '小孙', '男', '2003-11-09', '2023-09-01', 1);

-- 插入第四条数据
INSERT INTO student (userID, userName, sex, birthYear, grade, collegeID)
VALUES (10010, '小李', '女', '2005-07-18', '2023-09-01', 3);

-- 插入第五条数据
INSERT INTO student (userID, userName, sex, birthYear, grade, collegeID)
VALUES (10011, '小周', '男', '2004-04-30', '2023-09-01', 2);

-- 插入第六条数据
INSERT INTO student (userID, userName, sex, birthYear, grade, collegeID)
VALUES (10012, '小吴', '女', '2003-09-05', '2023-09-01', 1);

-- 插入第七条数据
INSERT INTO student (userID, userName, sex, birthYear, grade, collegeID)
VALUES (10013, '小郑', '男', '2005-12-22', '2023-09-01', 3);

-- 插入第八条数据
INSERT INTO student (userID, userName, sex, birthYear, grade, collegeID)
VALUES (10014, '小王', '女', '2004-02-14', '2023-09-01', 2);

-- 插入第九条数据
INSERT INTO student (userID, userName, sex, birthYear, grade, collegeID)
VALUES (10015, '小冯', '男', '2003-06-29', '2023-09-01', 1);

-- 插入第十条数据
INSERT INTO student (userID, userName, sex, birthYear, grade, collegeID)
VALUES (10016, '小陈', '女', '2005-09-08', '2023-09-01', 3);
-- 插入第一条数据
INSERT INTO selectedcourse (courseID, studentID, mark)
VALUES (3, 10001, 80);

-- 插入第二条数据
INSERT INTO selectedcourse (courseID, studentID, mark)
VALUES (4, 10002, 75);

-- 插入第三条数据
INSERT INTO selectedcourse (courseID, studentID, mark)
VALUES (5, 10003, 90);

-- 插入第四条数据
INSERT INTO selectedcourse (courseID, studentID, mark)
VALUES (6, 10004, 85);

-- 插入第五条数据
INSERT INTO selectedcourse (courseID, studentID, mark)
VALUES (7, 10005, 70);

-- 插入第六条数据
INSERT INTO selectedcourse (courseID, studentID, mark)
VALUES (8, 10006, 88);

-- 插入第七条数据
INSERT INTO selectedcourse (courseID, studentID, mark)
VALUES (9, 10007, 92);

-- 插入第八条数据
INSERT INTO selectedcourse (courseID, studentID, mark)
VALUES (10, 10008, 78);

-- 插入第九条数据
INSERT INTO selectedcourse (courseID, studentID, mark)
VALUES (11, 10009, 83);

-- 插入第十条数据
INSERT INTO selectedcourse (courseID, studentID, mark)
VALUES (12, 10010, 95);

-- 插入第十一条数据
INSERT INTO selectedcourse (courseID, studentID, mark)
VALUES (13, 10011, 72);

-- 插入第十二条数据
INSERT INTO selectedcourse (courseID, studentID, mark)
VALUES (14, 10012, 89);

-- 插入第十三条数据
INSERT INTO selectedcourse (courseID, studentID, mark)
VALUES (15, 10013, 93);

-- 插入第十四条数据
INSERT INTO selectedcourse (courseID, studentID, mark)
VALUES (16, 10014, 79);

-- 插入第十五条数据
INSERT INTO selectedcourse (courseID, studentID, mark)
VALUES (17, 10015, 84);

-- 插入第十六条数据
INSERT INTO selectedcourse (courseID, studentID, mark)
VALUES (18, 10016, 91);

-- 插入第十七条数据
INSERT INTO selectedcourse (courseID, studentID, mark)
VALUES (19, 10001, 77);

-- 插入第十八条数据
INSERT INTO selectedcourse (courseID, studentID, mark)
VALUES (20, 10002, 82);
