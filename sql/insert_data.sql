-- =============================================================
--  Student-Mentor Database System
--  File   : insert_data.sql
--  Purpose: Sample data for all four tables
--  Run    : After schema.sql
-- =============================================================

USE student_mentor;

-- -------------------------------------------------------------
-- Department (12 records)
-- -------------------------------------------------------------
INSERT INTO department VALUES
  ('Computer_Science', 'CS-1', 'CS-101', 'Cyber_Security'),
  ('Computer_Science', 'CS-1', 'CS-102', 'Computer_Networks'),
  ('Computer_Science', 'CS-1', 'CS-103', 'Operating_Systems'),
  ('Mechanical_Engg', 'ME-1', 'ME-101', 'Fluid_Mechanics'),
  ('Mechanical_Engg', 'ME-1', 'ME-102', 'Operations_Research'),
  ('Information_Tech', 'IT-1', 'IT-101', 'Automata_Theory'),
  ('Information_Tech', 'IT-1', 'IT-102', 'Java_Programming'),
  ('Biology', 'BIO-1', 'BIO-101', 'Genetics'),
  ('Electronics_Comm', 'ECE-1', 'ECE-101', 'VLSI_Design'),
  ('Electronics_Comm', 'ECE-1', 'ECE-102', 'Digital_Signal_Processing'),
  ('Electronics_Comm', 'ECE-1', 'ECE-103', 'Antenna_Wave_Propagation'),
  ('Electrical_Engg', 'EEE-1', 'EEE-101', 'Electrical_Machines');

-- -------------------------------------------------------------
-- Mentor (12 records)
-- -------------------------------------------------------------
INSERT INTO mentor VALUES
  (1, 'Yadu', 'Krishnan', '9412165651', 'yadu.krishnan@alliance.edu.in', 'ME-101'),
  (2, 'Manjunath', 'Swamy', '8650505642', 'manjunath.swamy@alliance.edu.in', 'ECE-101'),
  (3, 'Gisa', 'George', '7894561230', 'gisa.george@alliance.edu.in', 'ECE-103'),
  (4, 'Taranath', 'Sharma', '8979461235', 'taranath.sharma@alliance.edu.in', 'ECE-102'),
  (5, 'Srinath', 'Kumar', '7989455612', 'srinath.kumar@alliance.edu.in', 'IT-102'),
  (6, 'Bhoomika', 'Patel', '7594261538', 'bhoomika.patel@alliance.edu.in', 'IT-101'),
  (7, 'Pranayanath', 'Reddy', '7619351789', 'pranayanath.reddy@alliance.edu.in', 'BIO-101'),
  (8, 'Beena', 'Mathew', '7418529635', 'beena.mathew@alliance.edu.in', 'CS-102'),
  (9, 'Revathi', 'Selvarani', '8974865153', 'revathi.selvarani@alliance.edu.in', 'EEE-101'),
  (10, 'Vijaya', 'Lakshmi', '8456812385', 'vijaya.lakshmi@alliance.edu.in', 'CS-103'),
  (11, 'Tharun', 'Sridhar', '7973812345', 'tharun.sridhar@alliance.edu.in', 'ME-102'),
  (12, 'Radha', 'Rajan', '9412645867', 'radha.rajan@alliance.edu.in', 'CS-101');

