#找出該生申請的兼修課程
SELECT * FROM project_database.學程申請 WHERE 學號=10844115;
#結果: '10844115', '1011Z', '109-1', '108-2', '修習'


#找出學程名稱(項目名稱)
SELECT * FROM project_database.學程表單 WHERE 學程代碼='1011Z';
#結果: '108-1', '1011Z', '跨', '科技管理跨領域學分學程', '15', '工業系'

#找出該學程應修課程
SELECT * FROM project_database.兼修相關課程 WHERE 種類=3 AND 學年期='108-1' AND 項目名稱='科技管理跨領域學分學程';
#結果: 
#'AC073K', '108-1', '3', '科技管理跨領域學分學程'
#'BA100A', '108-1', '3', '科技管理跨領域學分學程'
#'CS681R', '108-1', '3', '科技管理跨領域學分學程'
#'ES803L', '108-1', '3', '科技管理跨領域學分學程'


#找出所有修該學程的學生
SELECT * FROM project_database.學程申請 WHERE 申請學程代碼='1011Z' AND 申請學年期='108-1';
#結果: 
#'10843117', '1011Z', '108-1', NULL, '通過'
#'10843118', '1011Z', '108-1', NULL, '修習'
#'10943116', '1011Z', '108-1', NULL, '修習'
#'10944111', '1011Z', '108-1', NULL, '修習'
#'10944114', '1011Z', '108-1', NULL, '修習'



#本人修過的課程
SELECT * FROM project_database.成績紀錄 where 學號=10844115;
#結果: '109-1', '10844115', 'AC073K', '96', 'A+', 'P', NULL


#其他人修過的課程
SELECT * FROM project_database.成績紀錄 where 學號=10843117;
#結果:
#'108-2', '10843117', 'AC073K', '61', 'C-', 'P', NULL
#'108-1', '10843117', 'BA100A', '71', 'B', 'P', NULL
#'108-2', '10843117', 'CS681R', '81', 'B+', 'P', NULL
#'109-2', '10843117', 'ES803L', '91', 'A-', 'P', NULL


SELECT * FROM project_database.成績紀錄 where 學號=10943116;
#結果:
#'109-1', '10943116', 'AC073K', '60', 'C-', 'P', NULL
#'109-1', '10943116', 'CS681R', '80', 'B-', 'P', NULL


SELECT * FROM project_database.成績紀錄 where 學號=10843118;
#結果:
#'108-1', '10843118', 'AC073K', '92', 'A', 'P', NULL
#'108-2', '10843118', 'ES803L', '71', 'B-', 'P', NULL


SELECT * FROM project_database.成績紀錄 where 學號=10944111;
#結果:
#'109-1', '10944111', 'AC073K', '75', 'B', 'P', NULL
#'108-2', '10944111', 'BA100A', '90', 'A', 'P', NULL
#'109-2', '10944111', 'CS681R', '89', 'A-', 'P', NULL


SELECT * FROM project_database.成績紀錄 where 學號=10944114;
#結果:
#'109-2', '10944114', 'AC073K', '62', 'C', 'P', NULL
#'109-2', '10944114', 'BA100A', '70', 'C+', 'P', NULL