-- -------------------------------------------------------------
-- Student (100 records)
-- -------------------------------------------------------------
-- Batch 1: records 1–25
INSERT INTO student VALUES
  (102, 'Sinan', 'Bin', '24-05-1992', 2015, 'Bangalore', 'IT-102'),
  (125, 'Dawood', 'Ibrahim', '12-02-1996', 2016, 'Chennai', 'EEE-101'),
  (145, 'Rahul', 'Reji', '01-08-1997', 2012, 'Kochi', 'CS-101'),
  (202, 'Tejesh', 'Murthy', '10-10-1996', 2014, 'Hyderabad', 'IT-101'),
  (245, 'Udaya', 'Kumar', '04-10-1990', 2015, 'Mysore', 'CS-102'),
  (302, 'Harsh', 'Mittal', '01-02-1999', 2018, 'Delhi', 'BIO-101'),
  (345, 'Priyanka', 'Verma', '10-01-1996', 2014, 'Mumbai', 'CS-102'),
  (445, 'Yash', 'Srivastava', '10-03-1997', 2016, 'Lucknow', 'CS-103'),
  (487, 'Junjun', 'Wala', '05-04-1996', 2016, 'Pune', 'ECE-101'),
  (545, 'Abhishek', 'Kumar', '02-08-1992', 2016, 'Ahmedabad', 'CS-103'),
  (602, 'Bhavesh', 'Singh', '10-05-1992', 2016, 'Jaipur', 'EEE-101'),
  (645, 'Mariya', 'Hafiz', '02-08-1990', 2016, 'Calicut', 'ME-101'),
  (654, 'Ajitesh', 'Sharma', '10-10-1990', 2013, 'Nagpur', 'EEE-101'),
  (745, 'Mishal', 'Basheer', '12-06-1993', 2017, 'Trivandrum', 'ME-102'),
  (845, 'Rahul', 'Patil', '11-02-1990', 2016, 'Kolhapur', 'ME-102'),
  (945, 'Rohith', 'Pillai', '10-06-1997', 2016, 'Thrissur', 'IT-101'),
  (954, 'Happy', 'Kaur', '09-04-1993', 2018, 'Chandigarh', 'ECE-103'),
  (1024, 'Arun', 'Singh', '28-07-1992', 2006, 'Amritsar', 'CS-102'),
  (1234, 'Abhishek', 'Gupta', '10-10-1994', 2007, 'Varanasi', 'CS-101'),
  (1300, 'Pranav', 'Rao', '1993-04-08', 2004, 'Kolkata', 'ECE-103'),
  (1339, 'Lakshmi', 'Bose', '1998-01-01', 2002, 'Mysore', 'ME-101'),
  (1376, 'Pooja', 'Ghosh', '1991-12-21', 2017, 'Amritsar', 'ME-101'),
  (1409, 'Geeta', 'Nair', '1990-12-14', 2010, 'Visakhapatnam', 'CS-103'),
  (1427, 'Reshma', 'Sharma', '1987-07-04', 2011, 'Surat', 'ECE-102'),
  (1448, 'Divya', 'Murthy', '1999-09-04', 2012, 'Pune', 'ECE-101');

-- Batch 2: records 26–50
INSERT INTO student VALUES
  (1471, 'Dhruv', 'Roy', '1991-12-03', 2001, 'Mangalore', 'ME-102'),
  (1481, 'Pallavi', 'Sharma', '1997-05-15', 2020, 'Vadodara', 'CS-103'),
  (1509, 'Smita', 'Naidu', '1993-12-22', 2020, 'Delhi', 'ECE-102'),
  (1554, 'Anjali', 'Das', '1992-03-15', 2012, 'Visakhapatnam', 'ECE-103'),
  (1603, 'Rajesh', 'Gopal', '1995-01-08', 2001, 'Nashik', 'IT-102'),
  (1625, 'Nikhil', 'Naidu', '1995-04-21', 2015, 'Chandigarh', 'ECE-103'),
  (1659, 'Siddharth', 'Tiwari', '1989-04-24', 2017, 'Ranchi', 'ME-102'),
  (1701, 'Vinay', 'Bose', '1997-06-08', 2004, 'Gwalior', 'BIO-101'),
  (1711, 'Rohan', 'Patel', '1989-11-06', 2013, 'Varanasi', 'CS-102'),
  (1740, 'Kiran', 'Sen', '1999-09-09', 2017, 'Bangalore', 'ECE-103'),
  (1752, 'Basavraj', 'Babu', '1993-11-11', 2003, 'Vijayawada', 'IT-102'),
  (1767, 'Manoj', 'Nair', '1993-09-25', 2005, 'Gwalior', 'CS-102'),
  (1812, 'Naveen', 'Krishnan', '2001-10-07', 2004, 'Vadodara', 'CS-103'),
  (1851, 'Revathi', 'Nair', '1995-08-01', 2003, 'Vadodara', 'ME-102'),
  (1871, 'Ananya', 'Mishra', '1987-02-24', 2015, 'Delhi', 'ECE-101'),
  (1884, 'Varun', 'Rajan', '2000-09-06', 2008, 'Patna', 'ECE-102'),
  (1916, 'Sonali', 'Das', '1991-12-10', 2012, 'Vadodara', 'BIO-101'),
  (1954, 'Nandini', 'Patel', '1992-04-03', 2010, 'Chennai', 'ECE-102'),
  (1994, 'Pallavi', 'Bose', '1992-01-03', 2020, 'Mumbai', 'ME-101'),
  (2003, 'Karthik', 'Kamath', '1987-09-08', 2008, 'Indore', 'ME-101'),
  (2042, 'Varun', 'Murthy', '2000-04-26', 2015, 'Amritsar', 'ME-101'),
  (2053, 'Aditya', 'Rajan', '1998-06-14', 2013, 'Udaipur', 'EEE-101'),
  (2061, 'Aditya', 'Menon', '1997-12-11', 2003, 'Coimbatore', 'ME-101'),
  (2078, 'Basavraj', 'Jain', '1989-07-06', 2008, 'Udaipur', 'ME-101'),
  (2087, 'Shyam', 'Ghosh', '1988-01-21', 2017, 'Bangalore', 'CS-102');

-- Batch 3: records 51–75
INSERT INTO student VALUES
  (2107, 'Anjali', 'Shah', '2000-08-07', 2012, 'Mumbai', 'CS-103'),
  (2136, 'Arjun', 'Prabhu', '1993-08-10', 2013, 'Bhubaneswar', 'ECE-103'),
  (2186, 'Shankar', 'Kulkarni', '1991-05-07', 2001, 'Agra', 'EEE-101'),
  (2225, 'Ananya', 'Prasad', '1995-01-02', 2018, 'Bhopal', 'ECE-101'),
  (2263, 'Deepak', 'Menon', '2001-02-28', 2005, 'Delhi', 'ECE-102'),
  (2272, 'Vivek', 'Desai', '1988-10-08', 2018, 'Varanasi', 'CS-101'),
  (2316, 'Suresh', 'Shah', '2001-06-09', 2006, 'Nashik', 'ME-101'),
  (2337, 'Nitin', 'Joshi', '1994-08-11', 2002, 'Bangalore', 'BIO-101'),
  (2381, 'Aditya', 'Pillai', '2002-04-17', 2008, 'Jaipur', 'IT-101'),
  (2390, 'Asha', 'Shenoy', '1994-03-15', 2017, 'Nagpur', 'ECE-102'),
  (2436, 'Revathi', 'Nair', '2002-05-22', 2003, 'Jaipur', 'ME-102'),
  (2448, 'Kavya', 'Prasad', '2002-03-09', 2009, 'Varanasi', 'ME-101'),
  (2498, 'Reshma', 'Naidu', '1993-09-16', 2008, 'Mumbai', 'CS-102'),
  (2543, 'Vinay', 'Dubey', '1986-01-11', 2004, 'Madurai', 'CS-103'),
  (2576, 'Vinay', 'Ghosh', '1985-02-03', 2004, 'Ranchi', 'CS-101'),
  (2604, 'Siddharth', 'Mehta', '1989-01-10', 2011, 'Hyderabad', 'IT-101'),
  (2622, 'Asha', 'Rajan', '1988-06-25', 2017, 'Amritsar', 'ECE-102'),
  (2636, 'Vivek', 'Hegde', '1990-07-01', 2005, 'Aurangabad', 'IT-102'),
  (2683, 'Asha', 'Dubey', '1990-12-04', 2012, 'Hyderabad', 'BIO-101'),
  (2702, 'Preeti', 'Agarwal', '1996-05-27', 2007, 'Mangalore', 'CS-101'),
  (2749, 'Gaurav', 'Desai', '1995-05-28', 2002, 'Visakhapatnam', 'IT-101'),
  (2795, 'Sowmya', 'Desai', '2002-06-01', 2003, 'Madurai', 'CS-103'),
  (2837, 'Madhuri', 'Iyer', '1988-10-14', 2011, 'Nashik', 'IT-102'),
  (2880, 'Sowmya', 'Patel', '1997-10-07', 2008, 'Hyderabad', 'EEE-101'),
  (2912, 'Arjun', 'Mukherjee', '2002-11-24', 2006, 'Vadodara', 'IT-102');

-- Batch 4: records 76–100
INSERT INTO student VALUES
  (2921, 'Sunil', 'Dey', '1995-11-28', 2003, 'Nagpur', 'ECE-101'),
  (2945, 'Pavan', 'Bhat', '1997-12-10', 2017, 'Jaipur', 'ME-101'),
  (2976, 'Kiran', 'Gopal', '1990-10-19', 2009, 'Chandigarh', 'ECE-101'),
  (2981, 'Naveen', 'Chauhan', '1991-07-26', 2018, 'Varanasi', 'ECE-103'),
  (3006, 'Padma', 'Jain', '1999-11-07', 2016, 'Bhopal', 'EEE-101'),
  (3021, 'Suresh', 'Chauhan', '2001-11-21', 2019, 'Aurangabad', 'CS-102'),
  (3041, 'Komal', 'Pandey', '1991-03-01', 2001, 'Coimbatore', 'BIO-101'),
  (3085, 'Meera', 'Agarwal', '1998-11-19', 2006, 'Rajkot', 'BIO-101'),
  (3115, 'Asha', 'Kulkarni', '1985-02-25', 2013, 'Mangalore', 'CS-103'),
  (3164, 'Girish', 'Agarwal', '1986-09-08', 2003, 'Udaipur', 'CS-103'),
  (3198, 'Revathi', 'Ghosh', '1995-08-20', 2016, 'Ludhiana', 'ECE-101'),
  (3231, 'Deepak', 'Prasad', '2000-08-09', 2007, 'Visakhapatnam', 'ECE-101'),
  (3267, 'Vivek', 'Dubey', '1999-02-23', 2009, 'Coimbatore', 'ME-102'),
  (3293, 'Ravi', 'Das', '1987-03-05', 2007, 'Rajkot', 'EEE-101'),
  (3307, 'Sonali', 'Pillai', '1998-07-11', 2017, 'Udaipur', 'IT-102'),
  (3315, 'Akash', 'Shah', '1997-10-23', 2000, 'Guwahati', 'IT-102'),
  (3350, 'Arjun', 'Pai', '1994-07-28', 2013, 'Ranchi', 'EEE-101'),
  (3389, 'Rajesh', 'Banerjee', '1992-05-14', 2015, 'Chennai', 'IT-102'),
  (3415, 'Sudha', 'Murthy', '1990-08-05', 2019, 'Ranchi', 'CS-101'),
  (3445, 'Pooja', 'Reddy', '1998-03-28', 2014, 'Trivandrum', 'CS-101'),
  (3466, 'Kiran', 'Bhat', '1991-08-11', 2010, 'Rajkot', 'ME-102'),
  (3497, 'Tarun', 'Reddy', '2000-01-24', 2017, 'Mumbai', 'IT-101'),
  (3516, 'Nikhil', 'Kumar', '1986-01-08', 2006, 'Chennai', 'ECE-102'),
  (3530, 'Vivek', 'Joshi', '2000-11-04', 2018, 'Mysore', 'BIO-101'),
  (3579, 'Tarun', 'Kumar', '1996-03-20', 2019, 'Ahmedabad', 'CS-103');

-- -------------------------------------------------------------
-- Mentor Has Student (100 records)
-- -------------------------------------------------------------
-- Batch 1: records 1–25
INSERT INTO mentor_has_student VALUES
  (2, 602, 'C+', 2001, 'Moderate performance'),
  (8, 1711, 'B+', 2001, 'Struggling, additional support needed'),
  (1, 1994, 'B-', 2002, 'Passed with low performance'),
  (4, 3516, 'C+', 2002, 'Struggling, additional support needed'),
  (10, 1481, 'B+', 2002, 'Average, needs more effort'),
  (12, 102, 'F-', 2002, 'Needs significant improvement'),
  (12, 2576, 'B-', 2002, 'Below expectations, needs guidance'),
  (1, 1339, 'A-', 2003, 'Average, needs more effort'),
  (4, 1954, 'A', 2003, 'Moderate performance'),
  (8, 125, 'B+', 2003, 'Consistent performer'),
  (9, 945, 'B+', 2004, 'Solid performance overall'),
  (9, 2880, 'B-', 2004, 'Passed with low performance'),
  (10, 145, 'A++', 2004, 'Outstanding academic performance'),
  (10, 2543, 'C', 2004, 'Moderate performance'),
  (11, 1851, 'A', 2004, 'Good understanding of concepts'),
  (11, 3267, 'B+', 2004, 'Good understanding of concepts'),
  (1, 202, 'A++', 2005, 'Exceptional student'),
  (1, 2945, 'A-', 2005, 'Excellent progress shown'),
  (7, 545, 'A-', 2005, 'Strong grasp of subject'),
  (8, 1767, 'D+', 2005, 'Below average, requires mentoring'),
  (10, 1812, 'E+', 2005, 'Good understanding of concepts'),
  (10, 3115, 'C', 2005, 'Good understanding of concepts'),
  (2, 1448, 'B', 2006, 'Passed with low performance'),
  (2, 1871, 'A', 2006, 'Below expectations, needs guidance'),
  (3, 1625, 'B-', 2006, 'Good academic record');

-- Batch 2: records 26–50
INSERT INTO mentor_has_student VALUES
  (9, 954, 'D+', 2006, 'Below expectations, needs guidance'),
  (9, 3350, 'D', 2006, 'Needs significant improvement'),
  (11, 245, 'A-', 2006, 'Very good performance'),
  (11, 1659, 'A+', 2006, 'Failed, re-evaluation required'),
  (12, 3415, 'A++', 2006, 'Good understanding of concepts'),
  (3, 1554, 'B-', 2007, 'Needs significant improvement'),
  (5, 1603, 'B+', 2007, 'Good academic record'),
  (7, 3041, 'B-', 2007, 'Good academic record'),
  (9, 845, 'B+', 2007, 'Good understanding, can improve'),
  (9, 3006, 'A-', 2007, 'Very good performance'),
  (11, 302, 'C+', 2007, 'Average, needs more effort'),
  (12, 2272, 'B+', 2007, 'Below average, requires mentoring'),
  (12, 2702, 'B+', 2007, 'Average, needs more effort'),
  (2, 745, 'A-', 2008, 'Excellent progress shown'),
  (2, 3198, 'B+', 2008, 'Good academic record'),
  (5, 345, 'E+', 2008, 'Below average, requires mentoring'),
  (1, 2448, 'E+', 2009, 'Below expectations, needs guidance'),
  (5, 445, 'B+', 2009, 'Good academic record'),
  (7, 1916, 'D+', 2009, 'Very good performance'),
  (7, 2337, 'D+', 2009, 'Below expectations, needs guidance'),
  (8, 1234, 'B+', 2009, 'Good understanding of concepts'),
  (8, 3021, 'A', 2009, 'Below average, requires mentoring'),
  (9, 2186, 'E+', 2009, 'Below expectations, needs guidance'),
  (10, 2107, 'B', 2009, 'Strong grasp of subject'),
  (1, 2316, 'C+', 2010, 'Consistent performer');

-- Batch 3: records 51–75
INSERT INTO mentor_has_student VALUES
  (6, 487, 'C+', 2010, 'Satisfactory performance'),
  (10, 3579, 'C', 2010, 'Struggling, additional support needed'),
  (1, 2003, 'B+', 2011, 'Struggling, additional support needed'),
  (1, 2078, 'A+', 2011, 'Consistent performer'),
  (2, 2976, 'A++', 2011, 'Satisfactory performance'),
  (2, 3231, 'C', 2011, 'Below expectations, needs guidance'),
  (3, 2136, 'E+', 2011, 'Failed, re-evaluation required'),
  (5, 2636, 'A-', 2011, 'Good understanding of concepts'),
  (1, 2042, 'B', 2012, 'Strong grasp of subject'),
  (3, 645, 'E+', 2012, 'Struggling, additional support needed'),
  (4, 1509, 'B', 2012, 'Strong grasp of subject'),
  (6, 2381, 'B', 2012, 'Struggling, additional support needed'),
  (9, 2053, 'D', 2012, 'Struggling, additional support needed'),
  (12, 1024, 'D+', 2012, 'Passed with low performance'),
  (3, 1740, 'A', 2013, 'Consistent performer'),
  (4, 654, 'F-', 2013, 'Failed, re-evaluation required'),
  (4, 2622, 'C', 2013, 'Struggling, additional support needed'),
  (6, 2749, 'B-', 2013, 'Good academic record'),
  (7, 2683, 'D', 2013, 'Below expectations, needs guidance'),
  (7, 1701, 'A+', 2014, 'Strong grasp of subject'),
  (11, 3466, 'A', 2014, 'Strong grasp of subject'),
  (3, 2981, 'A', 2015, 'Excellent progress shown'),
  (5, 1752, 'C+', 2015, 'Average, needs more effort'),
  (8, 2087, 'B+', 2015, 'Strong grasp of subject'),
  (9, 3293, 'C+', 2017, 'Outstanding academic performance');

-- Batch 4: records 76–100
INSERT INTO mentor_has_student VALUES
  (10, 3164, 'A++', 2017, 'Struggling, additional support needed'),
  (11, 1471, 'E+', 2017, 'Strong grasp of subject'),
  (1, 1376, 'B-', 2018, 'Strong grasp of subject'),
  (4, 1884, 'E+', 2018, 'Passed with low performance'),
  (4, 2390, 'A+', 2018, 'Consistent performer'),
  (5, 2837, 'F-', 2018, 'Satisfactory performance'),
  (6, 2604, 'B+', 2018, 'Moderate performance'),
  (7, 3085, 'C+', 2018, 'Strong grasp of subject'),
  (7, 3530, 'C+', 2018, 'Good understanding of concepts'),
  (12, 3445, 'D', 2018, 'Moderate performance'),
  (2, 2921, 'C+', 2019, 'Passed with low performance'),
  (5, 3389, 'A-', 2019, 'Excellent progress shown'),
  (3, 1300, 'B+', 2020, 'Good academic record'),
  (5, 3315, 'B-', 2020, 'Strong grasp of subject'),
  (6, 3497, 'B+', 2020, 'Passed with low performance'),
  (10, 1409, 'A', 2020, 'Consistent performer'),
  (1, 2061, 'A-', 2021, 'Satisfactory performance'),
  (5, 2912, 'A+', 2021, 'Outstanding academic performance'),
  (8, 2498, 'B-', 2021, 'Moderate performance'),
  (10, 2795, 'B-', 2021, 'Failed, re-evaluation required'),
  (2, 2225, 'B', 2022, 'Good academic record'),
  (4, 1427, 'D+', 2022, 'Consistent performer'),
  (4, 2263, 'B+', 2022, 'Needs significant improvement'),
  (5, 3307, 'B+', 2022, 'Very good performance'),
  (11, 2436, 'B-', 2022, 'Good academic record');
