dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
= SET_DBF(1,DBF_BA+'ropb05','ropb05_1','pb05',10)
do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
if ERR_USE
   close DATABASES
   return
endif
seek 'AR'
WSYS_YM1 = SYS_YM
seek 'IV'
WSYS_YM2 = SYS_YM
select 10
use (DBF_FI+'roac02')
if ERR_USE
   ERR_USE = .F.
   close DATABASES
   return
endif
goto TOP
WAC_SLTX = AC_SLTX
WAC_RECV = AC_RECV
WAC_RECV1 = AC_RECV1
WAC_INCM = AC_INCM
WAC_INCM2 = AC_INCM2
WAC_OTRE = AC_OTRE
WAC_OTRE1 = AC_OTRE1
WAC_OINCM = AC_OINCM
WAC_OINCM1 = AC_OINCM1
WAC_INCM1 = AC_INCM1
WAC_REAR = AC_REAR
WAC_LOS1 = AC_LOS1
WAC_LOS2 = AC_LOS2
WAC_COMM = AC_COMM
use
WAR_RENO = 'S1'
dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
= SET_DBF(1,DBF_BA+'ropb10','ropb10_1','pb10',10)
do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
if ERR_USE
   close DATABASES
   return
endif
WPB_ID = 'sa'
seek WPB_ID+'IE_CLSNOTE'
IE_CLSNOTE = TRIM(PB_VALUE)
if EMPTY(IE_CLSNOTE)
   IE_CLSNOTE = '1'
endif
use IN PB10
clear
close DATABASES
store 'F' TO EX_FLG
SYSTEM = ' 《 銷貨單資料維護 》 '
OPTION = '（   功能選定   ）'
do CHK_HD1
set colo to &co_form
@ 1, 1 SAY '┌─────────┬─────────────────┬─────────┐'
@ 2, 1 SAY '│                  │                                  │                  │'
@ 3, 1 SAY '├─────────┴─────────────────┴─────────┤'
@ 4, 1 SAY '│銷貨單號:               客戶代碼:                  銷貨日期:              │'
@ 5, 1 SAY '│識 別 碼:               帳款歸屬:                  內外銷別:              │'
@ 6, 1 SAY '│發票對象:            聯 發票號碼:                  課 稅 別:              │'
@ 7, 1 SAY '│交易條件:               幣別匯率:                  結帳方式:            天│'
@ 8, 1 SAY '│INVOICE :               L/C NO  :                  結帳日期:              │'
@ 9, 1 SAY '│貨款期限:          報單:                           業務部門:              │'
@ 10, 1 SAY '│送貨地點:                                          申請單號:              │'
@ 11, 1 SAY '├─────────────────────────────────────┤'
if IE_ODEL
   @ 12, 1 SAY '│序項次 批 號 訂單/出貨(料號) 單位 類別 出貨數量  單        價 小      計收│'
   @ 13, 1 SAY '│號==== ===== =============== ==== ==== ========= ============ ==========費│'
else
   @ 12, 1 SAY '│序項次 批 號 料  品  編  號  單位 類別 出貨數量  單        價 小      計收│'
   @ 13, 1 SAY '│號==== ===== =============== ==== ==== ========= ============ ==========費│'
endif
@ 14, 1 SAY '│１                                                                        │'
@ 15, 1 SAY '│                                                                          │'
@ 16, 1 SAY '│２                                                                        │'
@ 17, 1 SAY '│                                                                          │'
@ 18, 1 SAY '│３                                                                        │'
@ 19, 1 SAY '│                                                                          │'
@ 20, 1 SAY '├─────────────────────────────────────┤'
@ 21, 1 SAY '│銷貨:            沖預收款:            稅額:            其它費用:          │'
@ 22, 1 SAY '└─────────────────────────────────────┘'
set colo to &co_sys
do CHK_HD2 WITH SYSTEM, OPTION
set colo to &co_say
save SCREEN TO MENU_SCR
dimension DBF_ARY[ 20], TAG_ARY[ 20], ALIAS_ARY[ 20], ANO_ARY[ 20]
= SET_DBF(20,DBF_FI+'roar03','roar03_1','ar03',32)
= SET_DBF(19,DBF_FI+'roac17','roac17_3','ac17',31)
= SET_DBF(18,DBF_BA+'roel17','roel17_2','el17',30)
= SET_DBF(17,DBF_SA+'rood02','rood02_1','od02',17)
= SET_DBF(16,DBF_BA+'rodp00','rodp00_1','dp00',16)
= SET_DBF(15,DBF_BA+'roelin','roelin_1','elin',15)
= SET_DBF(14,DBF_BA+'rocu02','rocu02_1','cu02',14)
= SET_DBF(13,DBF_SA+'rood00','rood00_1','od00',13)
= SET_DBF(12,DBF_FI+'roar08','roar08_1','ar08',12)
= SET_DBF(11,DBF_FI+'roar06','roar06_1','ar06',11)
= SET_DBF(10,DBF_FI+'roar00','roar00_1','ar00',10)
= SET_DBF(9,DBF_SA+'rosa06','rosa06_1','sa06',9)
= SET_DBF(8,DBF_SA+'rosa05','rosa05_1','sa05',8)
= SET_DBF(7,DBF_SA+'rood03','rood03_1','od03',7)
= SET_DBF(6,DBF_BA+'rocu00','rocu00_1','cu00',6)
= SET_DBF(5,DBF_SA+'rood01','rood01_1','od01',5)
= SET_DBF(4,DBF_SC+'romt00','romt00_1','mt00',4)
= SET_DBF(3,DBF_BA+'roel00','roel00_1','el00',3)
= SET_DBF(2,DBF_SA+'rosa01','rosa01_1','sa01',2)
= SET_DBF(1,DBF_SA+'rosa00','rosa00_1','sa00',1)
do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
if ERR_USE
   close DATABASES
   return
endif
select 1
TRX_LIM = 3
TRX_BEG = 13
FLG_DISP = .T.
DISP_N = 'N'
dimension DROW( 10)
II = 1
do WHILE II<=TRX_LIM
   DROW( II) = TRX_BEG+2*(II-1)+1
   II = II+1
enddo
VAR( 1) = SPACE(3)
TSA_TYPE = ' '
select 1
goto BOTTOM
do Y2K_SER WITH 'SA_NO'
WSA_NO = SA_NO
ARR( 1) = 0
ARR1( 1) = 0
do WHILE .T.
   @ 2,3 say "（   功能選定   ）" colo &co_sys
   select 1
   unlock ALL
   CNT = 1
   WSA_BIL = SA_BIL
   store SA_NO TO WSA_NO
   do ROSA00_S
   select 1
   if IE_CLSNOTE='1'
      MSG00 = '[F9]查詢       [F6]費用  [F7]列印 [F10]補登 [Hom]結關 [INS]輸入報單 [Esc]結束'
      MSG01 = '[F8]申請單查詢 [F1]新增  [F2]修正 [F3]異動  [F4]刪除  [F5]其它作業  [End]確認'
   else
      MSG00 = '[F9]查詢       [F6]費用  [F7]列印 [F10]補登 [Hom]結關 [INS]輸入報單 [Esc]結束'
      MSG01 = '[F8]申請單查詢 [F1]新增  [F2]修正 [F3]異動  [F4]刪除  [F5]其它作業  [End]簽收'
   endif
   set color to &co_key
   @ 23, (80-LEN(MSG00))/2 SAY MSG00
   @ 24, (80-LEN(MSG01))/2 SAY MSG01
   set colo to &co_say
   do WHILE .T.
      select 1
      P_KEY = V_KEY(0)
      if P_KEY#TC_PGUP .and. P_KEY#TC_HOM .and. P_KEY#TC_ESC .and. P_KEY#TC_F1 .and. P_KEY#TC_UP .and. P_KEY#TC_DN .and. P_KEY#TC_F6 .and. P_KEY#TC_F10 .and. P_KEY#TC_INS .and. P_KEY#TC_PGDN .and. P_KEY#TC_END .and. P_KEY#TC_F2 .and. P_KEY#TC_F3 .and. P_KEY#TC_F9 .and. P_KEY#TC_F4 .and. P_KEY#TC_F5 .and. P_KEY#TC_F7 .and. P_KEY#TC_F8
         loop
      endif
      if P_KEY#TC_F1 .and. P_KEY#TC_F10 .and. P_KEY#TC_ESC
         select 1
         if EOF() .and. BOF()
            do CHK_MSG WITH '檔案中無資料'
            loop
         endif
         if SA_ACID='*' .and. (P_KEY=TC_F2 .or. P_KEY=TC_F3 .or. P_KEY=TC_F4 .or. P_KEY=TC_F6 .or. P_KEY=TC_F7)
            do CHK_MSG WITH '此銷貨單已作廢 !!'
            loop
         endif
      endif
      if SA_SURE='Y' .and. SUBSTR(RIGHT0,6,1)#'Y' .and. (P_KEY=TC_F2 .or. P_KEY=TC_F3 .or. P_KEY=TC_F4)
         do CHK_MSG WITH '本銷貨單已確認,不得異動!!'
         loop
      endif
      if P_KEY=TC_F2 .or. P_KEY=TC_F3 .or. P_KEY=TC_F4 .or. P_KEY=TC_END
         if A.SA_DATE<=WSYS_YM
            do CHK_MSG WITH WSYS_YM+'前銷貨資料已確認不得異動!!'
            loop
         endif
         if A.SA_DATE<=WSYS_YM1
            do CHK_MSG WITH WSYS_YM1+'前應收帳款資料已確認不得異動!!'
            loop
         endif
         if A.SA_DATE<=WSYS_YM2
            do CHK_MSG WITH WSYS_YM2+'前銷項發票資料已確認不得異動!!'
            loop
         endif
         select AR00
         seek WSA_BIL+WSA_NO+' '+WAR_RENO
         if AR_SURE#' '
            do CHK_MSG WITH '此銷貨單之應收憑單已確認!!'
            loop
         endif
         if SA_ACPT+SA_DISCD#0
            do CHK_MSG WITH '此銷貨單之應收憑單已有帳款沖帳記錄不得異動!!'
            loop
         endif
         select 1
      endif
      exit
   enddo
   do CASE
      case P_KEY=TC_ESC
         select 2
         close DATABASES
         return
      case P_KEY=TC_F9
         OPTION = '（ 查 詢 資 料  ）'
         @ 2,3 say option colo &co_sys
         T_SORT = MESG_YN(' 1.銷貨單 2.Invoice 3.發票 4.報單   查詢','1234 ',3)
         set RELATION TO CU_NO INTO 6
         do CASE
            case T_SORT='1'
               set ORDER TO 1
               TITAL = '銷貨單號  客戶簡稱 銷貨日期 結帳日期 貨款期限 確認'
               TITAL1 = '========= ======== ======== ======== ======== ===='
               WINF = 'F'
               do CHK_WIN WITH LEN(TITAL)+2, 'sa_no', "cu00->cu_na+' '+sa_date+' '+sa_chdat+' '+sa_ltdat+' '+sa_sure", 4, 12, WINF, SPACE(LEN(SA_NO))
            case T_SORT='2'
               set ORDER TO 7
               TITAL = ' Invoice   銷貨單號  客戶簡稱 銷貨日期 結帳日期 貨款期限 確認'
               TITAL1 = '========== ========= ======== ======== ======== ======== ===='
               WINF = 'F'
               do CHK_WIN WITH LEN(TITAL)+2, 'sa_ivno', "sa_no+' '+cu00->cu_na+' '+sa_date+' '+sa_chdat+' '+sa_ltdat+' '+sa_sure", 8, 12, WINF, SPACE(LEN(SA_IVNO))
            case T_SORT='3'
               set ORDER TO 5
               TITAL = ' 發票號碼  銷貨單號  客戶簡稱 銷貨日期 結帳日期 貨款期限 確認'
               TITAL1 = '========== ========= ======== ======== ======== ======== ===='
               WINF = 'F'
               do CHK_WIN WITH LEN(TITAL)+2, 'sa_ivno1', "sa_no+' '+cu00->cu_na+' '+sa_date+' '+sa_chdat+' '+sa_ltdat+' '+sa_sure", 6, 36, WINF, SPACE(LEN(SA_IVNO1))
            case T_SORT='4'
               set ORDER TO 8
               TITAL = ' 報               單   銷貨單號  客戶簡稱 銷貨日期 確認'
               TITAL1 = '====================== ========= ======== ======== ===='
               WINF = 'F'
               do CHK_WIN WITH LEN(TITAL)+2, 'sa_via', "sa_no+' '+cu00->cu_na+' '+sa_date+' '+sa_sure", 9, 30, WINF, SPACE(LEN(SA_VIA))
         endcase
         set ORDER TO 1
         set RELATION TO
         ARR( 1) = 0
      case P_KEY=TC_F8
         OPTION = '（ 查 詢 資 料  ）'
         @ 2,3 say option colo &co_sys
         set ORDER TO rosa00_4
         set RELATION TO CU_NO INTO 6
         TITAL = '申請單號  銷貨單號  客戶簡稱 銷貨日期 結帳日期 貨款期限 確認'
         TITAL1 = '========= ========= ======== ======== ======== ======== ===='
         WINF = 'F'
         do CHK_WIN WITH LEN(TITAL)+2, 'sa_shipno', "sa_no+' '+cu00->cu_na+' '+sa_date+' '+sa_chdat+' '+sa_ltdat+' '+sa_sure", 10, 63, WINF, SPACE(LEN(SA_SHIPNO))
         set RELATION TO
         set ORDER TO rosa00_1
         ARR( 1) = 0
      case P_KEY=TC_PGUP
         if  .not. BOF()
            skip -1
         endif
         if BOF()
            do CHK_MSG WITH ' 資料已至首筆 '
            goto TOP
         endif
         ARR( 1) = 0
      case P_KEY=TC_PGDN
         if  .not. EOF()
            skip
         endif
         if EOF()
            do CHK_MSG WITH ' 資料已至末筆 '
            goto BOTTOM
         endif
         ARR( 1) = 0
      case P_KEY=TC_UP
         select 2
         if ARR(1)#0 .and. RECNO()#ARR(1)
            goto ARR(1)
         endif
         I = 1
         do WHILE  .not. BOF() .and. SA_NO=WSA_NO .and. I<=TRX_LIM
            skip -1
            I = I+1
         enddo
         if BOF() .or. SA_NO#WSA_NO
            do CHK_MSG WITH '已無上頁明細!!'
            seek WSA_NO
         endif
         loop
      case P_KEY=TC_DN
         select 2
         if CNT>TRX_LIM
            goto ARR(TRX_LIM)
            skip 1
            if EOF() .or. SA_NO#WSA_NO
               do CHK_MSG WITH '已無下頁明細!!'
               goto ARR(1)
            endif
         else
            do CHK_MSG WITH '已無下頁明細!!'
         endif
         loop
      case P_KEY=TC_F1
         if SUBSTR(RIGHT0,2,1)#'Y'
            do CHK_MSG WITH '使用者在本作業無新增之權限'
            loop
         endif
         OPTION = '（ 新 增 資 料  ）'
         @ 2,3 say option colo &co_sys
         dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
         = SET_DBF(1,DBF_SA+'rosa29','rosa29_2','sa29',0)
         do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
         if ERR_USE
            close DATABASES
            return
         endif
         do ROSA00_A WITH 'A'
         select SA29
         use
         @ 23, 0 CLEAR
         select 1
         if EOF()
            goto BOTTOM
         endif
         ARR( 1) = 0
      case P_KEY=TC_F2
         if SUBSTR(RIGHT0,3,1)#'Y'
            do CHK_MSG WITH '使用者在本作業無修改之權限'
            loop
         endif
         OPTION = '（ 修 正 表 頭  ）'
         @ 2,3 say option colo &co_sys
         dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
         = SET_DBF(1,DBF_SA+'rosa29','rosa29_2','sa29',0)
         do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
         if ERR_USE
            close DATABASES
            return
         endif
         select 1
         if _RLOCK(30)
            loop
         endif
         do ROSA00_A WITH 'B'
         select 1
         unlock
         select SA29
         use
         @ 23, 0 CLEAR
         select 1
         if EOF()
            goto BOTTOM
         endif
         ARR( 1) = 0
      case P_KEY=TC_F4
         if SUBSTR(RIGHT0,4,1)#'Y'
            do CHK_MSG WITH '使用者在本作業無刪除之權限'
            loop
         endif
         OPTION = '（ 資 料 刪 除  ）'
         @ 2,3 say option colo &co_sys
         dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
         = SET_DBF(1,DBF_SA+'rosa04','rosa04_4','sa04',20)
         do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
         if ERR_USE
            close DATABASES
            return
         endif
         select SA04
         seek '2'+WSA_NO
         if  .not. EOF()
            do CHK_MSG WITH '仍有銷貨退回記錄,不得刪除!!'
            use IN SA04
            loop
         endif
         use IN SA04
         dimension DBF_ARY[ 7], TAG_ARY[ 7], ALIAS_ARY[ 7], ANO_ARY[ 7]
         = SET_DBF(7,DBF_SA+'rosa24','rosa24_2','sa24',20)
         = SET_DBF(6,DBF_BA+'romk','romk_1','mk',19)
         = SET_DBF(5,DBF_SA+'rosa29','rosa29_1','sa29',18)
         = SET_DBF(4,DBF_FI+'roar15','roar15_1','ar15',17)
         = SET_DBF(3,DBF_FI+'roar10','roar10_1','ar10',16)
         = SET_DBF(2,DBF_FI+'roar16','roar16_1','ar16',15)
         = SET_DBF(1,DBF_SA+'rosa09','rosa09_1','sa09',14)
         do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
         if ERR_USE
            close DATABASES
            return
         endif
         do ROSA00_C
         use IN SA24
         use IN MK
         use IN SA29
         use IN AR15
         use IN AR10
         use IN AR16
         use IN SA09
         dimension DBF_ARY[ 4], TAG_ARY[ 4], ALIAS_ARY[ 4], ANO_ARY[ 4]
         = SET_DBF(4,DBF_SA+'rood02','rood02_1','od02',17)
         = SET_DBF(3,DBF_BA+'rodp00','rodp00_1','dp00',16)
         = SET_DBF(2,DBF_BA+'roelin','roelin_1','elin',15)
         = SET_DBF(1,DBF_BA+'rocu02','rocu02_1','cu02',14)
         do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
         if ERR_USE
            close DATABASES
            return
         endif
         select 20
         use
         @ 23, 0 CLEAR
         select 1
         if EOF()
            goto BOTTOM
         endif
         ARR( 1) = 0
      case P_KEY=TC_F3
         OPTION = '（ 內 容 異 動  ）'
         @ 2,3 say option colo &co_sys
         dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
         = SET_DBF(1,DBF_SA+'rosa29','rosa29_1','sa29',0)
         do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
         if ERR_USE
            close DATABASES
            return
         endif
         do ROSA00_B
         select SA29
         use
         @ 23, 0 CLEAR
         select 1
         if EOF()
            goto BOTTOM
         endif
         ARR( 1) = 0
      case P_KEY=TC_HOM
         if SUBSTR(RIGHT0,2,1)#'Y'
            do CHK_MSG WITH '使用者在本作業無新增之權限'
            loop
         endif
         OPTION = '（ 結 關 資 料  ）'
         @ 2,3 say option colo &co_sys
         select 1
         if _RLOCK(30)
            loop
         endif
         do ROSA_CL
         restore SCREEN FROM MENU_SCR
         select 1
         unlock
         ARR( 1) = 0
      case P_KEY=TC_INS
         OPTION = '（ 輸 入 報 單  ）'
         @ 2,3 say option colo &co_sys
         select 1
         WBN_ID = BN_ID
         WSA_VIA = SA_VIA
         if _RLOCK(30)
            loop
         endif
         dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
         = SET_DBF(1,DBF_SA+'robnid','robnid_1','bnid',20)
         do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
         if ERR_USE
            ERR_USE = .F.
            close DATABASES
            return
         endif
         P_COD = 1
         WINF = 'F'
         TITAL = '報單代號 名                                   稱'
         TITAL1 = '======== ======================================='
         do CHK_WIN WITH LEN(TITAL)+2, 'bn_id ', '+space(6)+bn_idna', 9, 27, WINF, WBN_ID
         R_FLG = .F.
         do CHK_WINF WITH P_COD, WINF, .T., R_FLG
         if R_FLG
            @ 9, 27 SAY WBN_ID
            use
            loop
         endif
         if WINF#'S'
            WBN_ID = BN_ID
         endif
         @ 9, 27 SAY WBN_ID
         use
         if  .not. EMPTY(WBN_ID)
            do CHK_GETC WITH 9, 30, WSA_VIA, 'xx/xx/xx/xxxx/xxxxxxxx', ''
            if WSA_VIA='  /  /  /    /        '
               WBN_ID = SPACE(2)
               WSA_VIA = SPACE(LEN(WSA_VIA))
            endif
         else
            WSA_VIA = SPACE(LEN(WSA_VIA))
            @ 9, 30 SAY WSA_VIA
         endif
         select 1
         replace SA_VIA WITH WSA_VIA
         replace BN_ID WITH WBN_ID
         dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
         = SET_DBF(1,DBF_SC+'romt03','romt03_1','mt03',0)
         do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
         if ERR_USE
            close DATABASES
            return
         endif
         seek 'Q'+WSA_NO
         if  .not. EOF()
            if  .not. _RLOCK(30)
               if MT_SURE='Y' .and.  .not. EMPTY(IE_BNYEAR)
                  do CHK_MSG WITH '庫存資料已確認, 請調整保稅資料'
               endif
               replace BN_NO WITH SA00.SA_VIA
               unlock
            endif
         endif
         use
         restore SCREEN FROM MENU_SCR
         select 1
         unlock
         ARR( 1) = 0
      case P_KEY=TC_F5
         OPTION = '（ 其 它 作 業  ）'
         @ 2,3 say option colo &co_sys
         select OD02
         use
         do ROSA00_H
         restore SCREEN FROM MENU_SCR
         dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
         = SET_DBF(1,DBF_SA+'rood02','rood02_1','od02',17)
         do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
         if ERR_USE
            close DATABASES
            return
         endif
         select 1
         if EOF()
            goto BOTTOM
         endif
         ARR( 1) = 0
      case P_KEY=TC_F6
         OPTION = '（   其它費用   ）'
         @ 2,3 say option colo &co_sys
         select SA00
         seek SA_NO
         WSA_TAXID = SA_TAXID
         WSA_TAX = SA_TAX
         select AR08
         seek WAR_RENO+A.SA_ID
         WAC_NO1 = AC_NO1
         WAC_NO2 = AC_NO2
         dimension DBF_ARY[ 3], TAG_ARY[ 3], ALIAS_ARY[ 3], ANO_ARY[ 3]
         = SET_DBF(3,DBF_SA+'rosa09','rosa09_1','sa09',20)
         = SET_DBF(2,DBF_SA+'rochex','rochex_1','chex',19)
         = SET_DBF(1,DBF_FI+'roacno','roacno_1','acno',18)
         do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
         if ERR_USE
            close DATABASES
            return
         endif
         ARR1( 1) = 0
         FLG_OTHE = .F.
         TSA_TYPE = SPACE(1)
         do ROSAEX_B
         select SA09
         use
         select CHEX
         use
         select ACNO
         use
         restore SCREEN FROM MENU_SCR
         select 1
         ARR( 1) = 0
      case P_KEY=TC_F7
         OPTION = '（  列印銷貨單  ）'
         @ 2,3 say option colo &co_sys
         @ 23, 0 CLEAR TO 24, 80
         dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
         = SET_DBF(1,DBF_BA+'roelsa','roelsa_1','elsa',0)
         do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
         if ERR_USE
            close DATABASES
            return
         endif
         do ROSA00_G
         select ELSA
         use
         restore SCREEN FROM MENU_SCR
         select 1
         seek WSA_NO
         if EOF()
            goto BOTTOM
         endif
         ARR( 1) = 0
      case P_KEY=TC_END
         if SUBSTR(RIGHT0,6,1)#'Y'
            do CHK_MSG WITH '使用者在本作業無審核之權限'
            loop
         endif
         select 1
         F_REC = RECNO()
         if IE_CLSNOTE='1'
            OPTION = '（ 銷 貨 確 認  ）'
            @ 2,3 say option color &co_sys
            dimension DBF_ARY[ 5], TAG_ARY[ 5], ALIAS_ARY[ 5], ANO_ARY[ 5]
            = SET_DBF(5,DBF_FI+'roov01','roov01_1','ov01',21)
            = SET_DBF(4,DBF_FI+'roov02','roov02_1','ov02',20)
            = SET_DBF(3,DBF_FI+'roar16','roar16_1','ar16',19)
            = SET_DBF(2,DBF_FI+'roar10','roar10_1','ar10',18)
            = SET_DBF(1,DBF_SA+'rosa09','rosa09_1','sa09',17)
            do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
            if ERR_USE
               close DATABASES
               return
            endif
            do ROSA00_F
            I = '17'
            do WHILE I<='21'
               sele &i
               use
               I = STR(VAL(I)+1,2)
            enddo
            restore SCREEN FROM MENU_SCR
            dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
            = SET_DBF(1,DBF_SA+'rood02','rood02_1','od02',17)
            do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
            if ERR_USE
               close DATABASES
               return
            endif
         else
            OPTION = '（ 銷 貨 簽 收  ）'
            @ 2,3 say option color &co_sys
            define POPUP POP_END FROM 20, 3 TITLE '銷貨簽收' SHADOW
            define BAR 1 OF POP_END PROMPT ' 數量簽收 '
            define BAR 2 OF POP_END PROMPT ' 發票簽收 '
            on SELECTION POPUP POP_END deac popup pop_end
            activate POPUP POP_END
            release POPUP POP_END
            do CASE
               case BAR()=1
                  OPTION = '（   數量簽收 　）'
                  @ 2,3 say option COLO &CO_SYS
                  do ROSA00_1
                  restore SCREEN FROM MENU_SCR
               case BAR()=2
                  OPTION = '（   發票簽收 　）'
                  @ 2,3 say option colo &co_sys
                  dimension DBF_ARY[ 4], TAG_ARY[ 4], ALIAS_ARY[ 4], ANO_ARY[ 4]
                  = SET_DBF(4,DBF_FI+'roov01','roov01_1','ov01',21)
                  = SET_DBF(3,DBF_FI+'roov02','roov02_1','ov02',20)
                  = SET_DBF(2,DBF_SA+'rosa60','rosa60_1','sa60',19)
                  = SET_DBF(1,DBF_FI+'roariv','roariv_1','ariv',18)
                  do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
                  if ERR_USE
                     close DATABASES
                     return
                  endif
                  do ROSA00_2
                  I = '18'
                  do WHILE I<='21'
                     sele &i
                     use
                     I = STR(VAL(I)+1,2)
                  enddo
                  restore SCREEN FROM MENU_SCR
               otherwise
            endcase
         endif
         select 1
         set ORDER TO rosa00_1
         goto F_REC
         ARR( 1) = 0
      case P_KEY=TC_F10
         if SUBSTR(RIGHT0,2,1)#'Y'
            do CHK_MSG WITH '使用者在本作業無新增之權限'
            loop
         endif
         OPTION = '（ 新 增 資 料  ）'
         @ 2,3 say option color &co_sys
         dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
         = SET_DBF(1,DBF_SA+'rosa29','rosa29_2','sa29',0)
         do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
         if ERR_USE
            close DATABASES
            return
         endif
         do ROSA00_A WITH 'E'
         select SA29
         use
         @ 23, 0 CLEAR
         ARR( 1) = 0
   endcase
enddo

procedure ROSA_CL
select SA00
WSA_NO = SA_NO
WSA_BIL = SA_BIL
WOD_SATYP = OD_SATYP
WSA_VIA = SA_VIA
WBN_ID = BN_ID
WSA_IVNO = SA_IVNO
WSA_TAXID = SA_TAXID
FSA_TAXID = SA_TAXID
WIV_PAGE = IV_PAGE
WSA_IVNO1 = SA_IVNO1
WSA_AMT = SA_AMT
WSA_TAX = SA_TAX
WSA_OTHE = SA_OTHE
WSA_PRE = SA_PRE
WIV_DATE = IV_DATE
WSA_DATE = SA_DATE
WOD_ID = OD_ID
WSA_RATE = SA_RATE
WIV_AMT = IV_AMT
WIV_TAX = IV_TAX
if WIV_PAGE=2 .and. IE_IVAUTO='N'
   WIV_SORT = '32'
else
   WIV_SORT = '31'
endif
@ 9, 54 SAY '結關日期:           ' COLOR (CO_FORM)
@ 9, 63 SAY WIV_DATE
P_COD = 1
do WHILE .T.
   MSG00 = ' 課 稅 別:(1.零稅 2.免稅 3 外加 4.內含).   內外銷別:(1.內銷 2.外銷) '
   @ 23, 0 CLEAR
   @ 23,(80-len(msg00))/2  say msg00 colo &co_key
   R_COD = P_COD
   do CASE
      case R_COD=0
         @ 9, 54 SAY '業務部門:           ' COLOR (CO_FORM)
         return
      case R_COD=1
         @ 5, 63 SAY SPACE(8)
         do CHK_MSG WITH '內外銷別:(1) 內 銷 (2) 外 銷 (3) 合作外銷 (4)轉口貿易 ', 's', '', 0, 0, 0
         do CHK_GETC WITH 5, 64, WOD_SATYP, '9', '(1234)'
         deactivate WINDOW WIN_MSG
         release WINDOW WIN_MSG
         @ 5, 63 SAY SUBSTR('    　　內銷　　外銷　　合作外銷轉口貿易',VAL(WOD_SATYP)*8+1,8)
         if WIV_PAGE=0
            if WOD_SATYP='1' .and. WSA_TAXID='3'
               WIV_PAGE = 3
            else
               WIV_PAGE = 2
            endif
         endif
      case R_COD=2
         TIV_PAGE = STR(WIV_PAGE,1)
         if WIV_PAGE=0
            TIV_PAGE = ' '
         endif
         do CHK_GETC WITH 6, 22, TIV_PAGE, '9', '( 023)'
         WIV_PAGE = VAL(TIV_PAGE)
         if WIV_PAGE=2 .and. IE_IVAUTO='N'
            WIV_SORT = '32'
         else
            WIV_SORT = '31'
         endif
      case R_COD=3
         dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
         = SET_DBF(1,DBF_FI+'roov01','roov01_1','ov01',0)
         do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
         if ERR_USE
            close DATABASES
            return
         endif
         FLG_SS = .T.
         select OV01
         seek '1'+WSA_IVNO1
         FLG_IV = .F.
         FLG_AD = .F.
         if  .not. EOF() .and. IV_SURE='Y'
            FLG_SS = .F.
         else
            FLG_SS = .T.
         endif
         use IN OV01
         if FLG_SS
            @ 6, 36 GET WSA_IVNO1 PICTURE '@! AA99999999'
            read
            @ 6, 36 SAY WSA_IVNO1
            do CHK_PCOD WITH P_COD
            if &rd_up .or. &rd_esc
               loop
            endif
            if IE_COUNTRY='2'
               if WSA_IVNO1#SPACE(10)
                  if LEN(LTRIM(RTRIM(WSA_IVNO1)))#LEN(WSA_IVNO1)
                     do CHK_MSG WITH '單號未打滿'
                     P_COD = R_COD
                     loop
                  endif
                  dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
                  = SET_DBF(1,DBF_FI+'roov05','roov05_2','ov05',0)
                  do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
                  if ERR_USE
                     close DATABASES
                     return
                  endif
                  select OV05
                  FLG = .T.
                  W_YM = CHK_GYMD(WSA_DATE,'YM',2)
                  if IE_IVAUTO='Y'
                     if W_YM>=IE_IVYM
                        T_COD = '2'
                     else
                        T_COD = '1'
                     endif
                  else
                     T_COD = '1'
                  endif
                  PAG = STR(WIV_PAGE,1)
                  seek W_YM+PAG+T_COD
                  if  .not. EOF() .and. SUBSTR(IV_NA,1,2)=SUBSTR(WSA_IVNO1,1,2)
                     FLG = .F.
                  else
                     set ORDER TO roov05_4
                     seek W_YM+PAG+T_COD
                     if  .not. EOF() .and. SUBSTR(IV_NA,1,2)=SUBSTR(WSA_IVNO1,1,2)
                        FLG = .F.
                     else
                     endif
                  endif
                  set ORDER TO roov05_2
                  select OV05
                  use
                  if FLG
                     if  .not. MESG_YN('本年月無此字軌, 是否存入?(Y/N)')
                        P_COD = R_COD
                        loop
                     endif
                  endif
               endif
            endif
         else
            P_COD = P_COD+1
         endif
      case R_COD=4
         @ 6, 63 SAY '    '
         do CHK_GETC WITH 6, 63, WSA_TAXID, '9', '(1234)'
         @ 6, 63 SAY SUBSTR('    零稅免稅外加內含',VAL(WSA_TAXID)*4+1,4)
      case R_COD=5
         do CHK_GET WITH 8, 12, WSA_IVNO
      case R_COD=6
         dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
         = SET_DBF(1,DBF_SA+'robnid','robnid_1','bnid',20)
         do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
         if ERR_USE
            ERR_USE = .F.
            close DATABASES
            return
         endif
         WINF = 'F'
         TITAL = '報單代號 名                                   稱'
         TITAL1 = '======== ======================================='
         do CHK_WIN WITH LEN(TITAL)+2, 'bn_id', '+space(6)+bn_idna', 9, 27, WINF, WBN_ID
         R_FLG = .F.
         do CHK_WINF WITH P_COD, WINF, .T., R_FLG
         if R_FLG
            @ 9, 27 SAY WBN_ID
            use
            loop
         endif
         if WINF#'S'
            WBN_ID = BN_ID
         endif
         @ 9, 27 SAY WBN_ID
         use
      case R_COD=7
         if  .not. EMPTY(WBN_ID)
            do CHK_GETC WITH 9, 30, WSA_VIA, 'xx/xx/xx/xxxx/xxxxxxxx', ''
            if &rd_up .or. &rd_esc
               loop
            endif
            if WSA_VIA='  /  /  /    /        '
               WBN_ID = SPACE(2)
               WSA_VIA = SPACE(LEN(WSA_VIA))
            endif
         else
            WSA_VIA = SPACE(LEN(WSA_VIA))
            @ 9, 30 SAY WSA_VIA
            do CHK_PCOD WITH P_COD
         endif
      case R_COD=8
         if  .not. EMPTY(WSA_VIA)
            do CHK_GETD WITH 9, 63, WIV_DATE, .T., R_COD, .F.
         else
            P_COD = P_COD+1
         endif
      case R_COD=9
         FLG_IV = .F.
         FLG_AD = .F.
         if WSA_IVNO1#SPACE(10)
            TIV_TAXID = SUBSTR(' 2311',VAL(WSA_TAXID)+1,1)
            if WOD_ID=IE_ODID
               WSA_AMT = CHK_RND(WSA_AMT)
               WSA_PRE = CHK_RND(WSA_PRE)
               WSA_TAX = CHK_RND(WSA_TAX)
               WSA_OTHE = CHK_RND(WSA_OTHE)
            endif
            WNT_AMT = CHK_RND(WSA_AMT*WSA_RATE)
            WNT_PRE = CHK_RND(WSA_PRE*WSA_RATE)
            WNT_TAX = CHK_RND(WSA_TAX*WSA_RATE)
            WNT_OTHE = CHK_RND(WSA_OTHE*WSA_RATE)
            dimension DBF_ARY[ 2], TAG_ARY[ 2], ALIAS_ARY[ 2], ANO_ARY[ 2]
            = SET_DBF(2,DBF_SA+'rosa09','rosa09_1','sa09',0)
            = SET_DBF(1,DBF_FI+'roov01','roov01_1','ov01',0)
            do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
            if ERR_USE
               close DATABASES
               return
            endif
            TEX_AMT = 0
            select SA09
            seek TSA_TYPE+WSA_NO
            do WHILE  .not. EOF() .and. TSA_TYPE+WSA_NO=SA_TYPE+SA_NO
               if IV_YN='Y'
                  TEX_AMT = TEX_AMT+CHK_RND(EX_AMT*WSA_RATE)
               endif
               select SA09
               skip
            enddo
            use IN SA09
            select OV01
            seek '1'+WSA_IVNO1
            FLG_IV = .F.
            FLG_AD = .F.
            if EOF()
               WIV_AMT = WNT_AMT-WNT_PRE+TEX_AMT
               FLG_IV = .T.
               FLG_AD = .T.
            else
               if IV_SURE#'Y'
                  WIV_DATE = IV_DATE
                  if IV_SORT=WIV_SORT
                     WIV_AMT = WNT_AMT-WNT_PRE+TEX_AMT
                  else
                     WIV_AMT = WNT_AMT-WNT_PRE+TEX_AMT
                  endif
                  FLG_IV = .T.
               else
                  FLG_IV = .F.
               endif
            endif
            if FLG_IV
               @ 21, 3 SAY '發票金額:           發票稅額:           發票日期:                         ' COLOR (CO_FORM)
               do CHK_GETN WITH 21, 12, WIV_AMT, '99999999', '0,'
               if &rd_esc .or. &rd_up
                  @ 21, 3 SAY '銷貨:            沖預收款:            稅額:            其它費用:          ' COLOR (CO_FORM)
                  @ 21, 8 SAY WSA_AMT PICTURE '99999999.99'
                  @ 21, 29 SAY WSA_PRE PICTURE '99999999.99'
                  @ 21, 46 SAY WSA_TAX PICTURE '99999999.99'
                  @ 21, 67 SAY WSA_OTHE PICTURE '9999999.99'
                  use IN OV01
                  loop
               endif
               if WSA_TAXID='3'
                  WIV_TAX = ROUND(WIV_AMT*TA_TAX,0)
               else
                  WIV_TAX = 0
               endif
               do CHK_PCOD WITH P_COD
            else
               do CHK_PCOD WITH P_COD
            endif
            select OV01
            use
         else
            do CHK_PCOD WITH P_COD
         endif
      case R_COD=10
         if FLG_IV
            if TIV_TAXID='1'
               WIV_TAX = ROUND(WIV_AMT*TA_TAX,0)
            endif
            do CHK_GETN WITH 21, 32, WIV_TAX, '99999999', '0,'
         else
            do CHK_PCOD WITH P_COD
         endif
      case R_COD=11
         if FLG_IV
            if WIV_DATE=SPACE(8)
               WIV_DATE = YMD
            endif
            do CHK_GETD WITH 21, 52, WIV_DATE, .T., R_COD, .F.
            @ 21, 3 SAY '銷貨:            沖預收款:            稅額:            其它費用:          ' COLOR (CO_FORM)
            @ 21, 8 SAY WSA_AMT PICTURE '99999999.99'
            @ 21, 29 SAY WSA_PRE PICTURE '99999999.99'
            @ 21, 46 SAY WSA_TAX PICTURE '99999999.99'
            @ 21, 67 SAY WSA_OTHE PICTURE '9999999.99'
         else
            do CHK_PCOD WITH P_COD
         endif
      case R_COD=12 .or. R_COD=-1
         exit
   endcase
enddo
if WSA_TAXID#FSA_TAXID
   T_AMT = 0
   select SA01
   seek WSA_NO
   do WHILE  .not. EOF() .and. WSA_NO=SA_NO
      if SA_CH#'N'
         if A.SA_SIGN#SPACE(8) .and. A.SA_SIGN#'  /  /  '
            W_QTY = SA_ACQTY
         else
            W_QTY = SA_QTY
         endif
         WSA_SEQ = SA_SEQ
         if WOD_ID=IE_ODID
            T_AMT = T_AMT+CHK_RND(SA_PRICE*W_QTY)
         else
            T_AMT = T_AMT+ROUND(SA_PRICE*W_QTY,2)
         endif
         select SA05
         seek WSA_NO+WSA_SEQ
         do WHILE  .not. EOF() .and. SA_NO+SA_SEQ=WSA_NO+WSA_SEQ
            if WOD_ID=IE_ODID
               T_AMT = T_AMT+CHK_RND(SA_PRICE*SA_QTY)
            else
               T_AMT = T_AMT+ROUND(SA_PRICE*SA_QTY,2)
            endif
            skip
         enddo
         select SA06
         seek WSA_NO+WSA_SEQ
         do WHILE  .not. EOF() .and. SA_NO+SA_SEQ=WSA_NO+WSA_SEQ
            if WOD_ID=IE_ODID
               T_AMT = T_AMT+CHK_RND(SA_PRICE*SA_QTY)
            else
               T_AMT = T_AMT+ROUND(SA_PRICE*SA_QTY,2)
            endif
            skip
         enddo
      endif
      select SA01
      skip
   enddo
   select SA00
   if WSA_TAXID='4'
      if WOD_ID=IE_ODID
         WSA_AMT = CHK_RND(T_AMT/(1+TA_TAX))
      else
         WSA_AMT = ROUND(T_AMT*SA_RATE/(1+TA_TAX)/SA_RATE,2)
      endif
      WSA_TAX = T_AMT-WSA_AMT
   else
      WSA_AMT = T_AMT
      WSA_TAX = 0
      if WSA_TAXID='3'
         if WOD_ID=IE_ODID
            WSA_TAX = CHK_RND(WSA_AMT*TA_TAX)
         else
            WSA_TAX = ROUND(WSA_AMT*SA_RATE*TA_TAX/SA_RATE,2)
         endif
      endif
   endif
   select 1
   do WHILE _RLOCK(30)
   enddo
   replace SA_AMT WITH WSA_AMT
   replace SA_TAX WITH WSA_TAX
   unlock
endif
select SA00
do WHILE _RLOCK(30)
enddo
replace SA_IVNO WITH WSA_IVNO
replace SA_IVNO1 WITH WSA_IVNO1
replace IV_PAGE WITH WIV_PAGE
replace SA_TAX WITH WSA_TAX
replace IV_DATE WITH WIV_DATE
replace IV_AMT WITH WIV_AMT
replace IV_TAX WITH WIV_TAX
replace SA_TAXID WITH WSA_TAXID
replace OD_SATYP WITH WOD_SATYP
replace SA_VIA WITH WSA_VIA
replace BN_ID WITH WBN_ID
if SA_SURE#' ' .and. SA_IVNO1#SPACE(10)
   dimension DBF_ARY[ 2], TAG_ARY[ 2], ALIAS_ARY[ 2], ANO_ARY[ 2]
   = SET_DBF(2,DBF_FI+'roov01','roov01_1','ov01',0)
   = SET_DBF(1,DBF_FI+'roov02','roov02_1','ov02',0)
   do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
   if ERR_USE
      close DATABASES
      return
   endif
   = SEEK(WSA_BIL,'cu00')
   WCU_UNIT = CU00.CU_UNIT
   TIV_TAXID = SUBSTR(' 2311',VAL(WSA_TAXID)+1,1)
   select OV01
   seek '1'+WSA_IVNO1
   FLG_IV = .F.
   FLG_AD = .F.
   if EOF()
      FLG_IV = .T.
      FLG_AD = .T.
      append BLANK
   else
      select OV02
      seek '1'+WSA_IVNO1
      if EOF()
         FLG_AD = .T.
      endif
      select OV01
      if IV_SURE#'Y'
         FLG_IV = .T.
      else
         FLG_IV = .F.
      endif
   endif
   if FLG_IV
      do WHILE _RLOCK(30)
      enddo
      replace IV_NO WITH WSA_IVNO1
      replace IV_DATE WITH WIV_DATE
      replace IV_CODE WITH '1'
      replace IV_SALE WITH '1'
      replace IV_AREA WITH WOD_SATYP
      replace CU_NO1 WITH WSA_BIL
      replace CU_NO WITH WSA_BIL
      replace IV_TAXID WITH TIV_TAXID
      replace OD_ID WITH WOD_ID
      replace IV_RATE WITH WSA_RATE
      replace IV_AMT WITH WIV_AMT
      replace IV_TAX WITH WIV_TAX
      replace IV_PAGE WITH WIV_PAGE
      replace IV_SORT WITH WIV_SORT
      replace IV_UNIT WITH WCU_UNIT
      replace IV_OKNO WITH SUBSTR(WSA_VIA,1,19)+WBN_ID
      replace SA_CLOS WITH WIV_DATE
      unlock
      if  .not. FLG_AD
         select OV02
         seek '1'+WSA_IVNO1
         do WHILE  .not. EOF() .and. IV_CODE+IV_NO='1'+WSA_IVNO1
            do WHILE _RLOCK(30)
            enddo
            delete
            unlock
            skip
         enddo
      endif
      select 1
      set ORDER TO rosa00_5
      seek WSA_IVNO1
      do WHILE  .not. EOF() .and. SA_IVNO1=WSA_IVNO1
         TSA_NO = SA_NO
         select 2
         TIV_AMT = 0
         seek TSA_NO
         do WHILE  .not. EOF() .and. SA_NO=TSA_NO
            if WSA_TAXID='4'
               WIV_UP = SA_PRICE/(1+TA_TAX)
            else
               WIV_UP = SA_PRICE
            endif
            select OV02
            append BLANK
            do WHILE _RLOCK(30)
            enddo
            replace IV_NO WITH WSA_IVNO1
            replace IV_SORT WITH WIV_SORT
            replace IV_CODE WITH '1'
            replace IV_DATE WITH WIV_DATE
            replace CU_NO WITH WSA_BIL
            replace CU_NO1 WITH WSA_BIL
            replace EL_NO WITH B.EL_NO
            replace IV_QTY WITH B.SA_QTY
            replace IV_UP WITH WIV_UP
            replace IV_TOTAL WITH ROUND(B.SA_QTY*WIV_UP,2)
            unlock
            select SA05
            seek TSA_NO+B.SA_SEQ
            do WHILE  .not. EOF() .and. SA_NO+SA_SEQ=TSA_NO+B.SA_SEQ
               if SA_PRICE#0
                  if WSA_TAXID='4'
                     WIV_UP = SA_PRICE/(1+TA_TAX)
                  else
                     WIV_UP = SA_PRICE
                  endif
                  select OV02
                  append BLANK
                  do WHILE _RLOCK(30)
                  enddo
                  replace IV_NO WITH WSA_IVNO1
                  replace IV_SORT WITH WIV_SORT
                  replace IV_CODE WITH '1'
                  replace IV_DATE WITH WIV_DATE
                  replace CU_NO WITH WSA_BIL
                  replace CU_NO1 WITH WSA_BIL
                  replace EL_NO WITH SA05.EL_NO
                  replace IV_QTY WITH SA05.SA_QTY
                  replace IV_UP WITH WIV_UP
                  replace IV_TOTAL WITH ROUND(IV_QTY*WIV_UP,2)
                  replace IV_REMK WITH '附件'
                  unlock
               endif
               select SA05
               skip
            enddo
            select SA06
            seek TSA_NO+B.SA_SEQ
            do WHILE  .not. EOF() .and. SA_NO+SA_SEQ=TSA_NO+B.SA_SEQ
               if SA_PRICE#0
                  if WSA_TAXID='4'
                     WIV_UP = SA_PRICE/(1+TA_TAX)
                  else
                     WIV_UP = SA_PRICE
                  endif
                  select OV02
                  append BLANK
                  do WHILE _RLOCK(30)
                  enddo
                  replace IV_NO WITH WSA_IVNO1
                  replace IV_SORT WITH WIV_SORT
                  replace IV_CODE WITH '1'
                  replace IV_DATE WITH WIV_DATE
                  replace CU_NO WITH WSA_BIL
                  replace CU_NO1 WITH WSA_BIL
                  replace EL_NO WITH SA06.EL_NO
                  replace IV_QTY WITH SA06.SA_QTY
                  replace IV_UP WITH WIV_UP
                  replace IV_TOTAL WITH ROUND(IV_QTY*WIV_UP,2)
                  replace IV_REMK WITH '交貨項目'
                  unlock
               endif
               select SA06
               skip
            enddo
            select 2
            skip
         enddo
         select 1
         skip
      enddo
      select 1
      set ORDER TO 1
      seek WSA_NO
      select OV01
      unlock
   endif
   use IN OV01
   use IN OV02
endif
if A.SA_SURE#' '
   if IE_CLSNOTE='1'
      select AR00
      seek WSA_BIL+WSA_NO+' S1'
      WAR_DOCU = AR_DOCU
      do WHILE _RLOCK(30)
      enddo
      replace IV_SORT WITH WIV_SORT
      replace IV_PAGE WITH WIV_PAGE
      replace SA_IVNO WITH WSA_IVNO1
      replace SA_INVOICE WITH WSA_IVNO
      unlock
      select AR06
      seek WAR_DOCU
      do WHILE  .not. EOF() .and. AR_DOCU=WAR_DOCU
         if AC_NO=WAC_SLTX .and. AR_REMK=SPACE(LEN(AR_REMK))
            do WHILE _RLOCK(30)
            enddo
            replace AR_REMK WITH WSA_IVNO1
            replace AR_RELA WITH WSA_IVNO1
            unlock
            exit
         endif
         skip
      enddo
   else
      dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
      = SET_DBF(1,DBF_FI+'roariv','roariv_1','ariv',18)
      do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
      if ERR_USE
         close DATABASES
         return
      endif
      select ARIV
      seek SA00.CU_NO+SA00.SA_NO+' S1'
      do WHILE  .not. EOF() .and. CU_NO+AR_NO+AR_RENO=SA00.CU_NO+SA00.SA_NO+' S1'
         select AR00
         seek WSA_BIL+ARIV.IV_NO+'S6'
         WAR_DOCU = AR_DOCU
         do WHILE _RLOCK(30)
         enddo
         replace IV_SORT WITH ARIV.IV_SORT
         replace IV_PAGE WITH ARIV.IV_PAGE
         replace SA_IVNO WITH ARIV.IV_NO
         replace SA_INVOICE WITH WSA_IVNO
         unlock
         select AR06
         seek WAR_DOCU
         do WHILE  .not. EOF() .and. AR_DOCU=WAR_DOCU
            if AC_NO=WAC_SLTX .and. AR_REMK=SPACE(LEN(AR_REMK))
               do WHILE _RLOCK(30)
               enddo
               replace AR_REMK WITH WSA_IVNO1
               replace AR_RELA WITH WSA_IVNO1
               unlock
               exit
            endif
            skip
         enddo
         select ARIV
         skip IN ARIV
      enddo
      use IN ARIV
   endif
endif
dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
= SET_DBF(1,DBF_SC+'romt03','romt03_1','mt03',0)
do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
if ERR_USE
   close DATABASES
   return
endif
seek 'Q'+WSA_NO
if  .not. EOF()
   if  .not. _RLOCK(30)
      if MT_SURE='Y' .and.  .not. EMPTY(IE_BNYEAR)
         do CHK_MSG WITH '庫存資料已確認, 請調整保稅資料'
      endif
      replace BN_NO WITH SA00.SA_VIA
      unlock
   endif
endif
use
@ 9, 54 SAY '業務部門:           ' COLOR (CO_FORM)
return

procedure ROSA00_S
select SA00
store SA_NO TO WSA_NO
store CU_NO TO WCU_NO
store SA_ADID TO WSA_ADID
store SA_ADDR1 TO WSA_ADDR1
store SA_ID TO WSA_ID
store OD_ID TO WOD_ID
store SA_BIL TO WSA_BIL
store SA_SHIP TO WSA_SHIP
store IV_CUNO TO WIV_CUNO
select OD00
seek WOD_ID
WOD_NAME = OD_NAME
select CU02
seek SA00.CU_SALE
WCU_SNAM = CU_SNAM
select DP00
seek SA00.DP_NO
WDP_NAME = DP_NAME
select CU00
seek WIV_CUNO
WIV_CUNA = CU_NA
select CU00
seek WCU_NO
WCU_NA = CU_NA
seek WSA_BIL
WCU_BIL = CU_NA
select SA00
if SA_ACID='*'
   @ 04,22 say "作廢" color &co_sys
else
   if SA_SURE='Y'
      @ 4, 22 SAY ' 確認' COLOR GR+/N 
      FLG_TRANAP = SEEK(WSA_BIL+WSA_NO+' S1','ar00')
      = SEEK('S1','ar03')
      select AC17
      seek 'S1'+AR00.AR_DOCU
      if ( .not. EOF() .and. AR03.AR_ACTYP$'23') .or. (AR03.AR_ACTYP='1' .and. AR00.AR_SURE='Y')
         @ 5, 17 SAY '已轉立沖' COLOR R+/N 
         FLG_TRAN = .T.
      else
         if SA00.SA_SURE='Y' .and. SA00.SA_AMT>0 .and. FLG_TRANAP
            @ 5, 17 SAY '已轉應收' COLOR GR+/N 
         else
            @ 5, 17 SAY '        '
         endif
         if AR00.AR_SURE='Y'
            FLG_TRAN = .T.
         else
            FLG_TRAN = .F.
         endif
      endif
      select 1
   else
      @ 4, 22 SAY '     '
      @ 5, 17 SAY '        '
      FLG_TRAN = .F.
   endif
endif
@ 4, 12 SAY WSA_NO
@ 4, 36 SAY CU_NO+' '+WCU_NA
@ 4, 63 SAY SA_DATE
select AR08
seek WAR_RENO+WSA_ID
@ 5, 12 SAY SUBSTR(AR_DSP,1,4)
select SA00
@ 5, 36 SAY SA_BIL+' '+WCU_BIL
@ 5, 63 SAY SUBSTR('    　　內銷　　外銷　　合作外銷轉口貿易',VAL(OD_SATYP)*8+1,8)
@ 6, 12 SAY SUBSTR(WIV_CUNA,1,8)
@ 6, 22 SAY IV_PAGE PICTURE '9'
@ 6, 36 SAY SA_IVNO1
do CHK_STAX WITH 6, 63, SA_TAXID
select SA00
@ 7, 12 SAY SA_CONDI
@ 7, 36 SAY WOD_NAME
@ 7, 45 SAY SA_RATE PICTURE '###.####'
do CHK_SCH1 WITH 7, 63, SA_CHARG
if SA_CHARG1#' '
   do CHK_SCH2 WITH 7, 63, SA_CHARG1
endif
@ 7, 72 SAY SA_CHECK PICTURE '999'
@ 8, 12 SAY SA_IVNO
@ 8, 36 SAY SA_LCNO
@ 8, 63 SAY SA_CHDAT
@ 9, 12 SAY SA_LTDAT
set color to &co_form
@ 9, 22 SAY '報單:'
set color to &co_say
@ 9, 27 SAY BN_ID+' '+SA_VIA
@ 9, 63 SAY SUBSTR(WCU_SNAM,1,6)+' '+DP_NO
@ 10, 63 SAY SA_SHIPNO
do CASE
   case WSA_ADID='1'
      select CU00
      seek WSA_SHIP
      W_ADD1 = CU_ADD10
      W_ADD2 = CU_ADD11
   case WSA_ADID='2'
      select CU00
      seek WSA_SHIP
      W_ADD1 = CU_ADD20
      W_ADD2 = CU_ADD21
   case WSA_ADID='3'
      dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
      = SET_DBF(1,DBF_BA+'rocu01','rocu01_1','cu01',0)
      do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
      if ERR_USE
         close DATABASES
         return
      endif
      seek WSA_SHIP+SA00.SA_ADDR
      W_ADD1 = CU_ADD1
      W_ADD2 = CU_ADD2
      select CU01
      use
   otherwise
      W_ADD1 = WSA_ADDR1
      W_ADD2 = SPACE(40)
endcase
@ 10, 12 SAY W_ADD1
select SA00
if TC_PR='Y'
   if WOD_ID=IE_ODID
      @ 21, 8 SAY CHK_RND(SA_AMT) PICTURE '99999999.99'
      @ 21, 29 SAY CHK_RND(SA_PRE) PICTURE '99999999.99'
      @ 21, 46 SAY CHK_RND(SA_TAX) PICTURE '99999999.99'
      @ 21, 67 SAY CHK_RND(SA_OTHE) PICTURE '9999999.99'
   else
      @ 21, 8 SAY SA_AMT PICTURE '99999999.99'
      @ 21, 29 SAY SA_PRE PICTURE '99999999.99'
      @ 21, 46 SAY SA_TAX PICTURE '99999999.99'
      @ 21, 67 SAY SA_OTHE PICTURE '9999999.99'
   endif
endif
WSA_NO = SA_NO
select SA01
if ARR(1)=0
   seek WSA_NO
   CNT = 1
endif
do WHILE  .not. EOF() .and. CNT<=TRX_LIM .and. SA_NO=WSA_NO
   MN = CNT
   WEL_NO = EL_NO
   select EL00
   seek WEL_NO
   if UPPER(SUBSTR(WEL_NO,1,3))='XYZ'
      W_DSP = SUBSTR(TRIM(EL_NAME1)+' '+SA01.SA_SIZE+SPACE(43),1,43)
   else
      W_DSP = SUBSTR(TRIM(EL_NAME1)+' '+EL_SIZE+SPACE(43),1,43)
   endif
   select 2
   @ DROW(MN), 6 SAY SA_SEQ
   @ DROW(MN), 10 SAY OD_NO
   if IE_ODEL
      @ DROW(MN), 16 SAY OD_ELNO
   else
      @ DROW(MN), 16 SAY WEL_NO
   endif
   @ DROW(MN), 32 SAY SA_UNIT
   do CASE
      case OD_PDID='O '
         @ DROW(MN), 37 SAY '訂單'
      case OD_PDID='S '
         @ DROW(MN), 37 SAY '樣品'
      case OD_PDID='C '
         @ DROW(MN), 37 SAY 'CKD '
      otherwise
         @ DROW(MN), 37 SAY OD_PDID+'  '
   endcase
   @ DROW(MN), 42 SAY SA_QTY PICTURE '9999999.9'
   if TC_PR='Y'
      @ DROW(MN), 52 SAY SA_PRICE PICTURE '9999999.9999'
   endif
   if TC_PR='Y'
      if A.OD_ID=IE_ODID
         @ DROW(MN), 65 SAY ROUND(SA_PRICE*SA_QTY,0) PICTURE '9999999999'
      else
         @ DROW(MN), 65 SAY ROUND(SA_PRICE*SA_QTY,2) PICTURE '9999999.99'
      endif
   else
      @ DROW(MN), 65 SAY SPACE(12)
   endif
   @ DROW(MN), 76 SAY SA_CH PICTURE 'Y'
   @ DROW(MN)+1, 6 SAY OD_PO_NO COLOR R+/N 
   if IE_ODEL
      @ DROW(MN)+1, 16 SAY EL_NO
      @ DROW(MN)+1, 32 SAY W_DSP
   else
      if UPPER(SUBSTR(WEL_NO,1,3))='XYZ'
         @ DROW(MN)+1, 16 SAY SUBSTR(EL00.EL_NAME1,1,20)+' '+SA_SIZE
      else
         @ DROW(MN)+1, 16 SAY SUBSTR(EL00.EL_NAME1,1,20)+' '+EL00.EL_SIZE
      endif
   endif
   ARR( CNT) = RECNO()
   WSA_SEQ = SA_SEQ
   VAR( 1) = SA_SEQ
   CNT = CNT+1
   skip 1
enddo
I = CNT
if I<=TRX_LIM
   @ TRX_BEG+CNT*2-1, 5 CLEAR TO TRX_BEG+TRX_LIM*2, 76
endif
do WHILE I<=TRX_LIM
   ARR( I) = 0
   I = I+1
enddo
if ARR(1)#0
   goto ARR(1)
endif
return

procedure ROSA00_A
parameter FUNC
FUNC = UPPER(FUNC)
TSA_NO = WSA_NO
do WHILE .T.
   MSG00 = ''
   MSG01 = ''
   @ 23, 0 CLEAR
   @ 23,(80-len(msg00))/2  say msg00 colo &co_key
   @ 24,(80-len(msg00))/2  say msg01 colo &co_key
   select 1
   SCOR = .F.
   if FUNC$'EA'
      store SPACE(LEN(SA_NO)) TO WSA_NO
      store SPACE(LEN(CU_NO)) TO WCU_NO, WCU_SALE, WDP_NO, WSA_BIL, WOD_NO, WSA_SHIP, WIV_CUNO
      store SPACE(LEN(CU_NO)) TO WSA_AGENT
      store '2' TO WSA_ADID
      store SPACE(LEN(SA_ADDR)) TO WSA_ADDR
      store SPACE(LEN(SA_ADDR1)) TO WSA_ADDR1
      store YMD TO WSA_DATE
      store SPACE(LEN(OD_ID)) TO WOD_ID, FOD_ID
      store 0.000 TO WSA_RATE, FSA_RATE
      store 0 TO WSA_AMT, WSA_PRE, WSA_TAX, WSA_OTHE, WIV_AMT
      store 0 TO WSA_COMM, WSA_CAMT, WSA_CHECK
      store '3' TO WSA_TAXID, WSA_CHARG
      store ' ' TO WSA_CHARG1, WSA_ADDR, WSA_SURE
      store '1' TO WOD_SATYP, WSA_ID
      store SPACE(LEN(SA_CHDAT)) TO WSA_CHDAT, WSA_LTDAT, WSA_SIGN
      store 0 TO WIV_PAGE
      store SPACE(LEN(SA_IVNO)) TO WSA_IVNO
      store SPACE(LEN(SA_IVNO1)) TO WSA_IVNO1
      store SPACE(LEN(SA_LCNO)) TO WSA_LCNO, FSA_LCNO
      store SPACE(LEN(BN_ID)) TO WBN_ID
      store SPACE(LEN(SA_VIA)) TO WSA_VIA
      store SPACE(LEN(SA_CONDI)) TO WSA_CONDI
      store SPACE(LEN(SA_SHIPNO)) TO WSA_SHIPNO
      @ 4, 12 CLEAR TO 10, 26
      @ 4, 36 CLEAR TO 10, 53
      @ 4, 63 CLEAR TO 10, 74
      @ 9, 32 SAY SPACE(20)
      @ 10, 12 SAY SPACE(40)
      @ 21, 8 SAY SPACE(11)
      @ 21, 29 SAY SPACE(11)
      @ 21, 46 SAY SPACE(11)
      @ 21, 67 SAY SPACE(10)
      set colo to &co_form
      @ 6, 1 SAY '│發票對象:            聯 發票號碼:                  課 稅 別:              │'
      @ 9, 1 SAY '│貨款期限:          報單:                           業務部門:              │'
      set colo to &co_say
      @ TRX_BEG+1, 6 CLEAR TO TRX_BEG+TRX_LIM*2, 76
      set color to &co_form
      @ 9, 22 SAY '報單:'
      set color to &co_say
      @ 21, 8 SAY WSA_AMT PICTURE '99999999.99'
      @ 21, 29 SAY WSA_PRE PICTURE '99999999.99'
      @ 21, 46 SAY WSA_TAX PICTURE '99999999.99'
      @ 21, 67 SAY WSA_OTHE PICTURE '9999999.99'
      FSA_ACAMT = 0
      CNT = 1
   else
      store SA_NO TO WSA_NO
      store CU_NO TO WCU_NO
      store CU_SALE TO WCU_SALE
      store SA_ADID TO WSA_ADID
      store SA_ADDR TO WSA_ADDR
      store SA_DATE TO WSA_DATE
      store OD_ID TO WOD_ID, FOD_ID
      store SA_RATE TO WSA_RATE, FSA_RATE, TSA_RATE
      store SA_AMT TO WSA_AMT, FSA_AMT
      store SA_PRE TO WSA_PRE, FSA_PRE
      store SA_TAX TO WSA_TAX, FSA_TAX
      store SA_OTHE TO WSA_OTHE, FSA_OTHE
      store SA_TAXID TO WSA_TAXID, FSA_TAXID
      store SA_SIGN TO WSA_SIGN
      store SA_CHARG TO WSA_CHARG, FSA_CHARG
      store SA_CHARG1 TO WSA_CHARG1
      store SA_CHDAT TO WSA_CHDAT, FSA_CHDAT
      store SA_LTDAT TO WSA_LTDAT
      store SA_IVNO TO WSA_IVNO
      store SA_IVNO1 TO WSA_IVNO1
      store SA_LCNO TO WSA_LCNO, FSA_LCNO
      store OD_SATYP TO WOD_SATYP
      store SA_BIL TO WSA_BIL, FSA_BIL
      store IV_PAGE TO WIV_PAGE
      store SA_ID TO WSA_ID, FSA_ID
      store SA_ADDR1 TO WSA_ADDR1
      store SA_VIA TO WSA_VIA
      store BN_ID TO WBN_ID
      store SA_CONDI TO WSA_CONDI
      store DP_NO TO WDP_NO
      store SA_SURE TO WSA_SURE
      store SA_CHECK TO WSA_CHECK
      store IV_AMT TO WIV_AMT
      store SA_COMM TO WSA_COMM
      store SA_CAMT TO WSA_CAMT
      store SA_AGENT TO WSA_AGENT
      store SA_SHIPNO TO WSA_SHIPNO
      store SA_SHIP TO WSA_SHIP
      store IV_CUNO TO WIV_CUNO
      FSA_ACAMT = SA_AMT+SA_TAX+SA_OTHE-SA_PRE
      SV_REC = RECNO()
   endif
   P_COD = 1
   FLG_HD = .F.
   do WHILE .T.
      R_COD = P_COD
      select 1
      do CASE
         case R_COD=0
            select 1
            unlock
            return
         case R_COD=1
            if FUNC='E'
               @ 4, 12 GET WSA_NO PICTURE '!!!!!!!!!'
               read
               @ 4, 12 SAY WSA_NO PICTURE '!!!!!!!!!'
               do CHK_PCOD WITH P_COD
               if &rd_up .or. &rd_esc
                  loop
               endif
               if WSA_NO=SPACE(LEN(WSA_NO))
                  do CHK_MSG WITH '單號不得空白'
                  P_COD = 1
                  loop
               endif
               select 1
               seek WSA_NO
               if  .not. EOF()
                  P_COD = 1
                  do CHK_MSG WITH '單號不得重覆'
                  loop
               endif
            else
               P_COD = P_COD+1
            endif
         case R_COD=2
            if FUNC$'EA'
               select CU00
               WINF = 'F'
               TITAL = '客戶代號 客戶簡稱'
               TITAL1 = '======== ========'
               do CHK_WIN WITH 25, 'cu_no', 'space(03)+cu_na', 4, 36, WINF, WCU_NO
               if WINF='M'
                  P_COD = 0
                  loop
               endif
               R_FLG = .F.
               do CHK_WINF WITH P_COD, WINF, .F., R_FLG
               if R_FLG
                  seek WCU_NO
                  @ 4, 36 SAY CU_NO+' '+CU_NA
                  loop
               endif
               @ 4, 36 SAY CU_NO+' '+CU_NA
               TCU_NO = CU_NO
               WCU_DATE = CU_DATE
               TCU_DATE = VAL(WCU_DATE)
               WSA_ADID = CU_POAR
               WCU_NO = CU_NO
               WSA_BIL = CU_NO
               WSA_CHARG = CU_CHARG
               WSA_CHECK = CU_CHECK
               WSA_ADID = CU_POAR
               WCU_AGENT = CU_NO
               WCU_SALE = CU_SALE
               WOD_ID = OD_ID
               select OD00
               seek WOD_ID
               WSA_RATE = OD_RATE
               select CU00
            else
               select CU00
               seek WCU_NO
               WCU_NO = CU_NO
               WCU_DATE = CU_DATE
               TCU_DATE = VAL(WCU_DATE)
               P_COD = P_COD+1
            endif
         case R_COD=3
            P_COD = P_COD+1
         case R_COD=4
            FLG_HD = .F.
            if FUNC$'EA' .and. IE_SAINP='1'
               select OD01
               set ORDER TO rood01_3
               set RELATION TO OD_SERNO INTO OD02
               TITAL = '批 號 料  品  編  號  客戶訂單號碼   預定交期 幣別 確認 訂單餘量'
               TITAL1 = '===== =============== ============== ======== ==== ==== ========'
               WINF = 'F'
               do CHK_WINZ WITH LEN(TITAL)+2, 'od_no', "el_no+' '+od_po_no+' '+od_redat+' '+od_id+'   '               +od02->od_sure+'   '+str(od_qty-od_dlqty-od_que+od_bkqty,8,1)", 14, 10, WINF, WOD_NO, 'cu_no,wcu_no'
               @ 14, 10 SAY OD_NO
               do CHK_PCOD WITH P_COD
               if WINF$'E'
                  P_COD = 0
                  @ 14, 10 SAY SPACE(5)
                  set RELATION TO
                  set ORDER TO rood01_1 IN OD01
                  loop
               endif
               if WINF$'RU'
                  R_COD = 2
                  set RELATION TO
                  set ORDER TO rood01_1 IN OD01
                  loop
               endif
               if WINF$'SMN'
                  FLG_HD = .T.
                  WOD_NO = SPACE(5)
                  @ 14, 10 SAY SPACE(5)
               else
                  select OD01
                  if OD_QTY-OD_DLQTY-OD_QUE+OD_BKQTY<=0
                     do CHK_MSG WITH '此訂單已無待出貨量!!'
                     P_COD = R_COD
                     set RELATION TO
                     set ORDER TO rood01_1 IN OD01
                     loop
                  endif
                  WOD_NO = OD_NO
                  WOD_SERNO = OD_SERNO
                  select OD02
                  seek WOD_SERNO
                  if OD_SURE#'Y'
                     do CHK_MSG WITH '此訂單未經確認不得申請出貨!!'
                     P_COD = R_COD
                     set RELATION TO
                     set ORDER TO rood01_1 IN OD01
                     loop
                  endif
                  if OD_CHARG1='5' .and. EMPTY(OD_LC_NO) .and. IE_LCYN='Y'
                     do CHK_MSG WITH '此訂單未收到客戶 L/C 不可出貨!!'
                     P_COD = R_COD
                     set RELATION TO
                     set ORDER TO rood01_1 IN OD01
                     loop
                  endif
                  @ 14, 10 SAY WOD_NO
                  WCU_NO = CU_NO
                  WSA_ADID = OD_ADID
                  WSA_ADDR = OD_ADDR
                  WSA_ADDR1 = OD_ADDR1
                  WOD_ID = OD_ID
                  WSA_RATE = OD_RATE
                  WSA_TAXID = OD_TAXID
                  WSA_CHARG = OD_CHARG
                  WSA_CHARG1 = OD_CHARG1
                  WOD_SATYP = OD_SATYP
                  WSA_BIL = OD_BIL
                  WSA_FRG = OD_FRG
                  WCU_SALE = CU_SALE
                  WSA_CONDI = OD_CONDI
                  WDP_NO = DP_NO
                  WCU_AGENT = OD_AGENT
                  WSA_LCNO = OD_LC_NO
                  WSA_CHECK = OD_CHECK
                  WSA_COMM = OD_COMM
                  WSA_AGENT = OD_AGENT
                  WSA_SHIP = SA_SHIP
               endif
               select OD01
               set RELATION TO
               set ORDER TO rood01_1 IN OD01
            else
               P_COD = P_COD+1
            endif
            if IE_SAINP='2' .and. FUNC$'AE'
               FLG_HD = .T.
            endif
         case R_COD=5
            ERR_FLG = ' '
            do CHK_GETD WITH 4, 63, WSA_DATE, .F., R_COD, ERR_FLG
         case R_COD=6
            @ 5, 12 SAY SPACE(4)
            select AR08
            WINF = 'F'
            TITAL = '識別碼 說      明 借方科目代號 貸方科目代號'
            TITAL1 = '====== ========== ============ ============'
            do CHK_WINX WITH LEN(TITAL1)+2, 'ar_reid', "+space(5)+ar_dsp+' '+ac_no1+'    '+ac_no2", 5, 12, WINF, WSA_ID, 'ar_reno,war_reno'
            R_FLG = .F.
            do CHK_WINF WITH P_COD, WINF, .F., R_FLG
            if R_FLG
               seek WAR_RENO+WSA_ID
               @ 5, 12 SAY SUBSTR(AR_DSP,1,4)
               loop
            endif
            if AR_REID='3'
               do CHK_MSG WITH '借貨請由庫存系統之借調出庫處理!!'
               P_COD = R_COD
               loop
            endif
            @ 5, 12 SAY SUBSTR(AR_DSP,1,4)
            WSA_ID = AR_REID
            WAC_NO1 = AC_NO1
            WAC_NO2 = AC_NO2
         case R_COD=7
            select CU00
            WINF = 'F'
            TITAL = '客戶代號 客戶簡稱'
            TITAL1 = '======== ========'
            do CHK_WIN WITH 25, 'cu_no', 'space(03)+cu_na', 5, 36, WINF, WSA_BIL
            R_FLG = .F.
            do CHK_WINF WITH P_COD, WINF, .F., R_FLG
            if R_FLG
               seek WSA_BIL
               @ 5, 36 SAY CU_NO+' '+CU_NA
               loop
            endif
            @ 5, 36 SAY CU_NO+' '+CU_NA
            WSA_BIL = CU_NO
            if FUNC$'EA'
               WIV_CUNO = CU_NO
            endif
            WCU_UNIT = CU_UNIT
            if FLG_HD
               WCU_DATE = CU_DATE
               TCU_DATE = VAL(CU_DATE)
               if FUNC$'AE'
                  WSA_CHECK = CU_CHECK
               endif
               WSA_TAXID = CU_TAXID
               WSA_CHARG = CU_CHARG
               WSA_CHARG1 = CU_CHARG1
               WSA_CONDI = CU_CONDI
            else
            endif
         case R_COD=8
            @ 5, 63 SAY SPACE(8)
            do CHK_MSG WITH '內外銷別:(1) 內 銷 (2) 外 銷 (3) 合作外銷 (4)轉口貿易 ', 's', '', 0, 0, 0
            do CHK_GETC WITH 5, 64, WOD_SATYP, '9', '(1234)'
            deactivate WINDOW WIN_MSG
            release WINDOW WIN_MSG
            @ 5, 63 SAY SUBSTR('    　　內銷　　外銷　　合作外銷轉口貿易',VAL(WOD_SATYP)*8+1,8)
            if FUNC$'AE'
               if WOD_SATYP='1' .and. WSA_TAXID='3'
                  WIV_PAGE = 3
               else
                  WIV_PAGE = 2
               endif
            endif
         case R_COD=9
            select CU00
            WINF = 'F'
            TITAL = '客戶代號 客戶簡稱'
            TITAL1 = '======== ========'
            do CHK_WIN WITH 25, 'cu_no', 'space(03)+cu_na', 6, 12, WINF, WIV_CUNO
            R_FLG = .F.
            do CHK_WINF WITH P_COD, WINF, .F., R_FLG
            if R_FLG
               seek WSA_BIL
               @ 6, 12 SAY SUBSTR(CU_NA,1,8)
               loop
            endif
            @ 6, 12 SAY SUBSTR(CU_NA,1,8)
            WIV_CUNO = CU_NO
         case R_COD=10
            TIV_PAGE = STR(WIV_PAGE,1)
            if WIV_PAGE=0
               TIV_PAGE = ' '
            endif
            do CHK_GETC WITH 6, 22, TIV_PAGE, '9', '( 023)'
            WIV_PAGE = VAL(TIV_PAGE)
         case R_COD=11
            dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
            = SET_DBF(1,DBF_FI+'roov01','roov01_1','ov01',0)
            do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
            if ERR_USE
               close DATABASES
               return
            endif
            FLG_SS = .T.
            select OV01
            seek '1'+WSA_IVNO1
            FLG_IV = .F.
            FLG_AD = .F.
            if  .not. EOF() .and. IV_SURE='Y'
               FLG_SS = .F.
            else
               FLG_SS = .T.
            endif
            use IN OV01
            if FLG_SS
               @ 6, 36 GET WSA_IVNO1 PICTURE '@! AA99999999'
               read
               @ 6, 36 SAY WSA_IVNO1
               do CHK_PCOD WITH P_COD
               if &rd_up .or. &rd_esc
                  loop
               endif
               if IE_COUNTRY='2'
                  if WSA_IVNO1#SPACE(10)
                     if LEN(LTRIM(RTRIM(WSA_IVNO1)))#LEN(WSA_IVNO1)
                        do CHK_MSG WITH '單號未打滿'
                        P_COD = R_COD
                        loop
                     endif
                     dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
                     = SET_DBF(1,DBF_FI+'roov05','roov05_2','ov05',0)
                     do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
                     if ERR_USE
                        close DATABASES
                        return
                     endif
                     select OV05
                     FLG = .T.
                     W_YM = CHK_GYMD(WSA_DATE,'YM',2)
                     if IE_IVAUTO='Y'
                        if W_YM>=IE_IVYM
                           T_COD = '2'
                        else
                           T_COD = '1'
                        endif
                     else
                        T_COD = '1'
                     endif
                     PAG = STR(WIV_PAGE,1)
                     seek W_YM+PAG+T_COD
                     if  .not. EOF() .and. SUBSTR(IV_NA,1,2)=SUBSTR(WSA_IVNO1,1,2)
                        FLG = .F.
                     else
                        set ORDER TO roov05_4
                        seek W_YM+PAG+T_COD
                        if  .not. EOF() .and. SUBSTR(IV_NA,1,2)=SUBSTR(WSA_IVNO1,1,2)
                           FLG = .F.
                        else
                        endif
                     endif
                     set ORDER TO roov05_2
                     select OV05
                     use
                     if FLG
                        if  .not. MESG_YN('本年月無此字軌, 是否存入?(Y/N)')
                           P_COD = R_COD
                           loop
                        endif
                     endif
                  endif
               endif
            else
               if &rd_up
                  P_COD = P_COD-1
               else
                  P_COD = P_COD+1
               endif
            endif
         case R_COD=12
            do CHK_GTAX WITH 6, 63, WSA_TAXID, .T.
            do CHK_STAX WITH 6, 63, WSA_TAXID
         case R_COD=13
            if WSA_CONDI=SPACE(LEN(WSA_CONDI))
               dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
               = SET_DBF(1,DBF_BA+'ropb11','ropb11_1','pb11',0)
               do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
               if ERR_USE
                  close DATABASES
                  return
               endif
               @ 7, 12 SAY SPACE(12)
               WTR_NO = SPACE(5)
               WINF = .F.
               select PB11
               TITAL = '代 號 名           稱'
               TITAL1 = '===== ==============='
               do CHK_WIN WITH 25, 'tr_no', 'tr_name', 7, 12, WINF, WTR_NO
               R_FLG = .F.
               do CHK_WINF WITH P_COD, WINF, .T., R_FLG
               if R_FLG
                  seek WTR_NO
                  @ 7, 12 SAY TR_NAME
                  select PB11
                  use
                  loop
               endif
               if WINF#'S'
                  WSA_CONDI = SUBSTR(TR_NAME+SPACE(20),1,LEN(WSA_CONDI))
               else
                  @ 7, 12 SAY SPACE(12)
               endif
               select PB11
               use
            else
               do CHK_PCOD WITH P_COD
            endif
         case R_COD=14
            do CHK_GET WITH 7, 12, WSA_CONDI
         case R_COD=15
            select OD00
            WINF = 'F'
            TITAL = '幣別代號 幣    別 英文說明'
            TITAL1 = '======== ======== ========'
            do CHK_WIN WITH 27, 'od_id', "+space(5)+od_name+' '+od_name1", 7, 36, WINF, WOD_ID
            R_FLG = .F.
            do CHK_WINF WITH P_COD, WINF, .F., R_FLG
            if R_FLG
               seek WOD_ID
               @ 7, 36 SAY OD_NAME
               loop
            endif
            @ 7, 36 SAY OD_NAME
            WOD_ID = OD_ID
            if FUNC$'AE' .or. FUNC$'B'
               dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
               = SET_DBF(1,DBF_SA+'rood20','rood20_1','od20',0)
               do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
               if ERR_USE
                  close DATABASES
                  return
               endif
               if WOD_SATYP='2'
                  TR_DATE = WSA_DATE
                  set NEAR ON
                  select OD20
                  seek WOD_ID+TR_DATE
                  if TR_DATE#OD_YMD .and.  .not. EOF()
                     skip -1
                  endif
                  if WOD_ID#OD_ID
                     do CHK_MSG WITH '匯率資料無小於銷貨日的資料!!'
                     select OD00
                     seek WOD_ID
                  endif
                  set NEAR OFF
               else
                  TR_DATE = WSA_DATE
                  select OD20
                  seek WOD_ID+TR_DATE
                  if EOF()
                     select OD00
                     seek WOD_ID
                  endif
               endif
               if WOD_SATYP='1'
                  WSA_RATE = OD_RATE
               else
                  WSA_RATE = OD_RATE2
               endif
               select OD20
               use
            endif
            if WSA_RATE=0
               WSA_RATE = 1
            endif
         case R_COD=16
            do CHK_GETN WITH 7, 45, WSA_RATE, '###.####', '0.0001,'
         case R_COD=17
            @ 7, 63 SAY SPACE(8)
            do CHK_GCH1 WITH 7, 63, WSA_CHARG, .T.
            do CHK_SCH1 WITH 7, 63, WSA_CHARG
            if AT(WSA_CHARG,'125')#0
               WSA_CHDAT = WSA_DATE
            endif
            if WSA_CHARG='2'
               P_COD = 18
            else
               WSA_CHARG1 = ' '
               P_COD = 19
            endif
         case R_COD=18
            if WSA_CHARG='2'
               if WSA_CHARG1=' '
                  WSA_CHARG1 = '5'
               endif
               @ 7, 63 SAY '        '
               do CHK_GCH2 WITH 7, 63, WSA_CHARG1, .T.
               do CHK_SCH2 WITH 7, 63, WSA_CHARG1
            else
               WSA_CHARG1 = ' '
               if &rd_up
                  P_COD = P_COD-1
               else
                  P_COD = P_COD+1
               endif
            endif
         case R_COD=19
            do CHK_GETN WITH 7, 72, WSA_CHECK, '999', ''
         case R_COD=20
            do CHK_GET WITH 8, 12, WSA_IVNO
         case R_COD=21
            if WSA_CHARG1='5'
               select SA29
               set ORDER TO rosa29_2
               TITAL = '信 用 狀 號 碼   開狀銀行 L/C 期限 最後船期 幣別'
               TITAL1 = '================ ======== ======== ======== ===='
               WINF = 'F'
               do CHK_WINX WITH LEN(TITAL1)+2, 'sa_lcno', "sa_bano+' '+sa_ltd+' '+sa_ship+' '+od_id", 8, 36, WINF, WSA_LCNO, 'cu_no,wcu_no'
               do CHK_PCOD WITH P_COD
               if WINF$'E'
                  P_COD = 0
                  loop
               endif
               if WINF$'U'
                  @ 8, 36 SAY WSA_LCNO
                  P_COD = 19
                  loop
               endif
               if WINF$'SMN'
                  WSA_LCNO = SPACE(16)
                  @ 8, 36 SAY WSA_LCNO
               else
                  WSA_LCNO = SA_LCNO
                  if SA_SHIP<=WSA_DATE
                     do CHK_MSG WITH '此 L/C 最後船期小於銷貨日期!!'
                     P_COD = R_COD
                     loop
                  endif
                  if WOD_ID#OD_ID
                     do CHK_MSG WITH '幣別不符!!'
                     P_COD = R_COD
                     loop
                  endif
               endif
               @ 8, 36 SAY WSA_LCNO
            else
               WSA_LCNO = SPACE(16)
               @ 8, 36 SAY SPACE(16)
               if &rd_up
                  P_COD = P_COD-1
               else
                  P_COD = P_COD+1
               endif
            endif
         case R_COD=22
            if ' '$WSA_CHDAT .and. FUNC$'AE'
               WSA_CHDAT = CHK_CLSD('R',WSA_DATE,WSA_CHARG,'1',WCU_DATE,IE_DATID)
            endif
            do CHK_GETD WITH 8, 63, WSA_CHDAT, .T., R_COD, .F.
            if ' '$WSA_CHDAT
               WSA_CHDAT = SPACE(8)
            endif
            if WSA_CHDAT#SPACE(8)
               if WSA_CHDAT<WSA_DATE
                  do CHK_MSG WITH '結帳日期不得小於銷貨日期'
                  loop
               endif
            endif
         case R_COD=23
            if ' '$WSA_LTDAT
               WSA_LTDAT = CHK_DUED('R',WSA_CHDAT,WSA_CHECK,IE_DATID)
            endif
            do CHK_GETD WITH 9, 12, WSA_LTDAT, .T., R_COD, .F.
            if ' '$WSA_LTDAT
               WSA_LTDAT = SPACE(8)
            endif
         case R_COD=24
            dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
            = SET_DBF(1,DBF_SA+'robnid','robnid_1','bnid',20)
            do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
            if ERR_USE
               ERR_USE = .F.
               close DATABASES
               return
            endif
            WINF = 'F'
            TITAL = '報單代號 名                                   稱'
            TITAL1 = '======== ======================================='
            do CHK_WIN WITH LEN(TITAL)+2, 'bn_id ', '+space(6)+bn_idna', 9, 27, WINF, WBN_ID
            R_FLG = .F.
            do CHK_WINF WITH P_COD, WINF, .T., R_FLG
            if R_FLG
               @ 9, 27 SAY WBN_ID
               use
               loop
            endif
            if WINF#'S'
               WBN_ID = BN_ID
            endif
            @ 9, 27 SAY WBN_ID
            use
         case R_COD=25
            if  .not. EMPTY(WBN_ID)
               do CHK_GETC WITH 9, 30, WSA_VIA, 'xx/xx/xx/xxxx/xxxxxxxx', ''
               if &rd_up .or. &rd_esc
                  loop
               endif
               if WSA_VIA='  /  /  /    /     '
                  WBN_ID = SPACE(2)
                  WSA_VIA = SPACE(LEN(WSA_VIA))
               endif
            else
               WSA_VIA = SPACE(LEN(WSA_VIA))
               @ 9, 30 SAY WSA_VIA
               do CHK_PCOD WITH P_COD
            endif
         case R_COD=26
            select CU02
            WINF = 'F'
            TITAL = '經辦代號 名      稱'
            TITAL1 = '======== =========='
            do CHK_WIN WITH 25, 'cu_sale', '+space(3)+cu_snam', 9, 63, WINF, WCU_SALE
            R_FLG = .F.
            do CHK_WINF WITH P_COD, WINF, .F., R_FLG
            if R_FLG
               @ 9, 63 SAY WCU_SALE
               loop
            endif
            if WINF#'S'
               WCU_SALE = CU_SALE
               if WDP_NO=SPACE(5)
                  WDP_NO = DP_NO
               endif
               @ 9, 63 SAY WCU_SALE+' '
            else
               @ 9, 63 SAY SPACE(6)
            endif
         case R_COD=27
            select DP00
            TITAL = '部門代號 名      稱'
            TITAL1 = '======== =========='
            WINF = 'F'
            do CHK_WIN WITH 25, 'dp_no', 'space(03)+dp_name', 9, 70, WINF, WDP_NO
            R_FLG = .F.
            do CHK_WINF WITH P_COD, WINF, .F., R_FLG
            if R_FLG
               seek WDP_NO
               @ 9, 70 SAY DP_NO
               loop
            endif
            if WINF#'S'
               WDP_NO = DP_NO
            else
            endif
            @ 9, 70 SAY WDP_NO
         case R_COD=28
            set COLOR TO (CO_FORM)
            @ 10, 3 SAY 'SHIP TO :'
            set COLOR TO (CO_SAY)
            @ 10, 12 SAY SPACE(40)
            if WSA_SHIP=SPACE(LEN(WSA_SHIP))
               WSA_SHIP = WCU_NO
            endif
            select CU00
            WINF = 'F'
            TITAL = '客戶代號 客戶簡稱'
            TITAL1 = '======== ========'
            do CHK_WIN WITH 25, 'cu_no', 'space(03)+cu_na', 10, 12, WINF, WSA_SHIP
            R_FLG = .F.
            do CHK_WINF WITH P_COD, WINF, .F., R_FLG
            if R_FLG
               set COLOR TO (CO_FORM)
               @ 10, 3 SAY '送貨地點:'
               set COLOR TO (CO_SAY)
               do CASE
                  case WSA_ADID='1'
                     select CU00
                     seek WSA_SHIP
                     W_ADD1 = CU_ADD10
                     W_ADD2 = CU_ADD11
                  case WSA_ADID='2'
                     select CU00
                     seek WSA_SHIP
                     W_ADD1 = CU_ADD20
                     W_ADD2 = CU_ADD21
                  case WSA_ADID='3'
                     dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
                     = SET_DBF(1,DBF_BA+'rocu01','rocu01_1','cu01',0)
                     do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
                     if ERR_USE
                        close DATABASES
                        return
                     endif
                     seek WSA_SHIP+WSA_ADDR
                     W_ADD1 = CU_ADD1
                     W_ADD2 = CU_ADD2
                     select CU01
                     use
                  otherwise
                     W_ADD1 = WSA_ADDR1
                     W_ADD2 = SPACE(40)
               endcase
               select 1
               @ 10, 12 SAY W_ADD1
               loop
            endif
            WSA_SHIP = CU_NO
         case R_COD=29
            set COLOR TO (CO_FORM)
            @ 10, 3 SAY '送貨地點:'
            set COLOR TO (CO_SAY)
            @ 10, 12 SAY SPACE(40)
            @ 10, 13 SAY '(1.公司 2.工廠 3.其它)' COLOR (CO_FORM)
            do CHK_GETC WITH 10, 12, WSA_ADID, '9', '(123 ) '
            if &rd_up
               do CASE
                  case WSA_ADID='1'
                     select CU00
                     seek WSA_SHIP
                     W_ADD1 = CU_ADD10
                     W_ADD2 = CU_ADD11
                  case WSA_ADID='2'
                     select CU00
                     seek WSA_SHIP
                     W_ADD1 = CU_ADD20
                     W_ADD2 = CU_ADD21
                  case WSA_ADID='3'
                     dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
                     = SET_DBF(1,DBF_BA+'rocu01','rocu01_1','cu01',0)
                     do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
                     if ERR_USE
                        close DATABASES
                        return
                     endif
                     seek WSA_SHIP+WSA_ADDR
                     W_ADD1 = CU_ADD1
                     W_ADD2 = CU_ADD2
                     select CU01
                     use
                  otherwise
                     W_ADD1 = WSA_ADDR1
                     W_ADD2 = SPACE(40)
               endcase
               @ 10, 12 SAY W_ADD1
            endif
         case R_COD=30
            if WSA_ADID=' '
               @ 10, 12 SAY SPACE(40)
               do CHK_GET WITH 10, 12, WSA_ADDR1
            else
               if WSA_ADID='3'
                  @ 10, 12 SAY SPACE(40)
                  dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
                  = SET_DBF(1,DBF_BA+'rocu01','rocu01_1','cu01',0)
                  do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
                  if ERR_USE
                     close DATABASES
                     return
                  endif
                  WINF = 'F'
                  TITAL = '編號 住                                    址'
                  TITAL1 = '==== ========================================'
                  do CHK_WINX WITH 55, 'cu_seq', 'space(02)+cu_add1', 10, 12, WINF, WSA_ADDR, 'cu_no,wsa_ship'
                  if WINF$'MN'
                     do CHK_MSG WITH '此客戶無其它地址!!'
                     select CU01
                     use
                     P_COD = P_COD-1
                     loop
                  endif
                  R_FLG = .F.
                  do CHK_WINF WITH P_COD, WINF, .F., R_FLG
                  if R_FLG
                     seek WSA_SHIP+WSA_ADDR
                     W_ADD1 = CU_ADD1
                     W_ADD2 = CU_ADD2
                     @ 10, 12 SAY WSA_ADDR
                     select CU01
                     use
                     loop
                  endif
                  WSA_ADDR = CU_SEQ
                  @ 10, 12 SAY WSA_ADDR
               else
                  do CHK_PCOD WITH P_COD
               endif
            endif
            do CASE
               case WSA_ADID='1'
                  select CU00
                  seek WSA_SHIP
                  W_ADD1 = CU_ADD10
                  W_ADD2 = CU_ADD11
               case WSA_ADID='2'
                  select CU00
                  seek WSA_SHIP
                  W_ADD1 = CU_ADD20
                  W_ADD2 = CU_ADD21
               case WSA_ADID='3'
                  select CU01
                  seek WSA_SHIP+WSA_ADDR
                  W_ADD1 = CU_ADD1
                  W_ADD2 = CU_ADD2
                  use
               otherwise
                  W_ADD1 = WSA_ADDR1
                  W_ADD2 = SPACE(40)
            endcase
            @ 10, 12 SAY W_ADD1
         case R_COD=31
            do CHK_GETC WITH 10, 63, WSA_SHIPNO, '@X', ' '
         case R_COD=-1 .or. R_COD=32
            if R_COD=-1
               select AR08
               seek WAR_RENO+WSA_ID
               WAC_NO1 = AC_NO1
               WAC_NO2 = AC_NO2
            endif
            select 1
            if FUNC='A'
               do WHILE .T.
                  do CHK_NOA WITH WSA_DATE, 'SA', 'A', WSA_NO
                  select 1
                  seek WSA_NO
                  if EOF()
                     exit
                  endif
               enddo
               @ 4, 12 SAY WSA_NO
               select 1
               append BLANK
            endif
            select 1
            if FUNC='E'
               seek WSA_NO
               if  .not. EOF()
                  P_COD = 1
                  do CHK_MSG WITH '單號不得重覆'
                  loop
               endif
               append BLANK
            endif
            if _RLOCK(30)
               return
            endif
            replace SA_NO WITH WSA_NO
            replace CU_NO WITH WCU_NO
            replace CU_SALE WITH WCU_SALE
            replace SA_ADID WITH WSA_ADID
            replace SA_ADDR WITH WSA_ADDR
            replace SA_DATE WITH WSA_DATE
            replace OD_ID WITH WOD_ID
            replace SA_RATE WITH WSA_RATE
            replace SA_AMT WITH WSA_AMT
            replace SA_PRE WITH WSA_PRE
            replace SA_TAX WITH WSA_TAX
            replace SA_TAXID WITH WSA_TAXID
            replace SA_OTHE WITH WSA_OTHE
            replace SA_CHARG WITH WSA_CHARG
            replace SA_CHARG1 WITH WSA_CHARG1
            replace SA_CHDAT WITH WSA_CHDAT
            replace SA_IVNO WITH WSA_IVNO
            replace SA_IVNO1 WITH WSA_IVNO1
            replace SA_LTDAT WITH WSA_LTDAT
            replace OD_SATYP WITH WOD_SATYP
            replace SA_BIL WITH WSA_BIL
            replace IV_PAGE WITH WIV_PAGE
            replace SA_ID WITH WSA_ID
            replace SA_LCNO WITH WSA_LCNO
            replace SA_ADDR1 WITH WSA_ADDR1
            replace SA_CONDI WITH WSA_CONDI
            replace DP_NO WITH WDP_NO
            replace SA_COMM WITH WSA_COMM
            replace SA_AGENT WITH WSA_AGENT
            replace SA_SHIPNO WITH WSA_SHIPNO
            replace SA_CHECK WITH WSA_CHECK
            replace SA_SHIP WITH WSA_SHIP
            replace SA_VIA WITH WSA_VIA
            replace BN_ID WITH WBN_ID
            replace IV_CUNO WITH WIV_CUNO
            if FUNC$'EA'
               FSA_BIL = WSA_BIL
               WSA_SEQ = SPACE(3)
               CNT = 1
               do ROSA00_D WITH 'A'
               select 2
               seek WSA_NO
               TEL_NO = EL_NO
               if EOF()
                  do CHK_NOD WITH WSA_DATE, 'SA', 'A', WSA_NO
                  select 1
                  do WHILE _RLOCK(30)
                  enddo
                  delete
                  unlock
                  if  .not. BOF()
                     skip -1
                  else
                     goto BOTTOM
                  endif
                  exit
               else
               endif
            endif
            if FUNC='B'
               select AR08
               seek WAR_RENO+FSA_ID
               FAC_NO1 = AC_NO1
               FAC_NO2 = AC_NO2
               FLG_NEW = .F.
               if FSA_TAXID#WSA_TAXID
                  FLG_NEW = .T.
                  T_AMT = 0
               endif
               select 2
               seek WSA_NO
               TEL_NO = EL_NO
               do WHILE  .not. EOF() .and. SA_NO=WSA_NO
                  if FLG_NEW
                     if WSA_SIGN#SPACE(8) .and. WSA_SIGN#'  /  /  '
                        W_QTY = SA_ACQTY
                     else
                        W_QTY = SA_QTY
                     endif
                     if SA_CH#'N'
                        WSA_SEQ = SA_SEQ
                        if WOD_ID=IE_ODID
                           T_AMT = T_AMT+CHK_RND(SA_PRICE*SA_QTY)
                        else
                           T_AMT = T_AMT+ROUND(SA_PRICE*SA_QTY,2)
                        endif
                        select SA05
                        seek WSA_NO+WSA_SEQ
                        do WHILE  .not. EOF() .and. SA_NO+SA_SEQ=WSA_NO+WSA_SEQ
                           if WOD_ID=IE_ODID
                              T_AMT = T_AMT+CHK_RND(SA_PRICE*SA_QTY)
                           else
                              T_AMT = T_AMT+ROUND(SA_PRICE*SA_QTY,2)
                           endif
                           skip
                        enddo
                        select SA06
                        seek WSA_NO+WSA_SEQ
                        do WHILE  .not. EOF() .and. SA_NO+SA_SEQ=WSA_NO+WSA_SEQ
                           if WOD_ID=IE_ODID
                              T_AMT = T_AMT+CHK_RND(SA_PRICE*SA_QTY)
                           else
                              T_AMT = T_AMT+ROUND(SA_PRICE*SA_QTY,2)
                           endif
                           skip
                        enddo
                     endif
                  endif
                  select 2
                  do WHILE _RLOCK(30)
                  enddo
                  replace CU_NO WITH WCU_NO
                  replace SA_DATE WITH WSA_DATE
                  replace OD_ID WITH WOD_ID
                  replace SA_CHARG WITH WSA_CHARG
                  replace SA_CHDAT WITH WSA_CHDAT
                  replace SA_BIL WITH WSA_BIL
                  replace SA_RATE WITH WSA_RATE
                  replace SA_ID WITH WSA_ID
                  replace SA_TAXID WITH WSA_TAXID
                  replace DP_NO WITH WDP_NO
                  replace CU_SALE WITH WCU_SALE
                  unlock
                  select 2
                  skip
               enddo
               select SA05
               seek WSA_NO
               do WHILE  .not. EOF() .and. SA_NO=WSA_NO
                  do WHILE _RLOCK(30)
                  enddo
                  replace SA_DATE WITH WSA_DATE
                  replace OD_ID WITH WOD_ID
                  replace SA_TAXID WITH WSA_TAXID
                  replace SA_RATE WITH WSA_RATE
                  replace SA_ID WITH WSA_ID
                  replace CU_NO WITH WCU_NO
                  replace DP_NO WITH WDP_NO
                  replace CU_SALE WITH WCU_SALE
                  unlock
                  select SA05
                  skip
               enddo
               select SA06
               seek WSA_NO
               do WHILE  .not. EOF() .and. SA_NO=WSA_NO
                  do WHILE _RLOCK(30)
                  enddo
                  replace SA_DATE WITH WSA_DATE
                  replace OD_ID WITH WOD_ID
                  replace SA_TAXID WITH WSA_TAXID
                  replace SA_RATE WITH WSA_RATE
                  replace SA_ID WITH WSA_ID
                  replace CU_NO WITH WCU_NO
                  replace DP_NO WITH WDP_NO
                  replace CU_SALE WITH WCU_SALE
                  unlock
                  select SA06
                  skip
               enddo
               if FLG_NEW
                  do CASE
                     case WSA_TAXID='4'
                        if WOD_ID=IE_ODID
                           T_AMT = CHK_RND(T_AMT)
                           WSA_AMT = CHK_RND(T_AMT/(1+TA_TAX))
                        else
                           WSA_AMT = ROUND(T_AMT*WSA_RATE/(1+TA_TAX)/WSA_RATE,2)
                        endif
                        if WSA_PRE>0 .and. WSA_PRE<WSA_AMT
                           if WOD_ID=IE_ODID
                              WSA_TAX = ROUND((WSA_AMT-WSA_PRE)*TA_TAX,0)
                           else
                              WSA_TAX = ROUND((WSA_AMT-WSA_PRE)*WSA_RATE*TA_TAX/WSA_RATE,2)
                           endif
                        else
                           WSA_TAX = T_AMT-WSA_AMT
                        endif
                     case WSA_TAXID='3'
                        WSA_AMT = T_AMT
                        if WSA_PRE>=WSA_AMT
                           if WOD_ID=IE_ODID
                              WSA_TAX = CHK_RND(WSA_AMT*TA_TAX)
                           else
                              WSA_TAX = ROUND(WSA_AMT*WSA_RATE*TA_TAX/WSA_RATE,2)
                           endif
                        else
                           if WOD_ID=IE_ODID
                              WSA_TAX = CHK_RND((WSA_AMT-WSA_PRE)*TA_TAX)
                           else
                              WSA_TAX = ROUND((WSA_AMT-WSA_PRE)*WSA_RATE*TA_TAX/WSA_RATE,2)
                           endif
                        endif
                     otherwise
                        WSA_AMT = T_AMT
                        WSA_TAX = 0
                  endcase
               endif
               if WOD_ID=IE_ODID
                  WSA_CAMT = CHK_RND(WSA_COMM*WSA_AMT*0.01)
               else
                  WSA_CAMT = ROUND(WSA_COMM*WSA_AMT*0.01,2)
               endif
               select 1
               replace SA_AMT WITH WSA_AMT
               replace SA_TAX WITH WSA_TAX
               replace SA_CAMT WITH WSA_CAMT
            endif
            WSA_OTHE = 0
            dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
            = SET_DBF(1,DBF_SA+'rosa09','rosa09_1','sa09',20)
            do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
            if ERR_USE
               close DATABASES
               return
            endif
            select SA09
            seek TSA_TYPE+WSA_NO
            do WHILE  .not. EOF() .and. SA_TYPE+SA_NO=TSA_TYPE+WSA_NO
               if EX_CHARG$'Y'
                  WSA_OTHE = WSA_OTHE+EX_AMT
               endif
               skip
            enddo
            select SA09
            use
            select 1
            replace SA_OTHE WITH WSA_OTHE
            if TC_PR='Y'
               do ROSA00_E
            endif
            select SA29
            set ORDER TO rosa29_1
            if FSA_LCNO#SPACE(LEN(WSA_LCNO))
               seek FSA_LCNO
               if  .not. EOF()
                  do WHILE _RLOCK(30)
                  enddo
                  replace SA_ACAMT WITH SA_ACAMT-FSA_ACAMT
                  unlock
               endif
            endif
            if WSA_LCNO#SPACE(LEN(WSA_LCNO))
               seek WSA_LCNO
               if  .not. EOF()
                  do WHILE _RLOCK(30)
                  enddo
                  replace SA_ACAMT WITH SA_ACAMT+(WSA_AMT+WSA_TAX+WSA_OTHE-WSA_PRE)
                  unlock
               endif
            endif
            select 1
            if WSA_SURE='Y' .and. FUNC='B' .and.  .not. FSA_ID$'34'
               if IE_CLSNOTE='1'
                  select AR00
                  seek FSA_BIL+WSA_NO+' '+WAR_RENO
                  WAC_VNO = AC_VNO
                  if  .not. EOF()
                     if AR_SURE#' '
                        do CHK_MSG WITH '此筆應收憑單已確認!!'
                     else
                        if WSA_AMT=0 .and. WSA_OTHE=0
                           WAR_DOCU = AR_DOCU
                           select AR06
                           seek WAR_DOCU
                           do WHILE  .not. EOF() .and. AR_DOCU=WAR_DOCU
                              do WHILE _RLOCK(30)
                              enddo
                              delete
                              unlock
                              skip
                           enddo
                           select AR00
                           do WHILE _RLOCK(30)
                           enddo
                           delete
                           unlock
                        endif
                     endif
                  endif
               else
                  dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
                  = SET_DBF(1,DBF_FI+'roariv','roariv_1','ariv',18)
                  do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
                  if ERR_USE
                     close DATABASES
                     return
                  endif
                  select ARIV
                  seek SA00.CU_NO+SA00.SA_NO+' S1'
                  do WHILE  .not. EOF()
                     select AR00
                     seek FSA_BIL+ARIV.IV_NO+'S6'
                     WAC_VNO = AC_VNO
                     if  .not. EOF()
                        if AR_SURE#' '
                           do CHK_MSG WITH '此筆應收憑單已確認!!'
                        else
                           if WSA_AMT=0 .and. WSA_OTHE=0
                              WAR_DOCU = AR_DOCU
                              select AR06
                              seek WAR_DOCU
                              do WHILE  .not. EOF() .and. AR_DOCU=WAR_DOCU
                                 do WHILE _RLOCK(30)
                                 enddo
                                 delete
                                 unlock
                                 skip
                              enddo
                              select AR00
                              do WHILE _RLOCK(30)
                              enddo
                              delete
                              unlock
                           endif
                        endif
                     endif
                     select ARIV
                     skip IN ARIV
                  enddo
                  use IN ARIV
               endif
            endif
            if WSA_SURE='Y' .and. WSA_ID$'12' .and. (WSA_AMT>0 .or. WSA_OTHE#0)
               if FUNC$'AE'
                  FLG_YN = .F.
               else
                  FLG_YN = .T.
               endif
               FLG_IVYN = .T.
               do ROSA00_R
            endif
            exit
      endcase
   enddo
   if FUNC='B'
      return
   endif
enddo
return

procedure ROSA00_B
do WHILE .T.
   unlock ALL
   CNT = 1
   OPTION = '（ 內 容 異 動  ）'
   @ 2,3 say option colo &co_sys
   do ROSA00_S
   set color to &co_key
   MSG00 = '[F1]內容新增  [F2]內容修改  [F3]內容刪除  [↑]上頁  [↓]下頁  [Esc]結束'
   @ 23, 0 CLEAR
   @ 24, (80-LEN(MSG00))/2 SAY MSG00
   set colo to &co_say
   do WHILE .T.
      P_KEY = INKEY(0)
      if P_KEY#TC_ESC .and. P_KEY#TC_F1 .and. P_KEY#TC_UP .and. P_KEY#TC_F3 .and. P_KEY#TC_F2 .and. P_KEY#TC_DN
         loop
      endif
      exit
   enddo
   if P_KEY#TC_UP .and. P_KEY#TC_DN .and. P_KEY#TC_ESC
      if P_KEY=TC_F1 .or. P_KEY=TC_F2 .or. P_KEY=TC_F3
         select 1
         goto TOP
         seek WSA_NO
         if EOF()
            goto BOTTOM
            WSA_NO = SA_NO
            ARR( 1) = 0
            do CHK_MSG WITH '本單據已被刪除!!'
            return
         endif
         if _RLOCK(30)
            loop
         endif
      endif
      CNT = 1
      do ROSA00_S
      select 2
   endif
   select 2
   do CASE
      case P_KEY=TC_ESC
         return
      case P_KEY=TC_F1
         if SUBSTR(RIGHT0,2,1)#'Y'
            do CHK_MSG WITH '使用者在本作業無新增之權限'
            loop
         endif
         OPTION = '（ 內 容 新 增  ）'
         @ 2,3 say option colo &co_sys
         do WHILE CNT>TRX_LIM
            skip 1
            if EOF()
               ARR( 1) = 0
            else
               CNT = 1
               do ROSA00_S
            endif
            if ARR(1)=0
               skip -1
               store SA_NO TO WSA_NO
               CNT = 1
               do ROSA00_S
            endif
         enddo
         select 2
         do ROSA00_D WITH 'B'
         if ARR(1)#0
            goto ARR(1)
         endif
         loop
      case P_KEY=TC_F2
         if SUBSTR(RIGHT0,3,1)#'Y'
            do CHK_MSG WITH '使用者在本作業無修改之權限'
            loop
         endif
         OPTION = '（ 內 容 修 改  ）'
         @ 2,3 say option colo &co_sys
         @ 23, 0 CLEAR
         MR = ' '
         @ 23, 5 SAY '編 修 序 號 :' COLOR (CO_KEY) GET MR PICTURE '9'
         read
         @ 23, 0 CLEAR
         MN = VAL(MR)
         if &rd_esc
            loop
         endif
         if MN<=0 .or. MN>TRX_LIM .or. ARR(MN)=0
            loop
         endif
         select 2
         goto ARR(MN)
         if _RLOCK(30)
            loop
         endif
         do ROSA00_D WITH 'C'
         select 2
         unlock
         if ARR(1)#0
            goto ARR(1)
         endif
         loop
      case P_KEY=TC_F3
         if SUBSTR(RIGHT0,4,1)#'Y'
            do CHK_MSG WITH '使用者在本作業無刪除之權限'
            loop
         endif
         save SCREEN TO DELSCR
         OPTION = '（ 內 容 刪 除  ）'
         @ 2,3 say option colo &co_sys
         @ 23, 0 CLEAR
         MR = ' '
         @ 23, 5 SAY '刪 除 序 號 :' COLOR (CO_KEY) GET MR PICTURE '9'
         read
         @ 23, 0 CLEAR
         MN = VAL(MR)
         if &rd_esc
            loop
         endif
         if MN<=0 .or. MN>TRX_LIM .or. ARR(MN)=0
            loop
         endif
         select 2
         goto ARR(MN)
         if _RLOCK(30)
            loop
         endif
         do ROSA00_D WITH 'D'
         if ARR(1)#0
            goto ARR(1)
         else
            select 1
            seek WSA_NO
            if EOF()
               goto BOTTOM
               WSA_NO = SA_NO
               seek WSA_NO
            endif
         endif
         loop
      case P_KEY=TC_UP
         if ARR(1)#0 .and. RECNO()#ARR(1)
            goto ARR(1)
         endif
         I = 1
         do WHILE  .not. BOF() .and. SA_NO=WSA_NO .and. I<=TRX_LIM
            skip -1
            I = I+1
         enddo
         if BOF() .or. SA_NO#WSA_NO
            do CHK_MSG WITH '已無上頁明細!!'
            seek WSA_NO
         endif
         loop
      case P_KEY=TC_DN
         if CNT>TRX_LIM
            goto ARR(TRX_LIM)
            skip 1
            if EOF() .or. SA_NO#WSA_NO
               do CHK_MSG WITH '已無下頁明細!!'
               goto ARR(1)
            endif
         else
            do CHK_MSG WITH '已無下頁明細!!'
         endif
         loop
   endcase
enddo

procedure ROSA00_C
if  .not. MESG_YN(' 確定刪除 (Y/N) ？ ')
   return
endif
save SCREEN TO SCRN_C
do CHK_MSG WITH '檔案刪除中，請稍候！！', 'S'
select 1
if _RLOCK(30)
   return
endif
FSA_ACAMT = SA_AMT+SA_TAX+SA_OTHE-SA_PRE
WSA_IVNO1 = SA_IVNO1
WSA_CHDAT = SA_CHDAT
WSA_BIL = SA_BIL
WCU_NO = CU_NO
WSA_NO = SA_NO
WSA_ID = SA_ID
WSA_CHARG = SA_CHARG
WSA_LCNO = SA_LCNO
WSA_DATE = SA_DATE
WSA_SURE = SA_SURE
WOD_ID = OD_ID
WSA_PRE = SA_PRE
if WSA_LCNO#SPACE(LEN(WSA_LCNO))
   select SA29
   seek WSA_LCNO
   if  .not. EOF()
      do WHILE _RLOCK(30)
      enddo
      replace SA_ACAMT WITH SA_ACAMT-FSA_ACAMT
      unlock
   endif
endif
select SA09
seek TSA_TYPE+WSA_NO
do WHILE  .not. EOF() .and. SA_TYPE+SA_NO=TSA_TYPE+WSA_NO
   do WHILE _RLOCK(30)
   enddo
   delete
   unlock
   skip
enddo
if WSA_SURE='Y'
   if IE_CLSNOTE='1'
      select AR00
      seek WSA_BIL+WSA_NO+' '+WAR_RENO
      if  .not. EOF() .and. AR_SURE=' '
         WAR_DOCU = AR_DOCU
         WAR_DATE = AR_DATE
         do WHILE _RLOCK(30)
         enddo
         delete
         unlock
         do CHK_NOD WITH WAR_DATE, 'AR', 'A', WAR_DOCU
         select AR06
         seek WAR_DOCU
         do WHILE  .not. EOF() .and. AR_DOCU=WAR_DOCU
            do WHILE _RLOCK(30)
            enddo
            delete
            unlock
            skip
         enddo
      endif
   else
      dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
      = SET_DBF(1,DBF_FI+'roariv','roariv_1','ariv',18)
      do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
      if ERR_USE
         close DATABASES
         return
      endif
      select ARIV
      seek SA00.CU_NO+SA00.SA_NO+' S1'
      do WHILE  .not. EOF()
         select AR00
         seek WSA_BIL+ARIV.IV_NO+'S6'
         if  .not. EOF() .and. AR_SURE=' '
            WAR_DOCU = AR_DOCU
            WAR_DATE = AR_DATE
            do WHILE _RLOCK(30)
            enddo
            delete
            unlock
            do CHK_NOD WITH WAR_DATE, 'AR', 'A', WAR_DOCU
            select AR06
            seek WAR_DOCU
            do WHILE  .not. EOF() .and. AR_DOCU=WAR_DOCU
               do WHILE _RLOCK(30)
               enddo
               delete
               unlock
               skip
            enddo
         endif
         select ARIV
         skip IN ARIV
      enddo
      use IN ARIV
   endif
endif
if WSA_PRE>0
   select AR10
   seek WAR_RENO+WSA_NO
   do WHILE  .not. EOF() .and. AR_RENO+AR_LIST=WAR_RENO+WSA_NO
      if ROSA00_V('D')
         return
      endif
      select AR10
      do WHILE _RLOCK(30)
      enddo
      delete
      unlock
      skip
   enddo
endif
if WSA_ID$'12'
   select CU00
   seek WSA_BIL
   FSA_AMT = CHK_RND((A.SA_AMT+A.SA_TAX+A.SA_OTHE)*A.SA_RATE)
   do WHILE _RLOCK(30)
   enddo
   replace CU_AR WITH IIF(CU_AR-FSA_AMT<0,0,CU_AR-FSA_AMT)
   unlock
endif
do CHK_NOD WITH WSA_DATE, 'SA', 'A', WSA_NO
select 2
seek WSA_NO
do WHILE  .not. EOF() .and. SA_NO=WSA_NO
   select SA01
   do WHILE _RLOCK(30)
   enddo
   if ROSA_U('D')
      return
   endif
   delete
   unlock
   skip
enddo
select SA05
seek WSA_NO
if  .not. EOF()
   select OD03
   set ORDER TO rood03_2
   select SA05
   do WHILE  .not. EOF() .and. SA_NO=WSA_NO
      if OD_NO#SPACE(5)
         TEL_NO = EL_NO
         TSA_QTY = SA_QTY
         select OD03
         seek TEL_NO+SA05.OD_NO
         if  .not. EOF()
            do WHILE _RLOCK(30)
            enddo
            replace OD_DLQTY WITH OD_DLQTY-TSA_QTY
            unlock
         endif
      endif
      select SA05
      do WHILE _RLOCK(30)
      enddo
      delete
      unlock
      skip
   enddo
endif
select MK
seek 'SA'+TSA_TYPE+TRIM(WSA_NO)
do WHILE  .not. EOF() .and. MK_NO='SA'+TSA_TYPE+TRIM(WSA_NO)
   do WHILE _RLOCK(30)
   enddo
   delete
   unlock
   skip
enddo
select SA24
set ORDER TO 2
seek WSA_NO
do WHILE .T.
   do WHILE _RLOCK(30)
   enddo
   replace SA_NO WITH SPACE(LEN(WSA_NO))
   unlock
   seek WSA_NO
   if EOF()
      exit
   endif
enddo
select 1
seek WSA_NO
if  .not. EOF()
   do WHILE _RLOCK(30)
   enddo
   delete
   unlock
endif
select 1
if  .not. EOF()
   skip
   if EOF()
      goto BOTTOM
   endif
endif
deactivate WINDOW WIN_MSG
release WINDOW WIN_MSG
select 1
WSA_NO = SA_NO
ARR( 1) = 0
select 1
return

procedure ROSA00_D
parameter FUNC
FUNC = UPPER(FUNC)
SCOR = .F.
FLG_TP = .F.
select 1
WSA_TAXID = SA_TAXID
WCU_NO = CU_NO
WSA_NO = SA_NO
WSA_BIL = SA_BIL
FSA_BIL = SA_BIL
WSA_ID = SA_ID
WSA_DATE = SA_DATE
WSA_CHDAT = SA_CHDAT
WSA_LTDAT = SA_LTDAT
WSA_IVNO1 = SA_IVNO1
WSA_CHARG = SA_CHARG
WSA_CHARG1 = SA_CHARG1
WOD_ID = OD_ID
WSA_RATE = SA_RATE
WOD_SATYP = OD_SATYP
WSA_SIGN = SA_SIGN
WSA_AMT = SA_AMT
WSA_TAX = SA_TAX
WSA_PRE = SA_PRE
WSA_OTHE = SA_OTHE
WSA_LCNO = SA_LCNO
WCU_SALE = CU_SALE
WDP_NO = DP_NO
WSA_SURE = SA_SURE
FSA_ACAMT = WSA_AMT+WSA_TAX+WSA_OTHE-WSA_PRE
WSA_COMM = SA_COMM
select CU00
seek WSA_BIL
WCU_NA = CU_NA
select AR08
seek WAR_RENO+WSA_ID
WAC_NO1 = AC_NO1
WAC_NO2 = AC_NO2
select 2
if FUNC$'ABC'
   set color to &co_key
   MSG00 = '[↑]往前修改.  [↓]往後修改.  [PgDn]本筆存入.  [Esc]本筆退出不存.'
   @ 23, 0 CLEAR
   @ 24, (80-LEN(MSG00))/2 SAY MSG00
   set colo to &co_say
endif
if AT(FUNC,'CD')#0
   store OD_NO TO WOD_NO, FOD_NO
   store OD_PO_NO TO WOD_PO_NO
   store OD_SERNO TO WOD_SERNO
   store EL_NO TO WEL_NO, FEL_NO
   store SA_UNIT TO WSA_UNIT
   store SA_SEQ TO WSA_SEQ
   store SA_QTY TO WSA_QTY, FSA_QTY
   store SA_ACQTY TO WSA_ACQTY
   store SA_BKQTY TO WSA_BKQTY
   store SA_PRICE TO WSA_PRICE, FSA_PRICE
   store SA_COST TO WSA_COST
   store OD_ID TO WOD_ID
   store SA_CH TO WSA_CH
   store SA_CHARG TO WSA_CHARG
   store SA_SIZE TO WSA_SIZE
   store OD_PDID TO WOD_PDID
   store OD_ELNO TO WOD_ELNO
   if FUNC='D'
      set color to &co_mesg
   endif
   select EL00
   seek WEL_NO
   if UPPER(SUBSTR(WEL_NO,1,3))='XYZ'
      W_DSP = SUBSTR(TRIM(EL_NAME1)+' '+WSA_SIZE+SPACE(43),1,43)
   else
      W_DSP = SUBSTR(TRIM(EL_NAME1)+' '+EL_SIZE+SPACE(43),1,43)
   endif
   select 2
   @ DROW(MN), 6 SAY SA_SEQ
   @ DROW(MN), 10 SAY OD_NO
   if IE_ODEL
      @ DROW(MN), 16 SAY OD_ELNO
   else
      @ DROW(MN), 16 SAY EL_NO
   endif
   @ DROW(MN), 32 SAY SA_UNIT
   do CASE
      case OD_PDID='O '
         @ DROW(MN), 37 SAY '訂單'
      case OD_PDID='S '
         @ DROW(MN), 37 SAY '樣品'
      case OD_PDID='C '
         @ DROW(MN), 37 SAY 'CKD '
      otherwise
         @ DROW(MN), 37 SAY OD_PDID+'  '
   endcase
   @ DROW(MN), 42 SAY SA_QTY PICTURE '#######.#'
   if TC_PR='Y'
      @ DROW(MN), 52 SAY SA_PRICE PICTURE '9999999.9999'
   endif
   if TC_PR='Y'
      if A.OD_ID=IE_ODID
         @ DROW(MN), 65 SAY ROUND(SA_PRICE*SA_QTY,0) PICTURE '9999999999'
      else
         @ DROW(MN), 65 SAY ROUND(SA_PRICE*SA_QTY,2) PICTURE '9999999.99'
      endif
   else
      @ DROW(MN), 65 SAY SPACE(12)
   endif
   @ DROW(MN), 76 SAY SA_CH PICTURE 'Y'
   if IE_ODEL
      @ DROW(MN)+1, 16 SAY EL_NO
      @ DROW(MN)+1, 32 SAY W_DSP
   else
      if UPPER(SUBSTR(WEL_NO,1,3))='XYZ'
         @ DROW(MN)+1, 16 SAY SUBSTR(EL00.EL_NAME1,1,20)+' '+WSA_SIZE
      else
         @ DROW(MN)+1, 16 SAY SUBSTR(EL00.EL_NAME1,1,20)+' '+EL00.EL_SIZE
      endif
   endif
   select 2
   SV_REC = RECNO()
endif
if AT(FUNC,'B')#0
   WSA_SEQ = VAR(1)
endif
do WHILE .T.
   select 2
   if FUNC$'AB'
      if CNT>TRX_LIM
         SCOR = .T.
         CNT = 1
         ARR( 1) = ARR(2)
         goto ARR(1)
         do ROSA00_S
      endif
      WSA_SEQ = SUBSTR(STR(VAL(WSA_SEQ)+1001,4),2,3)
      if FUNC='B' .or. CNT#1
         store SPACE(LEN(OD_NO)) TO WOD_NO
      endif
      store SPACE(LEN(OD_NO)) TO FOD_NO
      store SPACE(LEN(OD_PO_NO)) TO WOD_PO_NO
      store SPACE(LEN(OD_SERNO)) TO WOD_SERNO
      store SPACE(LEN(EL_NO)) TO WEL_NO, WOD_ELNO, FEL_NO
      store SPACE(LEN(SA_UNIT)) TO WSA_UNIT
      store SPACE(LEN(OD_PDID)) TO WOD_PDID
      store 0 TO WSA_QTY, FSA_QTY
      store 0 TO WSA_ACQTY
      store 0 TO WSA_BKQTY
      store 0.00 TO WSA_PRICE, FSA_PRICE
      store 0.00 TO WSA_COST
      store SPACE(LEN(SA_SIZE)) TO WSA_SIZE
      MN = CNT
   endif
   if A.SA_ID#'3'
      store 'Y' TO WSA_CH
   else
      store 'N' TO WSA_CH
   endif
   P_COD = 1
   do WHILE .T.
      R_COD = P_COD
      if FUNC='D'
         set colo to &co_say
         select 2
         if MESG_YN(' 確定刪除 (Y/N) ？ ')
            select OD02
            if ROSA_U('D')
               return
            endif
            select 2
            store SA_NO TO WSA_NO
            store SA_SEQ TO WSA_SEQ
            do WHILE _RLOCK(30)
            enddo
            delete
            unlock
            if MN=1 .and. ARR(2)>0
               ARR( 1) = ARR(2)
            endif
            select SA05
            seek WSA_NO+WSA_SEQ
            if  .not. EOF()
               select OD03
               set ORDER TO rood03_2
               select SA05
               do WHILE  .not. EOF() .and. SA_NO+SA_SEQ=WSA_NO+WSA_SEQ
                  if ROSA10_U('D')
                     return
                  endif
                  select SA05
                  do WHILE _RLOCK(30)
                  enddo
                  delete
                  unlock
                  skip
               enddo
            endif
            select SA01
            do WHILE  .not. EOF() .and. SA_NO=WSA_NO
               MSA_SEQ = SA_SEQ
               WSA_SEQ = SUBSTR(STR(VAL(SA_SEQ)+999,4,0),2,3)
               select SA05
               seek WSA_NO+MSA_SEQ
               do WHILE  .not. EOF() .and. SA_NO+SA_SEQ=WSA_NO+MSA_SEQ
                  do WHILE _RLOCK(30)
                  enddo
                  replace SA_SEQ WITH WSA_SEQ
                  unlock
                  skip
               enddo
               select SA06
               seek WSA_NO+MSA_SEQ
               do WHILE  .not. EOF() .and. SA_NO+SA_SEQ=WSA_NO+MSA_SEQ
                  do WHILE _RLOCK(30)
                  enddo
                  replace SA_SEQ WITH WSA_SEQ
                  unlock
                  skip
               enddo
               select SA01
               do WHILE _RLOCK(30)
               enddo
               replace SA_SEQ WITH WSA_SEQ
               unlock
               skip
            enddo
            select 2
            if MN=1 .and. ARR(2)=0
               ARR( 1) = 0
               select 2
               seek WSA_NO
               if EOF()
                  select 1
                  seek WSA_NO
                  if  .not. EOF()
                     WSA_IVNO1 = SA_IVNO1
                     WSA_CHDAT = SA_CHDAT
                     do CHK_NOD WITH WSA_DATE, 'SA', 'A', WSA_NO
                     dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
                     = SET_DBF(1,DBF_SA+'rosa09','rosa09_1','sa09',0)
                     do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
                     if ERR_USE
                        close DATABASES
                        return
                     endif
                     select SA09
                     seek TSA_TYPE+WSA_NO
                     do WHILE  .not. EOF() .and. SA_TYPE+SA_NO=TSA_TYPE+WSA_NO
                        do WHILE _RLOCK(30)
                        enddo
                        delete
                        unlock
                        skip
                     enddo
                     select SA09
                     use
                     if WSA_SURE='Y' .and. WSA_ID$'12'
                        if IE_CLSNOTE='1'
                           select AR00
                           seek WSA_BIL+WSA_NO+' '+WAR_RENO
                           if  .not. EOF() .and. AR_SURE=' '
                              WAR_DOCU = AR_DOCU
                              WAR_DATE = AR_DATE
                              do WHILE _RLOCK(30)
                              enddo
                              delete
                              unlock
                              do CHK_NOD WITH WAR_DATE, 'AR', 'A', WAR_DOCU
                              select AR06
                              seek WAR_DOCU
                              do WHILE  .not. EOF() .and. AR_DOCU=WAR_DOCU
                                 do WHILE _RLOCK(30)
                                 enddo
                                 delete
                                 unlock
                                 skip
                              enddo
                           endif
                        else
                           dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
                           = SET_DBF(1,DBF_FI+'roariv','roariv_1','ariv',18)
                           do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
                           if ERR_USE
                              close DATABASES
                              return
                           endif
                           select ARIV
                           seek SA00.CU_NO+SA00.SA_NO+' S1'
                           do WHILE  .not. EOF()
                              select AR00
                              seek WSA_BIL+ARIV.IV_NO+'S6'
                              if  .not. EOF() .and. AR_SURE=' '
                                 WAR_DOCU = AR_DOCU
                                 WAR_DATE = AR_DATE
                                 do WHILE _RLOCK(30)
                                 enddo
                                 delete
                                 unlock
                                 do CHK_NOD WITH WAR_DATE, 'AR', 'A', WAR_DOCU
                                 select AR06
                                 seek WAR_DOCU
                                 do WHILE  .not. EOF() .and. AR_DOCU=WAR_DOCU
                                    do WHILE _RLOCK(30)
                                    enddo
                                    delete
                                    unlock
                                    skip
                                 enddo
                              endif
                              select ARIV
                              skip IN ARIV
                           enddo
                           use IN ARIV
                        endif
                     endif
                     if WSA_LCNO#SPACE(LEN(WSA_LCNO))
                        select SA29
                        set ORDER TO rosa29_1
                        seek WSA_LCNO
                        if  .not. EOF()
                           do WHILE _RLOCK(30)
                           enddo
                           replace SA_ACAMT WITH SA_ACAMT-(WSA_AMT+WSA_TAX+WSA_OTHE-WSA_PRE)
                           unlock
                        endif
                     endif
                     select 1
                     do WHILE _RLOCK(30)
                     enddo
                     delete
                     unlock
                  endif
                  select 2
               endif
               return
            endif
         endif
         unlock
         R_COD = 0
         @ 16+MN, 6 SAY SPACE(70)
      endif
      do CASE
         case R_COD=0
            select 1
            WSA_RATE = SA_RATE
            select 2
            set ORDER TO 1
            seek WSA_NO
            TEL_NO = EL_NO
            T_AMT = 0
            do WHILE  .not. EOF() .and. WSA_NO=SA_NO
               if SA_CH#'N'
                  if WSA_SIGN#SPACE(8) .and. WSA_SIGN#'  /  /  '
                     W_QTY = SA_ACQTY
                  else
                     W_QTY = SA_QTY
                  endif
                  WSA_SEQ = SA_SEQ
                  if WOD_ID=IE_ODID
                     T_AMT = T_AMT+CHK_RND(SA_PRICE*W_QTY)
                  else
                     T_AMT = T_AMT+ROUND(SA_PRICE*W_QTY,2)
                  endif
                  select SA05
                  seek WSA_NO+WSA_SEQ
                  do WHILE  .not. EOF() .and. SA_NO+SA_SEQ=WSA_NO+WSA_SEQ
                     if WOD_ID=IE_ODID
                        T_AMT = T_AMT+CHK_RND(SA_PRICE*SA_QTY)
                     else
                        T_AMT = T_AMT+ROUND(SA_PRICE*SA_QTY,2)
                     endif
                     skip
                  enddo
                  select SA06
                  seek WSA_NO+WSA_SEQ
                  do WHILE  .not. EOF() .and. SA_NO+SA_SEQ=WSA_NO+WSA_SEQ
                     if WOD_ID=IE_ODID
                        T_AMT = T_AMT+CHK_RND(SA_PRICE*SA_QTY)
                     else
                        T_AMT = T_AMT+ROUND(SA_PRICE*SA_QTY,2)
                     endif
                     skip
                  enddo
               endif
               select 2
               skip
            enddo
            do CASE
               case WSA_TAXID='4'
                  if WOD_ID=IE_ODID
                     T_AMT = CHK_RND(T_AMT)
                     WSA_AMT = CHK_RND(T_AMT/(1+TA_TAX))
                  else
                     WSA_AMT = ROUND(T_AMT*WSA_RATE/(1+TA_TAX)/WSA_RATE,2)
                  endif
                  WSA_TAX = T_AMT-WSA_AMT
                  if WSA_PRE>0 .and. WSA_PRE<WSA_AMT
                     if WOD_ID=IE_ODID
                        WSA_TAX = CHK_RND((WSA_AMT-WSA_PRE)*TA_TAX)
                     else
                        WSA_TAX = ROUND((WSA_AMT-WSA_PRE)*WSA_RATE*TA_TAX/WSA_RATE,2)
                     endif
                  else
                     WSA_TAX = T_AMT-WSA_AMT
                  endif
               case WSA_TAXID='3'
                  WSA_AMT = T_AMT
                  if WSA_PRE>=WSA_AMT
                     if WOD_ID=IE_ODID
                        WSA_TAX = CHK_RND(WSA_AMT*TA_TAX)
                     else
                        WSA_TAX = ROUND(WSA_AMT*WSA_RATE*TA_TAX/WSA_RATE,2)
                     endif
                  else
                     if WOD_ID=IE_ODID
                        WSA_TAX = CHK_RND((WSA_AMT-WSA_PRE)*TA_TAX)
                     else
                        WSA_TAX = ROUND((WSA_AMT-WSA_PRE)*WSA_RATE*TA_TAX/WSA_RATE,2)
                     endif
                  endif
               otherwise
                  WSA_AMT = T_AMT
                  WSA_TAX = 0
            endcase
            if WOD_ID=IE_ODID
               WSA_CAMT = CHK_RND(WSA_COMM*WSA_AMT*0.01)
            else
               WSA_CAMT = ROUND(WSA_COMM*WSA_AMT*0.01,2)
            endif
            select 1
            replace SA_TAX WITH WSA_TAX
            replace SA_AMT WITH WSA_AMT
            replace SA_CAMT WITH WSA_CAMT
            if WSA_LCNO#SPACE(LEN(WSA_LCNO)) .and. FUNC$'BC'
               WSA_ACAMT = A.SA_AMT+A.SA_TAX+A.SA_OTHE-A.SA_PRE
               select SA29
               set ORDER TO rosa29_1
               seek WSA_LCNO
               if  .not. EOF()
                  do WHILE _RLOCK(30)
                  enddo
                  replace SA_ACAMT WITH SA_ACAMT-FSA_ACAMT+WSA_ACAMT
                  unlock
               endif
            endif
            if WSA_SURE='Y' .and. FUNC$'BCD' .and. WSA_ID$'12'
               if A.SA_AMT>0 .or. A.SA_OTHE#0
                  FLG_YN = .T.
                  FLG_IVYN = .T.
                  do ROSA00_R
               else
                  if IE_CLSNOTE='1'
                     select AR00
                     seek FSA_BIL+WSA_NO+' '+WAR_RENO
                     WAC_VNO = AC_VNO
                     if  .not. EOF()
                        if AR_SURE#' '
                           do CHK_MSG WITH '此筆應收憑單已確認!!'
                        else
                           WAR_DOCU = AR_DOCU
                           select AR06
                           seek WAR_DOCU
                           do WHILE  .not. EOF() .and. AR_DOCU=WAR_DOCU
                              do WHILE _RLOCK(30)
                              enddo
                              delete
                              unlock
                              skip
                           enddo
                           select AR00
                           do WHILE _RLOCK(30)
                           enddo
                           delete
                           unlock
                        endif
                     endif
                  else
                     dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
                     = SET_DBF(1,DBF_FI+'roariv','roariv_1','ariv',18)
                     do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
                     if ERR_USE
                        close DATABASES
                        return
                     endif
                     select ARIV
                     seek SA00.CU_NO+SA00.SA_NO+' S1'
                     do WHILE  .not. EOF()
                        select AR00
                        seek FSA_BIL+ARIV.IV_NO+'S6'
                        WAC_VNO = AC_VNO
                        if  .not. EOF()
                           if AR_SURE#' '
                              do CHK_MSG WITH '此筆應收憑單已確認!!'
                           else
                              WAR_DOCU = AR_DOCU
                              select AR06
                              seek WAR_DOCU
                              do WHILE  .not. EOF() .and. AR_DOCU=WAR_DOCU
                                 do WHILE _RLOCK(30)
                                 enddo
                                 delete
                                 unlock
                                 skip
                              enddo
                              select AR00
                              do WHILE _RLOCK(30)
                              enddo
                              delete
                              unlock
                           endif
                        endif
                        select ARIV
                        skip IN ARIV
                     enddo
                     use IN ARIV
                  endif
               endif
            endif
            select OD01
            set ORDER TO rood01_1 IN OD01
            select 2
            if AT(FUNC,'AB')#0
               @ DROW(MN), 6 CLEAR TO DROW(MN)+1, 76
               if SCOR
                  seek WSA_NO
                  if EOF()
                     goto BOTTOM
                     store SA_NO TO WSA_NO
                     seek WSA_NO
                     select 1
                     seek WSA_NO
                     select 2
                  endif
                  ARR( 1) = 0
                  CNT = 1
                  do ROSA00_S
               endif
            endif
            return
         case R_COD=1
            if IE_SAINP='1'
               @ DROW(MN), 6 SAY WSA_SEQ
               @ DROW(MN), 10 SAY SPACE(5)
               WCU_NO = A.CU_NO
               WSA_BIL = A.SA_BIL
               select OD01
               set ORDER TO 3
               TITAL = '批 號 料  品  編  號  客戶訂單號碼   預定交期 未交數量 '
               TITAL1 = '===== =============== ============== ======== ========='
               WINF = 'F'
               do CHK_WINX WITH LEN(TITAL)+2, 'od_no', "el_no+' '+od_po_no+' '+od_redat+' '+str((od_qty+od_bkqty-od_dlqty),9,1)", DROW(MN), 10, WINF, WOD_NO, 'cu_no,wcu_no'
               do CHK_PCOD WITH P_COD
               if WINF$'E'
                  P_COD = 0
                  loop
               endif
               if WINF$'RU'
                  P_COD = 1
                  loop
               endif
               if WINF$'SM'
                  do CHK_MSG WITH '無訂單銷貨!!'
                  WOD_NO = SPACE(5)
                  CSA_QTY = 0
                  if FUNC#'C'
                     WOD_PDID = '  '
                  endif
                  WOD_SERNO = SPACE(LEN(WOD_SERNO))
                  @ DROW(MN), 10 SAY WOD_NO
                  P_COD = 2
               else
                  if OD_CODE='Y'
                     do CHK_MSG WITH '此批號已特結'
                     P_COD = 1
                     loop
                  endif
                  if SC_CODE=' ' .and. IE_SCOD='N'
                     do CHK_MSG WITH '此批號未核料'
                     P_COD = 1
                     loop
                  endif
                  select OD02
                  seek OD01.OD_SERNO
                  select OD01
                  if OD02.OD_SURE#'Y'
                     do CHK_MSG WITH '此訂單未經確認不得申請出貨!!'
                     P_COD = 1
                     loop
                  endif
                  WOD_NO = OD_NO
                  WOD_SEQ = OD_SEQ
                  WCU_NO = CU_NO
                  WOD_ELNO = EL_NO
                  if FUNC$'AB' .or.  .not. IE_ODEL
                     WEL_NO = EL_NO
                  endif
                  WSA_UNIT = OD_UNIT
                  WOD_PO_NO = OD_PO_NO
                  WSA_PRICE = OD_PRICE
                  WSA_CHARG = OD_CHARG
                  SSA_CHARG = OD_CHARG
                  WOD_PDID = OD_PDID
                  WOD_SERNO = OD_SERNO
                  if FUNC$'ABE'
                     WSA_SIZE = OD_SIZE
                  endif
                  SOD_ID = OD_ID
                  WSA_CH = OD_CH
                  set ORDER TO rood01_1
                  if SOD_ID#A.OD_ID
                     do CHK_MSG WITH '幣別不同請另開銷貨單!!:'+SOD_ID
                     P_COD = 1
                     loop
                  endif
                  if A.SA_CHARG#'4'
                     if SSA_CHARG#A.SA_CHARG
                        do CHK_MSG WITH '收款方式不同請另開銷貨單!!:'+SSA_CHARG
                        P_COD = 1
                        loop
                     endif
                  endif
                  select OD01
                  if FUNC$'C' .and. FOD_NO=WOD_NO
                     CSA_QTY = OD_QTY+OD_BKQTY-OD_DLQTY-OD_QUE+FSA_QTY
                  else
                     CSA_QTY = OD_QTY+OD_BKQTY-OD_DLQTY-OD_QUE
                     if FUNC$'AB'
                        WSA_QTY = CSA_QTY
                     endif
                  endif
                  if CSA_QTY<=0
                     WSA_QTY = 0
                     CSA_QTY = 0
                     do CHK_MSG WITH '此批號已無待出貨量!!'
                     P_COD = 1
                     loop
                  endif
                  @ DROW(MN), 10 SAY WOD_NO
                  if IE_ODEL
                     @ DROW(MN), 16 SAY WOD_ELNO
                  else
                     @ DROW(MN), 16 SAY WEL_NO
                  endif
                  @ DROW(MN), 32 SAY WSA_UNIT
                  if TC_PR='Y'
                     @ DROW(MN), 51 SAY WSA_PRICE PICTURE '9999999.9999'
                  endif
               endif
               @ DROW(MN), 10 SAY WOD_NO
               do CASE
                  case WOD_PDID='O '
                     @ DROW(MN), 37 SAY '訂單'
                  case WOD_PDID='S '
                     @ DROW(MN), 37 SAY '樣品'
                  case WOD_PDID='C '
                     @ DROW(MN), 37 SAY 'CKD '
                  otherwise
                     @ DROW(MN), 37 SAY WOD_PDID+'  '
               endcase
               if WOD_NO#SPACE(5)
                  select OD02
                  set ORDER TO rood02_1 IN OD02
                  seek OD01.OD_SERNO
                  select OD01
                  if OD02.OD_SURE#'Y'
                     do CHK_MSG WITH '此訂單未經確認不得申請出貨!!'
                     P_COD = 1
                     loop
                  endif
               endif
            else
               @ DROW(MN), 6 SAY WSA_SEQ
               WCU_NO = A.CU_NO
               WSA_BIL = A.SA_BIL
               WI_NEW1 = SPACE(15)
               select OD01
               set ORDER TO rood01_6
               TITAL = '料  品  編  號  批 號 客戶訂單號碼   預定交期 未交數量 '
               TITAL1 = '=============== ===== ============== ======== ========='
               WINF = 'F'
               if IE_ODEL
                  do CHK_WINA WITH LEN(TITAL)+2, 'el_no', "od_no+' '+od_po_no+' '+od_redat+' '+str((od_qty+od_bkqty-od_dlqty-od_que),9,1)", DROW(MN), 16, WINF, WOD_ELNO, 'cu_no,wcu_no', WI_NEW1
               else
                  do CHK_WINA WITH LEN(TITAL)+2, 'el_no', "od_no+' '+od_po_no+' '+od_redat+' '+str((od_qty+od_bkqty-od_dlqty-od_que),9,1)", DROW(MN), 16, WINF, WEL_NO, 'cu_no,wcu_no', WI_NEW1
               endif
               set ORDER TO 1
               do CHK_PCOD WITH P_COD
               if WINF$'E'
                  P_COD = 0
                  loop
               endif
               if WINF$'RU'
                  P_COD = 1
                  loop
               endif
               if WINF$'SMN'
                  if FUNC$'AB'
                     do CHK_MSG WITH '無訂單銷貨!!'
                     WOD_NO = SPACE(5)
                     CSA_QTY = 0
                     WOD_PDID = 'O '
                     WOD_SERNO = SPACE(LEN(WOD_SERNO))
                     @ DROW(MN), 10 SAY WOD_NO
                  endif
                  select EL00
                  seek WI_NEW1
                  if EOF()
                     select EL00
                     WINF = 'F'
                     TITAL = '料  品  編  號  品                名 規                          格'
                     TITAL1 = '=============== ==================== =============================='
                     if IE_ODEL
                        do CHK_WIN WITH LEN(TITAL1)+2, 'el_no', "el_name1+' '+el_size", DROW(MN), 16, WINF, WOD_ELNO
                     else
                        do CHK_WIN WITH LEN(TITAL1)+2, 'el_no', "el_name1+' '+el_size", DROW(MN), 16, WINF, WEL_NO
                     endif
                     if WINF$'UERSMN'
                        @ DROW(MN), 10 SAY IIF(IE_ODEL,WOD_ELNO,WEL_NO)
                        if WINF$'E'
                           P_COD = 0
                        else
                           P_COD = 1
                           do CHK_MSG WITH '檔案中無資料!!'
                        endif
                        loop
                     endif
                     WOD_ELNO = EL_NO
                     WSA_UNIT = EL00.EL_UNIT
                     WSA_SIZE = EL_SIZE
                  else
                     WSA_UNIT = EL00.EL_UNIT
                     WOD_ELNO = WI_NEW1
                  endif
                  if FUNC$'ABE' .or.  .not. IE_ODEL
                     WEL_NO = WOD_ELNO
                  endif
                  @ DROW(MN), 10 SAY WOD_NO
               else
                  if FUNC$'ABE'
                     WOD_NO = OD_NO
                     WSA_SIZE = OD_SIZE
                     WOD_SEQ = OD_SEQ
                     WCU_NO = CU_NO
                  endif
                  WOD_ELNO = EL_NO
                  if FUNC$'ABE' .or.  .not. IE_ODEL
                     WEL_NO = EL_NO
                  endif
               endif
            endif
            select EL00
            seek WEL_NO
            if UPPER(SUBSTR(WEL_NO,1,3))='XYZ'
               W_DSP = SUBSTR(TRIM(EL_NAME1)+' '+WSA_SIZE+SPACE(43),1,43)
            else
               W_DSP = SUBSTR(TRIM(EL_NAME1)+' '+EL_SIZE+SPACE(43),1,43)
            endif
            if IE_ODEL
               @ DROW(MN), 16 SAY WOD_ELNO
               @ DROW(MN)+1, 16 SAY WEL_NO
               @ DROW(MN)+1, 32 SAY W_DSP
            else
               @ DROW(MN), 16 SAY WEL_NO
               if UPPER(SUBSTR(WEL_NO,1,3))='XYZ'
                  @ DROW(MN)+1, 16 SAY SUBSTR(EL00.EL_NAME1,1,20)+' '+WSA_SIZE
               else
                  @ DROW(MN)+1, 16 SAY SUBSTR(EL00.EL_NAME1,1,20)+' '+EL00.EL_SIZE
               endif
            endif
            @ DROW(MN), 10 SAY WOD_NO
         case R_COD=2
            if IE_SAINP='2'
               @ DROW(MN), 6 SAY WSA_SEQ
               WCU_NO = A.CU_NO
               WSA_BIL = A.SA_BIL
               select OD01
               set ORDER TO rood01_7
               TITAL = '批 號  料  品  編  號 客戶訂單號碼   預定交期 未交數量 '
               TITAL1 = '===== =============== ============== ======== ========='
               WINF = 'F'
               if IE_ODEL
                  do CHK_WINX WITH LEN(TITAL)+2, 'od_no', "el_no+' '+od_po_no+' '+od_redat+' '+str((od_qty+od_bkqty-od_dlqty-od_que),9,1)", DROW(MN), 10, WINF, WOD_NO, 'cu_no+el_no,wcu_no+wod_elno'
               else
                  do CHK_WINX WITH LEN(TITAL)+2, 'od_no', "el_no+' '+od_po_no+' '+od_redat+' '+str((od_qty+od_bkqty-od_dlqty-od_que),9,1)", DROW(MN), 10, WINF, WOD_NO, 'cu_no+el_no,wcu_no+wel_no'
               endif
               set ORDER TO rood01_1
               if WINF='M'
                  do CHK_MSG WITH '無此料品之訂單!!'
                  if &rd_up
                     P_COD = P_COD-1
                  else
                     P_COD = P_COD+1
                  endif
                  if FUNC$'ABE'
                     WSA_QTY = 0
                  endif
                  CSA_QTY = 0
                  WOD_NO = SPACE(5)
                  loop
               endif
               R_FLG = .F.
               do CHK_WINF WITH P_COD, WINF, .T., R_FLG
               if R_FLG
                  @ DROW(MN), 10 SAY WOD_NO
                  loop
               endif
               if WINF='S'
                  do CHK_MSG WITH '無訂單銷貨!!'
                  @ DROW(MN), 10 SAY WOD_NO
                  if IE_ODEL
                     WEL_NO = WOD_ELNO
                  endif
                  if IE_ODEL
                     @ DROW(MN), 16 SAY WOD_ELNO
                     WEL_NO = WOD_ELNO
                  else
                     @ DROW(MN), 16 SAY WEL_NO
                  endif
                  select EL00
                  seek WEL_NO
                  if UPPER(SUBSTR(WEL_NO,1,3))='XYZ'
                     W_DSP = SUBSTR(TRIM(EL_NAME1)+' '+WSA_SIZE+SPACE(43),1,43)
                  else
                     W_DSP = SUBSTR(TRIM(EL_NAME1)+' '+EL_SIZE+SPACE(43),1,43)
                  endif
                  if IE_ODEL
                     @ DROW(MN), 16 SAY WOD_ELNO
                     @ DROW(MN)+1, 16 SAY WEL_NO
                     @ DROW(MN)+1, 32 SAY W_DSP
                  else
                     @ DROW(MN), 16 SAY WEL_NO
                     if UPPER(SUBSTR(WEL_NO,1,3))='XYZ'
                        @ DROW(MN)+1, 16 SAY SUBSTR(EL00.EL_NAME1,1,20)+' '+WSA_SIZE
                     else
                        @ DROW(MN)+1, 16 SAY SUBSTR(EL00.EL_NAME1,1,20)+' '+EL00.EL_SIZE
                     endif
                  endif
               else
                  if OD_CODE='Y'
                     do CHK_MSG WITH '此批號已特結'
                     P_COD = 1
                     loop
                  endif
                  if SC_CODE=' ' .and. IE_SCOD='N'
                     do CHK_MSG WITH '此批號未核料'
                     P_COD = 1
                     loop
                  endif
                  select OD02
                  set ORDER TO rood02_1 IN OD02
                  seek OD01.OD_SERNO
                  select OD01
                  if OD02.OD_SURE#'Y'
                     do CHK_MSG WITH '此訂單未經確認不得申請出貨!!'
                     P_COD = 1
                     loop
                  endif
                  WOD_NO = OD_NO
                  WSA_UNIT = OD_UNIT
                  WOD_PO_NO = OD_PO_NO
                  WSA_PRICE = OD_PRICE
                  WSA_CHARG = OD_CHARG
                  SSA_CHARG = OD_CHARG
                  WOD_PDID = OD_PDID
                  WOD_SERNO = OD_SERNO
                  SOD_ID = OD_ID
                  WSA_CH = OD_CH
                  if FUNC$'C' .and. FOD_NO=WOD_NO
                     CSA_QTY = OD_QTY+OD_BKQTY-OD_DLQTY-OD_QUE+FSA_QTY
                  else
                     CSA_QTY = OD_QTY+OD_BKQTY-OD_DLQTY-OD_QUE
                     if FUNC$'AB'
                        WSA_QTY = CSA_QTY
                     endif
                  endif
                  if CSA_QTY<=0
                     if FUNC$'ABE'
                        WSA_QTY = 0
                     endif
                     CSA_QTY = 0
                     do CHK_MSG WITH '此批號已無待出貨量!!'
                     P_COD = R_COD
                     loop
                  endif
                  @ DROW(MN), 10 SAY WOD_NO
                  @ DROW(MN), 32 SAY WSA_UNIT
                  if TC_PR='Y'
                     @ DROW(MN), 51 SAY WSA_PRICE PICTURE '9999999.9999'
                  endif
               endif
            else
               if EMPTY(WOD_NO)
                  select EL00
                  WINF = 'F'
                  TITAL = '料  品  編  號  品                名 規                          格'
                  TITAL1 = '=============== ==================== =============================='
                  if IE_ODEL
                     do CHK_WIN WITH LEN(TITAL1)+2, 'el_no', "substr(el_name1,1,20)+' '+el_size", DROW(MN), 16, WINF, WOD_ELNO
                  else
                     do CHK_WIN WITH LEN(TITAL1)+2, 'el_no', "substr(el_name1,1,20)+' '+el_size", DROW(MN), 16, WINF, WEL_NO
                  endif
                  R_FLG = .F.
                  do CHK_WINF WITH P_COD, WINF, .F., R_FLG
                  if R_FLG
                     seek WEL_NO
                     W_DSP = SUBSTR(TRIM(EL_NAME1)+' '+EL_SIZE+SPACE(43),1,43)
                     @ DROW(MN)+1, 16 SAY WEL_NO
                     @ DROW(MN)+1, 32 SAY W_DSP
                     loop
                  endif
                  WOD_ELNO = EL_NO
                  WEL_NO = EL_NO
                  WSA_UNIT = EL00.EL_UNIT
                  if UPPER(SUBSTR(WEL_NO,1,3))='XYZ'
                     @ DROW(MN)+1, 17 SAY SUBSTR(EL00.EL_NAME1,1,20)+' '+WSA_SIZE
                     W_DSP = SUBSTR(TRIM(EL_NAME1)+' '+WSA_SIZE+SPACE(43),1,43)
                  else
                     @ DROW(MN)+1, 17 SAY SUBSTR(EL00.EL_NAME1,1,20)+' '+EL00.EL_SIZE
                     W_DSP = SUBSTR(TRIM(EL_NAME1)+' '+EL_SIZE+SPACE(43),1,43)
                  endif
                  if IE_ODEL
                     @ DROW(MN), 16 SAY WOD_ELNO
                     @ DROW(MN)+1, 16 SAY WEL_NO
                     @ DROW(MN)+1, 32 SAY W_DSP
                  else
                     @ DROW(MN), 16 SAY WEL_NO
                     if UPPER(SUBSTR(WEL_NO,1,3))='XYZ'
                        @ DROW(MN)+1, 16 SAY SUBSTR(EL00.EL_NAME1,1,20)+' '+WSA_SIZE
                     else
                        @ DROW(MN)+1, 16 SAY SUBSTR(EL00.EL_NAME1,1,20)+' '+EL00.EL_SIZE
                     endif
                  endif
               else
                  if &rd_up
                     P_COD = P_COD-1
                  else
                     P_COD = P_COD+1
                  endif
               endif
            endif
         case R_COD=3
            if IE_ODEL .and.  .not. EMPTY(WOD_NO) .and.  .not. LEFT(WOD_PDID,1)$'CK'
               select EL00
               WINF = 'F'
               TITAL = '料  品  編  號  品                名 規                          格'
               TITAL1 = '=============== ==================== =============================='
               do CHK_WIN WITH LEN(TITAL1)+2, 'el_no', "substr(el_name1,1,20)+' '+el_size", DROW(MN)+1, 16, WINF, WEL_NO
               R_FLG = .F.
               do CHK_WINF WITH P_COD, WINF, .F., R_FLG
               if R_FLG
                  seek WEL_NO
                  W_DSP = SUBSTR(TRIM(EL_NAME1)+' '+EL_SIZE+SPACE(43),1,43)
                  @ DROW(MN)+1, 16 SAY WEL_NO
                  @ DROW(MN)+1, 32 SAY W_DSP
                  loop
               endif
               WEL_NO = EL_NO
               WSA_UNIT = EL00.EL_UNIT
               if UPPER(SUBSTR(WEL_NO,1,3))='XYZ'
                  @ DROW(MN)+1, 17 SAY SUBSTR(EL00.EL_NAME1,1,20)+' '+WSA_SIZE
                  W_DSP = SUBSTR(TRIM(EL_NAME1)+' '+WSA_SIZE+SPACE(43),1,43)
               else
                  @ DROW(MN)+1, 17 SAY SUBSTR(EL00.EL_NAME1,1,20)+' '+EL00.EL_SIZE
                  W_DSP = SUBSTR(TRIM(EL_NAME1)+' '+EL_SIZE+SPACE(43),1,43)
               endif
               @ DROW(MN)+1, 16 SAY WEL_NO
               @ DROW(MN)+1, 32 SAY W_DSP
               @ DROW(MN), 32 SAY WSA_UNIT
            else
               if IE_ODEL
                  WEL_NO = WOD_ELNO
               endif
               if &rd_up
                  P_COD = P_COD-1
               else
                  P_COD = P_COD+1
               endif
            endif
         case R_COD=4
            select OD01
            seek WOD_NO
            if FUNC='C'
               if WOD_NO=FOD_NO
                  CSA_QTY = OD_QTY+OD_BKQTY-OD_DLQTY-OD_QUE+FSA_QTY
               endif
            else
               WSA_QTY = OD_QTY+OD_BKQTY-OD_DLQTY-OD_QUE
               if WSA_QTY<=0
                  WSA_QTY = 0
                  CSA_QTY = 0
               else
                  CSA_QTY = WSA_QTY
               endif
            endif
            if FUNC='C' .and. WOD_NO#SPACE(5)
               if WOD_NO#FOD_NO
                  select OD01
                  seek WOD_NO
                  WSA_UNIT = OD_UNIT
                  WOD_PDID = OD_PDID
                  WEL_NO = EL_NO
                  if FUNC$'AB' .or.  .not. IE_ODEL
                     WOD_ELNO = EL_NO
                  endif
                  WOD_PO_NO = OD_PO_NO
                  WOD_SERNO = OD_SERNO
                  WSA_PRICE = OD_PRICE
                  WSA_CHARG = OD_CHARG
                  SSA_CHARG = OD_CHARG
                  WSA_SIZE = OD_SIZE
                  SOD_ID = OD_ID
                  WSA_QTY = OD_QTY+OD_BKQTY-OD_DLQTY-OD_QUE
                  CSA_QTY = WSA_QTY
                  select EL00
                  seek WEL_NO
                  if UPPER(SUBSTR(WEL_NO,1,3))='XYZ'
                     W_DSP = SUBSTR(TRIM(EL_NAME1)+' '+WSA_SIZE+SPACE(43),1,43)
                  else
                     W_DSP = SUBSTR(TRIM(EL_NAME1)+' '+EL_SIZE+SPACE(43),1,43)
                  endif
                  if IE_ODEL
                     @ DROW(MN)+1, 16 SAY WEL_NO
                     @ DROW(MN)+1, 34 SAY W_DSP
                  else
                     if UPPER(SUBSTR(WEL_NO,1,3))='XYZ'
                        @ DROW(MN)+1, 16 SAY SUBSTR(EL00.EL_NAME1,1,20)+' '+WSA_SIZE
                     else
                        @ DROW(MN)+1, 16 SAY SUBSTR(EL00.EL_NAME1,1,20)+' '+EL00.EL_SIZE
                     endif
                  endif
               endif
            endif
            @ DROW(MN), 32 GET WSA_UNIT PICTURE 'xxxx'
            read
            @ DROW(MN), 32 SAY WSA_UNIT PICTURE 'xxxx'
            do CHK_PCOD WITH P_COD
         case R_COD=5
            if EMPTY(WOD_NO)
               do CHK_MSG WITH '類別 O:訂單 S:樣品 C:CKD K1:SKD K2:SKD K3:SKD K4:SKD', 's', '', 0, 0, 0
               @ DROW(MN), 37 SAY SPACE(4)
               @ DROW(MN), 37 GET WOD_PDID PICTURE '!!'
               read
               deactivate WINDOW WIN_MSG
               release WINDOW WIN_MSG
               do CASE
                  case WOD_PDID='O '
                     @ DROW(MN), 37 SAY '訂單'
                  case WOD_PDID='S '
                     @ DROW(MN), 37 SAY '樣品'
                  case WOD_PDID='C '
                     @ DROW(MN), 37 SAY 'CKD '
                  otherwise
                     @ DROW(MN), 37 SAY WOD_PDID+' '
               endcase
               do CHK_PCOD WITH P_COD
               if &rd_esc .or. &rd_up
                  loop
               endif
               if WOD_PDID#'S ' .and. WOD_PDID#'O ' .and. WOD_PDID#'C ' .and. SUBSTR(WOD_PDID,1,1)#'K'
                  do CHK_MSG WITH ' 類別錯誤,O:訂單 S:樣品 C:CKD K1:SKD K2:SKD K3:SKD K4:SKD '
                  P_COD = R_COD
                  loop
               endif
            else
               if &rd_up
                  P_COD = P_COD-1
               else
                  P_COD = P_COD+1
               endif
            endif
         case R_COD=6
            select MT00
            seek WEL_NO
            WMT_REA = MT_QTY+MT_WAY+MT_BRW-MT_APPL
            do CHK_MSG WITH '庫存良品:'+STR(MT_QTY,9,1)+' 待出貨數:'+STR(MT_QUE,9,1)+' 可出貨數:'+STR(MT_QTY-MT_QUE,9,1)+' 理論存量:'+STR(WMT_REA,9,1), 'S', '', 0, 0, 0
            do CHK_GETN WITH DROW(MN), 42, WSA_QTY, '9999999.9', '0.1,'
            deactivate WINDOW WIN_MSG
            release WINDOW WIN_MSG
            @ 23, 0 CLEAR
            @ 24,(80-len(msg00))/2  say msg00 colo &co_key
            OVER_QTY = 0
            if WOD_NO#SPACE(LEN(WOD_NO))
               if WSA_QTY>CSA_QTY
                  do CHK_MSG WITH '請注意!!出貨量超過未申請量!!'
               endif
            endif
            if AT(FUNC,'AB')#0 .and. WSA_QTY>MT_QTY
               do CHK_MSG WITH '請注意,庫存不足 '+STR(WSA_QTY-MT_QTY,9,1)+'!!'
            endif
            if AT(FUNC,'AB')#0 .and. WOD_PO_NO#SPACE(LEN(WOD_PO_NO))
               if WSA_QTY>CSA_QTY
                  do CHK_MSG WITH '請注意!!出貨量超過未申請量!!'
                  OVER_QTY = WSA_QTY-CSA_QTY
               endif
            endif
         case R_COD=7
            if SUBSTR(RIGHT0,6,1)='Y' .and. TC_PR='Y'
               if (WOD_NO#SPACE(5) .and. IE_MOPR='Y') .or. WOD_NO=SPACE(5)
                  select EL00
                  seek WEL_NO
                  WEL_PRICE = EL_PRICE
                  WEL_LPRICE = EL_LPRICE
                  WEL_QTY1 = EL_QTY1
                  WEL_PRICE = EL_PRICE
                  WEL_QTY2 = EL_QTY2
                  WEL_PRIC2 = EL_PRIC2
                  WEL_QTY3 = EL_QTY3
                  WEL_PRIC3 = EL_PRIC3
                  dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
                  = SET_DBF(1,DBF_BA+'roelsa','roelsa_1','elsa',0)
                  do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
                  if ERR_USE
                     close DATABASES
                     return
                  endif
                  select ELSA
                  seek WEL_NO+WCU_NO+WOD_ID
                  FLG_PR = 'N'
                  if EOF()
                     do CASE
                        case WEL_QTY1=0 .or. WSA_QTY<=WEL_QTY1
                           WCU_PRICE = WEL_PRICE/WSA_RATE
                        case WSA_QTY<=WEL_QTY2
                           WCU_PRICE = WEL_PRIC2/WSA_RATE
                        case WSA_QTY>=WEL_QTY2
                           WCU_PRICE = WEL_PRIC3/WSA_RATE
                        otherwise
                           WCU_PRICE = WEL_PRICE/WSA_RATE
                     endcase
                  else
                     FLG_PR = 'Y'
                     do CASE
                        case WEL_QTY1=0 .or. WSA_QTY<=WEL_QTY1
                           WCU_PRICE = SA_PRICE
                        case WSA_QTY<=WEL_QTY2
                           WCU_PRICE = SA_PRIC2
                        case WSA_QTY>=WEL_QTY2
                           WCU_PRICE = SA_PRIC3
                        otherwise
                           WCU_PRICE = SA_PRICE
                     endcase
                  endif
                  if WSA_PRICE=0 .and. FUNC$'AB' .and. WOD_NO=SPACE(5)
                     WSA_PRICE = WCU_PRICE
                  endif
                  use
                  do CHK_GETN WITH DROW(MN), 52, WSA_PRICE, '9999999.9999', '0,'
                  if &rd_esc .or. &rd_up
                     loop
                  endif
                  if WOD_ID=IE_ODID
                     @ DROW(MN), 65 SAY ROUND(WSA_PRICE*WSA_QTY,0) PICTURE '9999999999'
                  else
                     @ DROW(MN), 65 SAY ROUND(WSA_PRICE*WSA_QTY,2) PICTURE '9999999.99'
                  endif
                  if WOD_PDID='O ' .or. (WOD_PDID='S ' .and. WSA_PRICE>0)
                     if WCU_PRICE>0 .and. FLG_PR='Y'
                        if WSA_PRICE<WCU_PRICE
                           if WSA_PRICE*WSA_RATE<WEL_LPRICE
                              do CHK_MSG WITH '銷售單價不得低於最低售價!!'
                              P_COD = R_COD
                           else
                              do CHK_MSG WITH '注意:銷售單價低於客戶設定單價!!'
                           endif
                        endif
                     else
                        if WSA_PRICE*WSA_RATE<WEL_LPRICE
                           do CHK_MSG WITH '銷售單價不得低於最低售價!!'
                           P_COD = R_COD
                           loop
                        endif
                     endif
                  endif
               else
                  do CHK_PCOD WITH P_COD
               endif
            else
               do CHK_PCOD WITH P_COD
            endif
         case R_COD=8
            if A.SA_ID#'3'
               do CHK_GETC WITH DROW(MN), 76, WSA_CH, '!', 'YN'
            else
               P_COD = P_COD+1
            endif
         case R_COD=9
            if UPPER(SUBSTR(WEL_NO,1,3))='XYZ'
               @ DROW(MN)+1, 36 SAY SPACE(30)
               do CHK_GET WITH DROW(MN)+1, 36, WSA_SIZE
            else
               do CHK_PCOD WITH P_COD
            endif
         case R_COD=10 .or. R_COD=-1
            select SA01
            set ORDER TO rosa01_2
            seek WOD_NO+WSA_NO+WEL_NO
            if  .not. EOF() .and. (FUNC$'AB' .or. (FUNC='C' .and. RECNO()#SV_REC))
               do CHK_MSG WITH '此批號+料號該銷貨單已有記錄!!'
               set ORDER TO rosa01_1
               P_COD = 1
               loop
            endif
            select SA01
            set ORDER TO rosa01_1
            if FUNC$'C'
               goto SV_REC
            endif
            WEL_INVID = EL00.EL_INVID
            WIN_ID = EL00.IN_ID
            WMA_NO = EL00.MA_NO
            if WSA_QTY<=0
               do CHK_MSG WITH '數量不可＜＝ 0 '
               P_COD = 4
               loop
            endif
            if WSA_PRICE#0
               dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
               = SET_DBF(1,DBF_BA+'roelsa','roelsa_1','elsa',0)
               do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
               if ERR_USE
                  close DATABASES
                  return
               endif
               select ELSA
               seek WEL_NO+WCU_NO+WOD_ID
               if EOF()
                  append BLANK
                  do WHILE _RLOCK(30)
                  enddo
                  replace EL_NO WITH WEL_NO
                  replace OD_ID WITH WOD_ID
                  replace CU_NO WITH WCU_NO
                  replace SA_PRICE WITH WSA_PRICE
                  unlock
               endif
               use
            endif
            if WSA_ID$'12' .and. WSA_CH='Y'
               select CU00
               seek WSA_BIL
               FSA_AMT = CHK_RND(WSA_PRICE*WSA_QTY*WSA_RATE)
               GSA_AMT = CHK_RND(FSA_PRICE*FSA_QTY*WSA_RATE)
               select CU00
               do WHILE _RLOCK(30)
               enddo
               if FLG_TP
                  replace CU_ODAMT WITH IIF(CU_ODAMT-FSA_AMT>0,CU_ODAMT-FSA_AMT+GSA_AMT,0)
                  replace CU_SAAMT WITH IIF(CU_SAAMT-FSA_AMT>0,CU_SAAMT-FSA_AMT+GSA_AMT,0)
               endif
               replace CU_AR WITH CU_AR+FSA_AMT-GSA_AMT
               unlock
            endif
            if ( .not. ' '$A.SA_SIGN .and. WSA_QTY<WSA_ACQTY) .or. WSA_CHARG='2'
               WSA_ACQTY = WSA_QTY
            endif
            select OD02
            if AT(FUNC,'AB')#0
               do ROSA_U WITH 'I'
            endif
            if AT(FUNC,'C')#0
               do ROSA_U WITH 'M'
            endif
            if  .not. IE_ODEL
               WOD_ELNO = WEL_NO
            endif
            select 2
            if FUNC#'C'
               append BLANK
            else
               goto ARR(MN)
            endif
            do WHILE _RLOCK(30)
            enddo
            replace SA_NO WITH A.SA_NO
            replace SA_SEQ WITH WSA_SEQ
            replace CU_NO WITH A.CU_NO
            replace SA_BIL WITH A.SA_BIL
            replace OD_ID WITH A.OD_ID
            replace SA_CHARG WITH A.SA_CHARG
            replace SA_DATE WITH A.SA_DATE
            replace SA_CHDAT WITH A.SA_CHDAT
            replace OD_NO WITH WOD_NO
            replace OD_PO_NO WITH WOD_PO_NO
            replace OD_SERNO WITH WOD_SERNO
            replace EL_NO WITH WEL_NO
            replace SA_QTY WITH WSA_QTY
            replace SA_PRICE WITH WSA_PRICE
            replace SA_COST WITH WSA_COST
            replace SA_RATE WITH WSA_RATE
            replace SA_UNIT WITH WSA_UNIT
            replace SA_TAXID WITH WSA_TAXID
            replace SA_ID WITH WSA_ID
            replace OD_PDID WITH WOD_PDID
            replace CU_SALE WITH WCU_SALE
            replace DP_NO WITH WDP_NO
            replace SA_ACQTY WITH WSA_ACQTY
            replace SA_CH WITH WSA_CH
            replace EL_INVID WITH WEL_INVID
            replace IN_ID WITH WIN_ID
            replace MA_NO WITH WMA_NO
            replace OD_ELNO WITH WOD_ELNO
            if UPPER(SUBSTR(WEL_NO,1,3))='XYZ'
               replace SA_SIZE WITH WSA_SIZE
            endif
            unlock
            FLG_OD = .F.
            if FUNC='C'
               if WOD_NO#FOD_NO .or. WSA_QTY#FSA_QTY
                  select SA05
                  seek WSA_NO+WSA_SEQ
                  if  .not. EOF()
                     select OD03
                     set ORDER TO rood03_2
                     select SA05
                     FOD_NO = OD_NO
                     do WHILE  .not. EOF() .and. SA_NO+SA_SEQ=WSA_NO+WSA_SEQ
                        TEL_NO = EL_NO
                        TSA_QTY = FSA_QTY
                        select OD03
                        seek TEL_NO+FOD_NO
                        if  .not. EOF()
                           do WHILE .T.
                              if _RLOCK(30)
                                 loop
                              endif
                              exit
                           enddo
                           replace OD_DLQTY WITH OD_DLQTY-TSA_QTY
                           unlock
                           select MT00
                           seek TEL_NO
                           if EOF()
                              append BLANK
                           endif
                           do WHILE .T.
                              if _RLOCK(30)
                                 loop
                              endif
                              exit
                           enddo
                           replace EL_NO WITH TEL_NO
                           replace MT_ODQTY WITH MT_ODQTY+TSA_QTY
                           unlock
                        endif
                        select SA05
                        do WHILE .T.
                           if _RLOCK(30)
                              loop
                           endif
                           exit
                        enddo
                        delete
                        unlock
                        skip
                     enddo
                     if WOD_NO#SPACE(5)
                        FLG_OD = .T.
                     endif
                  endif
               endif
            else
               if WOD_NO#SPACE(5)
                  FLG_OD = .T.
               endif
            endif
            if FLG_OD
               select OD03
               set ORDER TO rood03_1
               seek WOD_NO
               if  .not. EOF()
                  WOD_SEQ1 = '   '
                  select OD03
                  seek WOD_NO
                  T_AMT = 0
                  if  .not. EOF()
                     do WHILE  .not. EOF() .and. OD_NO=WOD_NO
                        TEL_NO = EL_NO
                        select EL00
                        seek TEL_NO
                        select OD03
                        TSA_QTY = WSA_QTY*OD_UQTY/OD_UNIT
                        WOD_SEQ1 = SUBSTR(STR(VAL(WOD_SEQ1)+1001,4),2,3)
                        if WOD_ID=IE_ODID
                           T_AMT = T_AMT+CHK_RND(OD_PRICE*TSA_QTY)
                        else
                           T_AMT = T_AMT+ROUND(OD_PRICE*TSA_QTY,2)
                        endif
                        if BO_NO=SPACE(15)
                           do WHILE .T.
                              if _RLOCK(30)
                                 loop
                              endif
                              exit
                           enddo
                           replace OD_DLQTY WITH OD_DLQTY+TSA_QTY
                           unlock
                           select MT00
                           seek OD03.EL_NO
                           do WHILE .T.
                              if _RLOCK(30)
                                 loop
                              endif
                              exit
                           enddo
                           replace MT_ODQTY WITH IIF(MT_ODQTY-TSA_QTY>=0,MT_ODQTY-TSA_QTY,0)
                           unlock
                        endif
                        select SA05
                        append BLANK
                        do WHILE .T.
                           if _RLOCK(30)
                              loop
                           endif
                           exit
                        enddo
                        replace SA_NO WITH WSA_NO
                        replace EL_NO WITH OD03.EL_NO
                        replace SA_SEQ WITH WSA_SEQ
                        replace SA_SEQ1 WITH WOD_SEQ1
                        replace SA_UNIT WITH OD03.OD_UNIT
                        replace SA_UQTY WITH OD03.OD_UQTY
                        replace SA_QTY WITH TSA_QTY
                        replace OD_PO_NO WITH OD03.OD_PO_NO
                        replace CU_NO WITH OD03.CU_NO
                        replace SA_PRICE WITH OD03.OD_PRICE
                        replace BO_NO WITH OD03.BO_NO
                        replace OD_NO WITH WOD_NO
                        replace SA_TAXID WITH WSA_TAXID
                        replace CU_NO WITH WCU_NO
                        replace DP_NO WITH WDP_NO
                        replace CU_SALE WITH WCU_SALE
                        replace SA_ID WITH WSA_ID
                        replace SA_DATE WITH WSA_DATE
                        replace OD_ID WITH WOD_ID
                        replace SA_RATE WITH WSA_RATE
                        replace EL_INVID WITH EL00.EL_INVID
                        replace IN_ID WITH EL00.IN_ID
                        unlock
                        select OD03
                        skip
                     enddo
                     if T_AMT>0
                        S_AMT = A.SA_AMT+T_AMT
                        select 1
                        if WSA_TAXID='4'
                           if WOD_ID=IE_ODID
                              WSA_AMT = CHK_RND(S_AMT/(1+TA_TAX))
                           else
                              WSA_AMT = ROUND(S_AMT*SA_RATE/(1+TA_TAX)/SA_RATE,2)
                           endif
                           WSA_TAX = S_AMT-WSA_AMT
                        else
                           WSA_AMT = S_AMT
                           WSA_TAX = 0
                           if WSA_TAXID='3'
                              if WOD_ID=IE_ODID
                                 WSA_TAX = CHK_RND(WSA_AMT*TA_TAX)
                              else
                                 WSA_TAX = ROUND(WSA_AMT*SA_RATE*TA_TAX/SA_RATE,2)
                              endif
                           endif
                        endif
                        if WOD_ID=IE_ODID
                           WSA_CAMT = CHK_RND(WSA_COMM*WSA_AMT*0.01)
                        else
                           WSA_CAMT = ROUND(WSA_COMM*WSA_AMT*0.01,2)
                        endif
                        select 1
                        replace SA_AMT WITH WSA_AMT
                        replace SA_TAX WITH WSA_TAX
                        replace SA_CAMT WITH WSA_CAMT
                     endif
                  endif
                  save SCREEN TO SA_SCR
                  dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
                  = SET_DBF(1,DBF_SC+'robo11','robo11_1','bo11',0)
                  do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
                  if ERR_USE
                     close DATABASES
                     return
                  endif
                  CNT1 = 1
                  ARR1( 1) = 0
                  select SA05
                  seek WSA_NO+WSA_SEQ
                  do ROSA10_B
                  select BO11
                  use
                  restore SCREEN FROM SA_SCR
               endif
            endif
            if (WSA_UNIT='TYPE' .or. WSA_UNIT='type' .or. WSA_UNIT='式  ') .and. WOD_NO=SPACE(5)
               save SCREEN TO SA_SCR
               dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
               = SET_DBF(1,DBF_SC+'robo11','robo11_1','bo11',0)
               do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
               if ERR_USE
                  close DATABASES
                  return
               endif
               CNT1 = 1
               select SA01
               seek WSA_NO+WSA_SEQ
               do ROSA10_D WITH 'A'
               select BO11
               use
               restore SCREEN FROM SA_SCR
            endif
            if FUNC='C'
               P_COD = 0
               loop
            endif
            select 2
            if FUNC#'C'
               do ROSA00_S
            endif
            exit
      endcase
   enddo
enddo

procedure ROSA00_E
P_COD = 1
select 1
WOD_ID = OD_ID
WSA_RATE = SA_RATE
WSA_SURE = SA_SURE
WSA_IVNO1 = SA_IVNO1
WSA_TAXID = SA_TAXID
WIV_AMT = IV_AMT
WIV_TAX = IV_TAX
WIV_DATE = IV_DATE
WIV_PAGE = IV_PAGE
WSA_SIGN = SA_SIGN
WSA_COMM = SA_COMM
if WIV_PAGE=2 .and. IE_IVAUTO='N'
   WIV_SORT = '32'
else
   WIV_SORT = '31'
endif
if WOD_ID=IE_ODID
   WSA_AMT = CHK_RND(SA_AMT)
   WSA_PRE = CHK_RND(SA_PRE)
   FSA_PRE = CHK_RND(SA_PRE)
   WSA_TAX = CHK_RND(SA_TAX)
   WSA_OTHE = CHK_RND(SA_OTHE)
   WSA_CAMT = CHK_RND(SA_CAMT)
else
   WSA_AMT = SA_AMT
   WSA_PRE = SA_PRE
   FSA_PRE = SA_PRE
   WSA_TAX = SA_TAX
   WSA_OTHE = SA_OTHE
   WSA_CAMT = SA_CAMT
endif
@ 21, 8 SAY WSA_AMT PICTURE '99999999.99'
@ 21, 29 SAY WSA_PRE PICTURE '99999999.99'
@ 21, 46 SAY WSA_TAX PICTURE '99999999.99'
@ 21, 67 SAY WSA_OTHE PICTURE '9999999.99'
W_AMT = WSA_AMT+WSA_TAX-WSA_PRE+WSA_OTHE
FLG_IV = .F.
FLG_PRE = .F.
do WHILE .T.
   R_COD = P_COD
   select 1
   do CASE
      case R_COD=0
         select 1
         store SA_AMT TO WSA_AMT
         store SA_PRE TO WSA_PRE
         store SA_TAX TO WSA_TAX
         store SA_OTHE TO WSA_OTHE
         @ 21, 3 SAY '銷貨:            沖預收款:            稅額:            其它費用:          ' COLOR (CO_FORM)
         @ 21, 8 SAY WSA_AMT PICTURE '99999999.99'
         @ 21, 29 SAY WSA_PRE PICTURE '99999999.99'
         @ 21, 46 SAY WSA_TAX PICTURE '99999999.99'
         @ 21, 67 SAY WSA_OTHE PICTURE '9999999.99'
         unlock
         return
      case R_COD=1
         if IE_AMT='Y'
            @ 21, 8 GET WSA_AMT PICTURE '99999999.99'
            read
            @ 21, 8 SAY WSA_AMT PICTURE '99999999.99'
         endif
         do CHK_PCOD WITH P_COD
         if &rd_esc .or. &rd_up
            loop
         endif
      case R_COD=2
         if WSA_IVNO1#SPACE(10)
            TIV_TAXID = SUBSTR(' 2311',VAL(WSA_TAXID)+1,1)
            if WOD_ID=IE_ODID
               WSA_AMT = CHK_RND(WSA_AMT)
               WSA_PRE = CHK_RND(WSA_PRE)
               WSA_TAX = CHK_RND(WSA_TAX)
               WSA_OTHE = CHK_RND(WSA_OTHE)
            endif
            WNT_AMT = CHK_RND(WSA_AMT*WSA_RATE)
            WNT_PRE = CHK_RND(WSA_PRE*WSA_RATE)
            WNT_TAX = CHK_RND(WSA_TAX*WSA_RATE)
            WNT_OTHE = CHK_RND(WSA_OTHE*WSA_RATE)
            dimension DBF_ARY[ 2], TAG_ARY[ 2], ALIAS_ARY[ 2], ANO_ARY[ 2]
            = SET_DBF(2,DBF_SA+'rosa09','rosa09_1','sa09',0)
            = SET_DBF(1,DBF_FI+'roov01','roov01_1','ov01',0)
            do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
            if ERR_USE
               close DATABASES
               return
            endif
            TEX_AMT = 0
            select SA09
            set ORDER TO 1
            seek TSA_TYPE+A.SA_NO
            do WHILE  .not. EOF() .and. TSA_TYPE+A.SA_NO=SA_TYPE+SA_NO
               if IV_YN='Y'
                  TEX_AMT = TEX_AMT+CHK_RND(EX_AMT*WSA_RATE)
               endif
               select SA09
               skip
            enddo
            select SA09
            use
            select OV01
            seek '1'+WSA_IVNO1
            FLG_IV = .F.
            FLG_AD = .F.
            if EOF()
               WIV_AMT = WNT_AMT-WNT_PRE+TEX_AMT
               FLG_IV = .T.
               FLG_AD = .T.
            else
               if IV_SURE#'Y'
                  WIV_DATE = IV_DATE
                  WIV_AMT = WNT_AMT-WNT_PRE+TEX_AMT
                  FLG_IV = .T.
               else
                  FLG_IV = .F.
               endif
            endif
            use IN OV01
            if FLG_IV
               @ 21, 3 SAY '發票金額:           發票稅額:           發票日期:                         ' COLOR (CO_FORM)
               do CHK_GETN WITH 21, 12, WIV_AMT, '99999999', '0,'
               if &rd_esc .or. &rd_up
                  @ 21, 3 SAY '銷貨:            沖預收款:            稅額:            其它費用:          ' COLOR (CO_FORM)
                  @ 21, 8 SAY WSA_AMT PICTURE '99999999.99'
                  @ 21, 29 SAY WSA_PRE PICTURE '99999999.99'
                  @ 21, 46 SAY WSA_TAX PICTURE '99999999.99'
                  @ 21, 67 SAY WSA_OTHE PICTURE '9999999.99'
                  loop
               endif
               if WSA_TAXID='3'
                  WIV_TAX = ROUND(WIV_AMT*TA_TAX,0)
               else
                  WIV_TAX = 0
               endif
            else
               do CHK_PCOD WITH P_COD
            endif
         else
            do CHK_PCOD WITH P_COD
         endif
      case R_COD=3
         if FLG_IV
            if TIV_TAXID='1'
               WIV_TAX = ROUND(WIV_AMT*TA_TAX,0)
            endif
            do CHK_GETN WITH 21, 32, WIV_TAX, '99999999', '0,'
         else
            do CHK_PCOD WITH P_COD
         endif
      case R_COD=4
         if FLG_IV
            if WIV_DATE=SPACE(8)
               WIV_DATE = YMD
            endif
            do CHK_GETD WITH 21, 52, WIV_DATE, .T., R_COD, .F.
            @ 21, 3 SAY '銷貨:            沖預收款:            稅額:            其它費用:          ' COLOR (CO_FORM)
            @ 21, 8 SAY WSA_AMT PICTURE '99999999.99'
            @ 21, 29 SAY WSA_PRE PICTURE '99999999.99'
            @ 21, 46 SAY WSA_TAX PICTURE '99999999.99'
            @ 21, 67 SAY WSA_OTHE PICTURE '9999999.99'
         else
            do CHK_PCOD WITH P_COD
         endif
      case R_COD=5
         do CHK_PCOD WITH P_COD
      case R_COD=6
         if IE_AMT='Y'
            @ 21, 46 GET WSA_TAX PICTURE '99999999.99'
            read
            @ 21, 46 SAY WSA_TAX PICTURE '99999999.99'
         endif
         if &rd_up .or. &rd_esc
            loop
         endif
         if WOD_ID=IE_ODID
            WSA_TAX = CHK_RND(WSA_TAX)
         else
            WSA_TAX = ROUND(WSA_TAX,2)
         endif
         @ 21, 46 SAY WSA_TAX PICTURE '9999999.99'
         if WSA_PRE>WSA_AMT+WSA_TAX+WSA_OTHE
            do CHK_MSG WITH '沖預收款金額＞銷貨金額+稅額+其它費用!!'
            FLG_PRE = .T.
            P_COD = 7
            loop
         endif
         P_COD = P_COD+1
      case R_COD=7
         if SUBSTR(RIGHT0,6,1)='Y' .and. WSA_SURE#'Y'
            ?? CHR(7)
            if MESG_YN(' 是否確認 (Y/N) ？ ')
               store 0 TO T_AMT, W_AMT, W_TAX, W_CAMT
               select SA01
               seek WSA_NO
               do WHILE  .not. EOF() .and. WSA_NO=SA_NO
                  if SA_CH#'N'
                     if WSA_SIGN#SPACE(8) .and. WSA_SIGN#'  /  /  '
                        W_QTY = SA_ACQTY
                     else
                        W_QTY = SA_QTY
                     endif
                     WSA_SEQ = SA_SEQ
                     if WOD_ID=IE_ODID
                        T_AMT = T_AMT+CHK_RND(SA_PRICE*W_QTY)
                     else
                        T_AMT = T_AMT+ROUND(SA_PRICE*W_QTY,2)
                     endif
                     select SA05
                     seek WSA_NO+WSA_SEQ
                     do WHILE  .not. EOF() .and. SA_NO+SA_SEQ=WSA_NO+WSA_SEQ
                        if WOD_ID=IE_ODID
                           T_AMT = T_AMT+CHK_RND(SA_PRICE*SA_QTY)
                        else
                           T_AMT = T_AMT+ROUND(SA_PRICE*SA_QTY,2)
                        endif
                        skip
                     enddo
                     select SA06
                     seek WSA_NO+WSA_SEQ
                     do WHILE  .not. EOF() .and. SA_NO+SA_SEQ=WSA_NO+WSA_SEQ
                        if WOD_ID=IE_ODID
                           T_AMT = T_AMT+CHK_RND(SA_PRICE*SA_QTY)
                        else
                           T_AMT = T_AMT+ROUND(SA_PRICE*SA_QTY,2)
                        endif
                        skip
                     enddo
                  endif
                  select SA01
                  skip
               enddo
               do CASE
                  case WSA_TAXID='4'
                     if WOD_ID=IE_ODID
                        T_AMT = CHK_RND(T_AMT)
                        W_AMT = CHK_RND(T_AMT/(1+TA_TAX))
                     else
                        W_AMT = ROUND(T_AMT*WSA_RATE/(1+TA_TAX)/WSA_RATE,2)
                     endif
                     W_TAX = T_AMT-W_AMT
                     if WSA_PRE>0 .and. WSA_PRE<W_AMT
                        if WOD_ID=IE_ODID
                           W_TAX = CHK_RND((W_AMT-WSA_PRE)*TA_TAX)
                        else
                           W_TAX = ROUND((W_AMT-WSA_PRE)*WSA_RATE*TA_TAX/WSA_RATE,2)
                        endif
                     else
                        W_TAX = T_AMT-W_AMT
                     endif
                  case WSA_TAXID='3'
                     W_AMT = T_AMT
                     if WSA_PRE>=WSA_AMT
                        if WOD_ID=IE_ODID
                           W_TAX = CHK_RND(W_AMT*TA_TAX)
                        else
                           W_TAX = ROUND(W_AMT*WSA_RATE*TA_TAX/WSA_RATE,2)
                        endif
                     else
                        if WOD_ID=IE_ODID
                           W_TAX = CHK_RND((W_AMT-WSA_PRE)*TA_TAX)
                        else
                           W_TAX = ROUND((W_AMT-WSA_PRE)*WSA_RATE*TA_TAX/WSA_RATE,2)
                        endif
                     endif
                  otherwise
                     W_AMT = T_AMT
                     W_TAX = 0
               endcase
               if WOD_ID=IE_ODID
                  W_CAMT = CHK_RND(WSA_COMM*W_AMT*0.01)
               else
                  W_CAMT = ROUND(WSA_COMM*W_AMT*0.01,2)
               endif
               if WSA_AMT#W_AMT .or. WSA_TAX#W_TAX .or. WSA_CAMT#W_CAMT
                  if MESG_YN('金額與表身金額不相合,是否仍需確認？')
                     WSA_SURE = 'Y'
                  else
                     WSA_SURE = 'N'
                  endif
               else
                  WSA_SURE = 'Y'
               endif
            endif
         endif
         select 1
         do CHK_PCOD WITH P_COD
      case R_COD=8 .or. R_COD=-1
         MM = (WSA_AMT+WSA_TAX-WSA_PRE+WSA_OTHE)-W_AMT
         if MM#0
            select CU00
            seek WSA_BIL
            do WHILE _RLOCK(30)
            enddo
            replace CU_AR WITH CU_AR+ROUND(MM*WSA_RATE,0)
            unlock
            if CU_CRDT-CU_AR-CU_CK<0 .and. CU_CRDT>0
               do CHK_MSG WITH '此客戶已超過授信額度'+STR((CU_CRDT-CU_AR-CU_CK)*-1,12,2)+'元'
            endif
         endif
         select 1
         seek WSA_NO
         if EOF()
            return
         endif
         do WHILE _RLOCK(30)
         enddo
         replace SA_AMT WITH WSA_AMT
         replace SA_PRE WITH WSA_PRE
         replace SA_TAX WITH WSA_TAX
         replace SA_OTHE WITH WSA_OTHE
         replace SA_SURE WITH WSA_SURE
         replace IV_AMT WITH WIV_AMT
         replace IV_TAX WITH WIV_TAX
         replace IV_DATE WITH WIV_DATE
         exit
   endcase
enddo
return

procedure ROSA00_O
ARR1( 1) = 0
CNT1 = 1
WAR_LIST = WSA_NO
save SCREEN TO F_SCREEN
@ 16, 3 CLEAR TO 21, 77
set colo to &co_form
@ 14, 1 SAY '├─────────────────────────────────────┤'
@ 15, 1 SAY '│序 收款單號  預收類別 收款日期 匯    率 待 沖 餘 額 預定沖抵額 沖 帳 金 額│'
@ 16, 1 SAY '│號 ========= ======== ======== ======== =========== ========== ===========│'
@ 17, 1 SAY '│１                                                                        │'
@ 18, 1 SAY '│２                                                                        │'
@ 19, 1 SAY '│３                                                                        │'
@ 20, 1 SAY '│４                                                                        │'
@ 21, 1 SAY '│５                                                                        │'
@ 22, 1 SAY '└─────────────────────────────────────┘'
set colo to &co_say
FLG_ADD = .F.
do WHILE .T.
   CNT1 = 1
   OPTION = '（  預收款沖抵  ）'
   @ 2,3 say option colo &co_sys
   do ROSA00_N
   set color to &co_key
   MSG00 = '預收餘額('+AR15.OD_ID+'):'+STR(AR15.RE_AMT,12,2)
   MSG01 = '[F1]內容新增 [F2]內容修改 [F3]內容刪除 [↑]上頁 [↓]下頁 [Esc]結束'
   @ 23, 0 CLEAR
   @ 23, (80-LEN(MSG00))/2 SAY MSG00
   @ 24, (80-LEN(MSG01))/2 SAY MSG01
   set colo to &co_say
   do WHILE .T.
      P_KEY = INKEY(0)
      if P_KEY#TC_ESC .and. P_KEY#TC_F1 .and. P_KEY#TC_DN .and. P_KEY#TC_F3 .and. P_KEY#TC_F2 .and. P_KEY#TC_UP
         loop
      endif
      if P_KEY=TC_F1 .or. P_KEY=TC_F2 .or. P_KEY=TC_F3
         FLG_PRE = .T.
         if A.SA_DATE<=WSYS_YM
            do CHK_MSG WITH WSYS_YM+'前銷貨資料已確認不得異動!!'
            FLG_PRE = .F.
            loop
         endif
         if A.SA_DATE<=WSYS_YM1
            do CHK_MSG WITH WSYS_YM+'前應收帳款資料已確認不得異動!!'
            FLG_PRE = .F.
            loop
         endif
         select AR00
         seek A.SA_BIL+A.SA_NO+' '+WAR_RENO
         if AR_SURE#' '
            do CHK_MSG WITH '此銷貨單之應收憑單已確認不得異動!!'
            FLG_PRE = .F.
            select AR16
            loop
         endif
         if SA_ACPT+SA_DISCD#0
            do CHK_MSG WITH '此銷貨單之應收憑單已有帳款沖帳記錄不得異動!!'
            FLG_PRE = .F.
            select AR15
            loop
         endif
         select 1
         if _RLOCK(30)
            loop
         endif
         select AR15
      endif
      exit
   enddo
   select AR10
   do CASE
      case P_KEY=TC_ESC
         select 1
         if SA_PRE>SA_AMT+SA_TAX+SA_OTHE
            do CHK_MSG WITH '沖預收款金額＞銷貨金額+稅額+其它費用!!'
            ARR1( 1) = 0
         endif
         return
      case P_KEY=TC_F1
         if SUBSTR(RIGHT0,2,1)#'Y'
            do CHK_MSG WITH '使用者在本作業無新增之權限'
            loop
         endif
         OPTION = '（ 內 容 新 增  ）'
         @ 2,3 say option colo &co_sys
         do WHILE CNT1=6
            skip 1
            if EOF()
               ARR1( 1) = 0
            else
               CNT1 = 1
               do ROSA00_N
            endif
            if ARR1(1)=0
               skip -1
               CNT1 = 1
               do ROSA00_N
            endif
         enddo
         select AR10
         do ROSA00_M WITH 'B'
         if ARR1(1)#0
            goto ARR1(1)
         endif
      case P_KEY=TC_F2
         if SUBSTR(RIGHT0,3,1)#'Y'
            do CHK_MSG WITH '使用者在本作業無修改之權限'
            loop
         endif
         OPTION = '（ 內 容 修 改  ）'
         @ 2,3 say option colo &co_sys
         @ 23, 0 CLEAR TO 24, 78
         MR = ' '
         @ 23, 5 SAY '編 修 序 號 :' COLOR (CO_KEY) GET MR PICTURE '9'
         read
         @ 23, 5 SAY SPACE(70)
         MN = VAL(MR)
         if mn<=0 .or. mn>5 .or. arr1(mn)=0 .or. &rd_esc
            loop
         endif
         select AR10
         goto ARR1(MN)
         if _RLOCK(30)
            loop
         endif
         do ROSA00_M WITH 'C'
         goto ARR1(1)
      case P_KEY=TC_F3
         if SUBSTR(RIGHT0,4,1)#'Y'
            do CHK_MSG WITH '使用者在本作業無刪除之權限'
            loop
         endif
         save SCREEN TO DELSCR
         OPTION = '（ 內 容 刪 除  ）'
         @ 2,3 say option colo &co_sys
         @ 23, 0 CLEAR TO 24, 78
         MR = ' '
         @ 23, 5 SAY '刪 除 序 號 :' COLOR (CO_KEY) GET MR PICTURE '9'
         read
         @ 23, 5 SAY SPACE(65)
         MN = VAL(MR)
         if mn<=0 .or. mn>5 .or. arr1(mn)=0 .or. &rd_esc
            loop
         endif
         select AR10
         goto ARR1(MN)
         if _RLOCK(30)
            loop
         endif
         do ROSA00_M WITH 'D'
         if ARR1(1)#0
            goto ARR1(1)
         endif
      case P_KEY=TC_UP
         if ARR1(1)#0 .and. RECNO()#ARR1(1)
            goto ARR1(1)
         endif
         I = 1
         do WHILE  .not. BOF() .and. AR_RENO+AR_LIST=WAR_RENO+WAR_LIST .and. I<=5
            skip -1
            I = I+1
         enddo
         if BOF() .or. AR_RENO+AR_LIST#WAR_RENO+WAR_LIST
            do CHK_MSG WITH '已無上頁明細!!'
            seek WAR_RENO+WAR_LIST
         endif
         loop
      case P_KEY=TC_DN
         if CNT1>5
            goto ARR1(5)
            skip 1
            if EOF() .or. AR_RENO+AR_LIST#WAR_RENO+WAR_LIST
               do CHK_MSG WITH '已無下頁明細!!'
               goto ARR1(1)
            endif
         else
            do CHK_MSG WITH '已無下頁明細!!'
         endif
         loop
   endcase
   if P_KEY=TC_F1 .or. P_KEY=TC_F2 .or. P_KEY=TC_F3
      WSA_PRE = 0
      select AR10
      REC = RECNO()
      seek WAR_RENO+WAR_LIST
      if  .not. EOF()
         do WHILE  .not. EOF() .and. AR_RENO+AR_LIST=WAR_RENO+WAR_LIST
            WSA_PRE = WSA_PRE+AR_AMT
            skip
         enddo
         goto REC
      else
         REC = 0
      endif
      select 1
      if SA_TAXID$'34'
         if WSA_PRE#FSA_PRE .and. WSA_PRE<WSA_AMT
            if OD_ID=IE_ODID
               WSA_TAX = ROUND((WSA_AMT-WSA_PRE)*TA_TAX,0)
            else
               WSA_TAX = ROUND((WSA_AMT-WSA_PRE)*SA_RATE*TA_TAX/SA_RATE,2)
            endif
         endif
      else
         WSA_TAX = 0
      endif
      select 1
      replace SA_PRE WITH WSA_PRE
      replace SA_TAX WITH WSA_TAX
      if SA_SURE='Y' .and. SA_ID$'12'
         FSA_BIL = SA_BIL
         select SA01
         seek WSA_NO
         TEL_NO = EL_NO
         FLG_YN = .T.
         FLG_IVYN = .T.
         use IN AR10
         use IN AR16
         do ROSA00_R
         dimension DBF_ARY[ 2], TAG_ARY[ 2], ALIAS_ARY[ 2], ANO_ARY[ 2]
         = SET_DBF(2,DBF_FI+'roar10','roar10_1','ar10',0)
         = SET_DBF(1,DBF_FI+'roar16','roar16_1','ar16',0)
         do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
         if ERR_USE
            close DATABASES
            return
         endif
      endif
      if REC#0
         select AR10
         goto REC
      endif
      select 1
      unlock
   endif
enddo

procedure ROSA00_N
select AR10
if ARR1(1)=0
   seek WAR_RENO+WSA_NO
   CNT1 = 1
endif
do WHILE  .not. EOF() .and. CNT1<=5 .and. AR_RENO+AR_LIST=WAR_RENO+WSA_NO
   select AR16
   seek AR10.RE_LIST+AR10.RE_IDCOD
   select AR10
   @ 16+CNT1, 6 SAY RE_LIST
   do CASE
      case RE_IDCOD='A'
         @ 16+CNT1, 16 SAY '預收款  '
      case RE_IDCOD='O'
         @ 16+CNT1, 16 SAY '沖帳餘額'
      otherwise
         @ 16+CNT1, 16 SAY '        '
   endcase
   @ 16+CNT1, 25 SAY AR16.RE_DATE
   @ 16+CNT1, 34 SAY AR16.AR_RATE PICTURE '999.9999'
   @ 16+CNT1, 43 SAY AR_NAMT PICTURE '99999999.99'
   @ 16+CNT1, 55 SAY AR_QUE PICTURE '9999999.99'
   @ 16+CNT1, 66 SAY AR_AMT PICTURE '99999999.99'
   ARR1( CNT1) = RECNO()
   CNT1 = CNT1+1
   skip 1
enddo
I = CNT1
if I<=5
   @ 16+I, 6 CLEAR TO 21, 76
   ARR1( I) = 0
   I = I+1
endif
do WHILE I<=5
   ARR1( I) = 0
   I = I+1
enddo
if ARR1(1)#0
   goto ARR1(1)
endif
return

procedure ROSA00_M
parameter FUNC1
FUNC1 = UPPER(FUNC1)
SCOR = .F.
WCU_NO = A.SA_BIL
WOD_ID = A.OD_ID
WAR_RATE = A.SA_RATE
WAR_DATE = A.SA_DATE
TOTL_AMT = 0
select AR10
if FUNC1$'BC'
   MSG00 = '預收款類別: A.預收款  B.沖帳餘額                                .'
   MSG01 = '[↑]往前修改.  [↓]往後修改.  [PgDn]本筆存入.  [Esc]本筆退出不存.'
   @ 23, 0 CLEAR
   @ 23, (80-LEN(MSG00))/2 SAY MSG00 COLOR (CO_KEY)
   @ 24, (80-LEN(MSG01))/2 SAY MSG01 COLOR (CO_KEY)
endif
if FUNC1$'CD'
   WRE_LIST = RE_LIST
   WRE_IDCOD = RE_IDCOD
   FRE_LIST = RE_LIST
   FRE_IDCOD = RE_IDCOD
   WAR_AMT = AR_AMT
   MAR_AMT = AR_AMT
   WAR_QUE = AR_QUE
   MAR_QUE = AR_QUE
   WAR_NAMT = AR_NAMT
   SV_REC = RECNO()
endif
do WHILE .T.
   select AR10
   if FUNC1$'AB'
      if CNT1>5
         SCOR = .T.
         CNT1 = 1
         ARR1( 1) = ARR1(2)
         goto ARR1(1)
         do ROSA00_N
      endif
      WRE_LIST = SPACE(LEN(RE_LIST))
      WRE_IDCOD = SPACE(LEN(RE_IDCOD))
      store 0 TO WAR_AMT, WAR_NAMT
      MN = CNT1
   endif
   P_COD = 1
   do WHILE .T.
      if FUNC1='D'
         set color to &co_mesg
      endif
      R_COD = P_COD
      if FUNC1$'D'
         select AR16
         seek WRE_LIST+WRE_IDCOD
         select AR10
         @ 16+MN, 6 SAY WRE_LIST
         do CASE
            case WRE_IDCOD='A'
               @ 16+MN, 16 SAY '預收款  '
            case WRE_IDCOD='O'
               @ 16+MN, 16 SAY '沖帳餘額'
            otherwise
               @ 16+MN, 16 SAY '        '
         endcase
         @ 16+MN, 25 SAY AR16.RE_DATE
         @ 16+MN, 34 SAY AR16.AR_RATE PICTURE '999.9999'
         @ 16+MN, 43 SAY WAR_NAMT PICTURE '99999999.99'
         @ 16+MN, 55 SAY WAR_QUE PICTURE '9999999.99'
         @ 16+MN, 66 SAY WAR_AMT PICTURE '99999999.99'
      endif
      if FUNC1='D'
         set colo to &co_say
         select AR10
         if MESG_YN(' 確定刪除 (Y/N) ？ ')
            if ROSA00_V('D')
               return
            endif
            select AR10
            do WHILE .T.
               if _RLOCK(30)
                  loop
               endif
               exit
            enddo
            delete
            unlock
            select AR10
            if MN=1 .and. ARR1(2)>0
               ARR1( 1) = ARR1(2)
            endif
            if MN=1 .and. ARR1(2)=0
               ARR1( 1) = 0
            endif
         endif
         unlock
         select AR10
         return
      endif
      do CASE
         case R_COD=0
            select AR10
            if FUNC1$'AB'
               @ 16+MN, 6 SAY SPACE(70)
               if SCOR
                  seek AR_RENO+WAR_LIST
                  if EOF()
                     goto BOTTOM
                     WAR_RENO = AR_RENO
                     WAR_LIST = AR_LIST
                  endif
                  ARR( 1) = 0
                  CNT1 = 1
                  do ROSA00_N
               endif
            endif
            return
         case R_COD=1
            select AR16
            set ORDER TO roar16_2
            TITAL = '收款單號  預收類別 收款日期  預收金額  待沖餘額 預定沖抵額 幣別 匯    率'
            TITAL1 = '========= ======== ======== ========= ========= ========== ==== ========'
            WINF = 'F'
            do CHK_WINX WITH LEN(TITAL)+2, 'ar_list', "+re_idcod+'        '+re_date+' '+str(re_amt,9,2)+' '+str(re_namt,9,2)+' '+str(re_que,10,2)+' '+od_id+'  '+str(ar_rate,8,4)", 16+MN, 6, WINF, WRE_LIST, 'cu_no+od_id,wcu_no+wod_id'
            R_FLG = .F.
            do CHK_WINF WITH P_COD, WINF, .F., R_FLG
            if R_FLG
               set ORDER TO roar16_1
               @ 16+MN, 6 SAY WRE_LIST
               loop
            endif
            WRE_LIST = AR_LIST
            WRE_IDCOD = RE_IDCOD
            @ 16+MN, 6 SAY WRE_LIST
            do CASE
               case WRE_IDCOD='A'
                  @ 16+MN, 16 SAY '預收款  '
               case WRE_IDCOD='O'
                  @ 16+MN, 16 SAY '沖帳餘額'
               otherwise
                  @ 16+MN, 16 SAY '        '
            endcase
            @ 16+MN, 25 SAY RE_DATE
            @ 16+MN, 34 SAY AR_RATE PICTURE '999.9999'
            WAR_NAMT = RE_NAMT
            WAR_QUE = RE_QUE
            select AR16
            set ORDER TO roar16_1
            if FUNC1='C' .and. FRE_LIST+FRE_IDCOD=WRE_LIST+WRE_IDCOD
               WAR_NAMT = WAR_NAMT+MAR_AMT
               WAR_QUE = WAR_QUE+MAR_QUE
            else
               WAR_NAMT = WAR_NAMT
            endif
            if WAR_NAMT-WAR_QUE<=0
               do CHK_MSG WITH '此筆預收款已無可沖抵餘額!!'
               P_COD = 1
               loop
            endif
         case R_COD=2
            if WAR_AMT=0
               WAR_AMT = WAR_NAMT-WAR_QUE
            endif
            @ 16+MN, 43 SAY WAR_NAMT PICTURE '99999999.99'
            @ 16+MN, 55 SAY WAR_QUE PICTURE '9999999.99'
            @ 16+MN, 66 GET WAR_AMT PICTURE '99999999.99'
            read
            @ 16+MN, 66 SAY WAR_AMT PICTURE '99999999.99'
            do CHK_PCOD WITH P_COD
            if &rd_up .and. &rd_esc
               loop
            endif
            if WAR_AMT>WAR_NAMT-WAR_QUE
               do CHK_MSG WITH '沖帳金額超過可沖預收金額'
               P_COD = 2
               loop
            endif
         case R_COD=3 .or. R_COD=-1
            if FUNC1$'ABE'
               do ROSA00_V WITH 'I'
            endif
            if FUNC1$'C'
               do ROSA00_V WITH 'M'
            endif
            select AR10
            if FUNC1#'C'
               append BLANK
            else
               goto ARR1(MN)
            endif
            if _RLOCK(30)
               return
            endif
            replace AR_RENO WITH WAR_RENO
            replace AR_LIST WITH WAR_LIST
            replace AR_DATE WITH WAR_DATE
            replace RE_LIST WITH WRE_LIST
            replace RE_IDCOD WITH WRE_IDCOD
            replace AR_AMT WITH WAR_AMT
            replace AR_NAMT WITH WAR_NAMT
            replace AR_QUE WITH WAR_QUE
            replace OD_ID WITH WOD_ID
            replace AR_RATE WITH A.SA_RATE
            unlock
            if FUNC1#'C'
               do ROSA00_N
            endif
            exit
      endcase
   enddo
   if FUNC1='C'
      select AR10
      return
   endif
enddo

function  ROSA00_V
parameter FCOD
FCOD = UPPER(FCOD)
ERR_F = .F.
select 1
TCU_NO = CU_NO
TOD_ID = OD_ID
T_LOOP = 1
do WHILE T_LOOP<=2
   if (FCOD='M' .or. FCOD='D') .and. T_LOOP=1
      select AR10
      TRE_LIST = RE_LIST
      TRE_IDCOD = RE_IDCOD
      TAR_AMT = AR_AMT*-1
   endif
   if (FCOD='I' .or. FCOD='M') .and. T_LOOP=2
      select AR10
      TRE_LIST = WRE_LIST
      TRE_IDCOD = WRE_IDCOD
      TAR_AMT = WAR_AMT
   endif
   if ((FCOD='M' .or. FCOD='D') .and. T_LOOP=1) .or. ((FCOD='I' .or. FCOD='M') .and. T_LOOP=2)
      select AR16
      seek TRE_LIST+TRE_IDCOD
      if  .not. EOF()
         do WHILE .T.
            if _RLOCK(30)
               loop
            endif
            exit
         enddo
         replace RE_ACPT WITH RE_ACPT+TAR_AMT
         replace RE_NAMT WITH RE_AMT-RE_ACPT
         unlock
      endif
      select AR15
      seek WCU_NO+WOD_ID
      if  .not. EOF()
         do WHILE _RLOCK(30)
         enddo
         replace RE_AMT WITH RE_AMT-TAR_AMT
         replace RE_NTAMT WITH RE_NTAMT-ROUND(TAR_AMT*A.SA_RATE,0)
         unlock
      endif
   endif
   T_LOOP = T_LOOP+1
enddo
return ERR_F

function  ROSA_U
parameter FCOD
FCOD = UPPER(FCOD)
ERR_F = .F.
select 1
WSA_AMT = SA_AMT
WSA_PRE = SA_PRE
WSA_TAX = SA_TAX
WSA_OTHE = SA_OTHE
WSA_ACID = SA_ACID
WSA_SIGN = SA_SIGN
WCU_NO = CU_NO
WOD_ID = OD_ID
WSA_NO = SA_NO
WSA_CHARG = SA_CHARG
WSA_TAXID = SA_TAXID
WSA_RATE = SA_RATE
WSA_LTDAT = SA_LTDAT
WSA_CHDAT = SA_CHDAT
WSA_DATE = SA_DATE
WCU_SALE = CU_SALE
WSA_COMM = SA_COMM
WSA_CAMT = SA_CAMT
WSA_BIL = SA_BIL
WSA_IVNO1 = SA_IVNO1
W_AMT = (WSA_AMT+WSA_TAX+WSA_OTHE-WSA_PRE)
if (FCOD='M' .or. FCOD='D')
   select 2
   TOD_NO = OD_NO
   TEL_NO = EL_NO
   TOD_SERNO = OD_SERNO
   TSA_QTY = SA_QTY
   TOD_PDID = OD_PDID
   TSA_SEQ = SA_SEQ
   TSA_CH = SA_CH
   if  .not. ' '$WSA_SIGN
      TSA_QTY = SA_ACQTY*-1
   else
      TSA_QTY = SA_QTY*-1
   endif
   TSA_PRICE = SA_PRICE
   if WOD_ID=IE_ODID
      TSA_AMT = CHK_RND(TSA_PRICE*TSA_QTY)
   else
      TSA_AMT = ROUND(TSA_PRICE*TSA_QTY,2)
   endif
   select OD01
   seek TOD_NO
   if  .not. EOF()
      do WHILE _RLOCK(30)
      enddo
      replace OD_DLQTY WITH OD_DLQTY+TSA_QTY
      unlock
      N_ODQTY = OD_QTY+OD_BKQTY-OD_DLQTY
      OVER_QTY = OD_DLQTY-OD_BKQTY-OD_QTY
      if OVER_QTY<0
         OVER_QTY = 0
      endif
   endif
   if TOD_PDID='O ' .or. TOD_PDID='S ' .or. TOD_PDID='  '
      select OD01
      if  .not. EOF()
         select MT00
         seek TEL_NO
         if EOF()
            append BLANK
         endif
         do WHILE .T.
            if _RLOCK(30)
               loop
            endif
            exit
         enddo
         replace EL_NO WITH TEL_NO
         replace MT_ODQTY WITH MT_ODQTY-TSA_QTY+OVER_QTY
         unlock
      endif
   else
      dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
      = SET_DBF(1,DBF_SA+'rood18','rood18_2','od18',0)
      do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
      if ERR_USE
         close DATABASES
         return
      endif
      select SA06
      seek WSA_NO+TSA_SEQ
      do WHILE  .not. EOF() .and. SA_NO+SA_SEQ=WSA_NO+TSA_SEQ
         FSA_QTY = SA_QTY*-1
         TSA_AMT = TSA_AMT+ROUND(FSA_QTY*SA_PRICE,2)
         TEL_NO = EL_NO
         select OD18
         seek TOD_NO+TEL_NO
         N_ODQTY = OD_QTY+OD_BKQTY-OD_DLQTY
         OVER_QTY = OD_DLQTY-OD_BKQTY-OD_QTY
         if OVER_QTY<0
            OVER_QTY = 0
         endif
         do WHILE .T.
            if _RLOCK(30)
               loop
            endif
            exit
         enddo
         replace OD_DLQTY WITH OD_DLQTY+FSA_QTY
         unlock
         select MT00
         seek TEL_NO
         if EOF()
            append BLANK
         endif
         do WHILE .T.
            if _RLOCK(30)
               loop
            endif
            exit
         enddo
         replace EL_NO WITH TEL_NO
         replace MT_ODQTY WITH IIF(MT_ODQTY-FSA_QTY>=0,MT_ODQTY-FSA_QTY,0)
         unlock
         select SA06
         do WHILE .T.
            if _RLOCK(30)
               loop
            endif
            exit
         enddo
         delete
         unlock
         skip
      enddo
      select OD18
      use
   endif
   TSA_CAMT = 0
   if WOD_ID=IE_ODID
      TSA_CAMT = CHK_RND(WSA_COMM*TSA_AMT*0.01)
   else
      TSA_CAMT = ROUND(WSA_COMM*TSA_AMT*0.01,2)
   endif
   WSA_AMT = WSA_AMT+IIF(TSA_CH='Y',TSA_AMT,0)
   WSA_CAMT = WSA_CAMT+IIF(TSA_CH='Y',TSA_CAMT,0)
   if WSA_TAXID#'4'
      if WSA_TAXID='3'
         if WOD_ID=IE_ODID
            if WSA_PRE<WSA_AMT
               WSA_TAX = CHK_RND((WSA_AMT-WSA_PRE)*TA_TAX)
            else
               WSA_TAX = CHK_RND(WSA_AMT*TA_TAX)
            endif
         else
            if WSA_PRE<WSA_AMT
               WSA_TAX = ROUND((WSA_AMT-WSA_PRE)*WSA_RATE*TA_TAX/WSA_RATE,2)
            else
               WSA_TAX = ROUND(WSA_AMT*WSA_RATE*TA_TAX/WSA_RATE,2)
            endif
         endif
      else
         WSA_TAX = 0
      endif
   endif
   select CU00
   seek WSA_BIL
   do WHILE _RLOCK(30)
   enddo
   if TSA_CH='Y'
      replace CU_ODAMT WITH IIF(CU_ODAMT-TSA_AMT<0,0,CU_ODAMT-TSA_AMT)
   endif
   unlock
   select 1
   do WHILE _RLOCK(30)
   enddo
   replace SA_AMT WITH WSA_AMT
   replace SA_TAX WITH WSA_TAX
   replace SA_CAMT WITH WSA_CAMT
   if FLG_DISP .and. TC_PR='Y'
      if WOD_ID=IE_ODID
         @ 21, 8 SAY CHK_RND(WSA_AMT) PICTURE '99999999.99'
         @ 21, 29 SAY CHK_RND(WSA_PRE) PICTURE '99999999.99'
         @ 21, 46 SAY CHK_RND(WSA_TAX) PICTURE '99999999.99'
         @ 21, 67 SAY CHK_RND(WSA_OTHE) PICTURE '9999999.99'
      else
         @ 21, 8 SAY WSA_AMT PICTURE '99999999.99'
         @ 21, 29 SAY WSA_PRE PICTURE '99999999.99'
         @ 21, 46 SAY WSA_TAX PICTURE '99999999.99'
         @ 21, 67 SAY WSA_OTHE PICTURE '9999999.99'
      endif
   endif
endif
if (FCOD='I' .or. FCOD='M')
   TOD_SERNO = WOD_SERNO
   TEL_NO = WEL_NO
   TSA_QTY = WSA_QTY
   TOD_NO = WOD_NO
   TSA_CH = WSA_CH
   if  .not. ' '$WSA_SIGN
      TSA_QTY = WSA_ACQTY
   else
      TSA_QTY = WSA_QTY
   endif
   TOD_PDID = WOD_PDID
   TSA_SEQ = WSA_SEQ
   TSA_PRICE = WSA_PRICE
   if WOD_ID=IE_ODID
      TSA_AMT = CHK_RND(TSA_PRICE*TSA_QTY)
   else
      TSA_AMT = ROUND(TSA_PRICE*TSA_QTY,2)
   endif
   select OD01
   seek TOD_NO
   if  .not. EOF()
      do WHILE _RLOCK(30)
      enddo
      replace OD_DLQTY WITH OD_DLQTY+TSA_QTY
      unlock
      N_ODQTY = OD_QTY+OD_BKQTY-OD_DLQTY
      if N_ODQTY<0
         N_ODQTY = 0
      endif
      OVER_QTY = OD_DLQTY-OD_BKQTY-OD_QTY
      if OVER_QTY<0
         OVER_QTY = 0
      endif
   else
      N_ODQTY = 0
   endif
   if TOD_PDID='O ' .or. TOD_PDID='S ' .or. TOD_PDID='  '
      select OD01
      if  .not. EOF()
         select MT00
         seek TEL_NO
         if EOF()
            append BLANK
         endif
         do WHILE _RLOCK(30)
         enddo
         replace EL_NO WITH TEL_NO
         replace MT_ODQTY WITH MT_ODQTY-TSA_QTY+OVER_QTY
         unlock
      endif
   else
      dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
      = SET_DBF(1,DBF_SA+'rood18','rood18_2','od18',0)
      do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
      if ERR_USE
         close DATABASES
         return
      endif
      select OD18
      seek TOD_NO
      do WHILE  .not. EOF() .and. OD_NO=TOD_NO
         if TSA_QTY=N_ODQTY
            FSA_QTY = OD_QTY+OD_BKQTY-OD_DLQTY
         else
            FSA_QTY = TSA_QTY*OD_UQTY/OD_UNIT
         endif
         if FSA_QTY>0
            N_ODQTY = OD_QTY+OD_BKQTY-OD_DLQTY
            OVER_QTY = OD_DLQTY-OD_BKQTY-OD_QTY
            if OVER_QTY<0
               OVER_QTY = 0
            endif
            TSA_AMT = TSA_AMT+ROUND(FSA_QTY*OD_PRICE,2)
            TEL_NO = EL_NO
            do WHILE _RLOCK(30)
            enddo
            replace OD_DLQTY WITH OD_DLQTY+FSA_QTY
            unlock
            select MT00
            seek TEL_NO
            if EOF()
               append BLANK
            endif
            do WHILE _RLOCK(30)
            enddo
            replace EL_NO WITH TEL_NO
            replace MT_ODQTY WITH MT_ODQTY-FSA_QTY+OVER_QTY
            if MT_ODQTY<0
               replace MT_ODQTY WITH 0
            endif
            unlock
            select SA06
            append BLANK
            do WHILE _RLOCK(30)
            enddo
            replace SA_NO WITH WSA_NO
            replace SA_SEQ WITH WSA_SEQ
            replace EL_NO WITH TEL_NO
            replace OD_NO WITH TOD_NO
            replace SA_SEQ1 WITH OD18.OD_SEQ
            replace SA_PRICE WITH OD18.OD_PRICE
            replace SA_UNIT WITH OD18.OD_UNIT
            replace SA_UQTY WITH OD18.OD_UQTY
            replace SA_RATE1 WITH OD18.OD_RATE
            replace SA_QTY WITH FSA_QTY
            replace SA_TAXID WITH WSA_TAXID
            replace SA_RATE WITH WSA_RATE
            replace SA_DATE WITH WSA_DATE
            replace CU_NO WITH WCU_NO
            replace CU_SALE WITH WCU_SALE
            replace DP_NO WITH WDP_NO
            replace OD_ID WITH WOD_ID
            replace SA_ID WITH WSA_ID
            unlock
         endif
         select OD18
         skip
      enddo
      select OD18
      use
   endif
   TSA_CAMT = 0
   if WOD_ID=IE_ODID
      TSA_CAMT = CHK_RND(WSA_COMM*TSA_AMT*0.01)
   else
      TSA_CAMT = ROUND(WSA_COMM*TSA_AMT*0.01,2)
   endif
   WSA_AMT = WSA_AMT+IIF(TSA_CH='Y',TSA_AMT,0)
   WSA_CAMT = WSA_CAMT+IIF(TSA_CH='Y',TSA_CAMT,0)
   if WSA_TAXID#'4'
      if WSA_TAXID='3'
         if WOD_ID=IE_ODID
            if WSA_PRE<WSA_AMT
               WSA_TAX = CHK_RND((WSA_AMT-WSA_PRE)*TA_TAX)
            else
               WSA_TAX = CHK_RND(WSA_AMT*TA_TAX)
            endif
         else
            if WSA_PRE<WSA_AMT
               WSA_TAX = ROUND((WSA_AMT-WSA_PRE)*WSA_RATE*TA_TAX/WSA_RATE,2)
            else
               WSA_TAX = ROUND(WSA_AMT*WSA_RATE*TA_TAX/WSA_RATE,2)
            endif
         endif
      else
         WSA_TAX = 0
      endif
   endif
   select 1
   do WHILE _RLOCK(30)
   enddo
   replace SA_AMT WITH WSA_AMT
   replace SA_TAX WITH WSA_TAX
   replace SA_CAMT WITH WSA_CAMT
   if FLG_DISP .and. TC_PR='Y'
      if WOD_ID=IE_ODID
         @ 21, 8 SAY CHK_RND(WSA_AMT) PICTURE '99999999.99'
         @ 21, 29 SAY CHK_RND(WSA_PRE) PICTURE '99999999.99'
         @ 21, 46 SAY CHK_RND(WSA_TAX) PICTURE '99999999.99'
         @ 21, 67 SAY CHK_RND(WSA_OTHE) PICTURE '9999999.99'
      else
         @ 21, 8 SAY WSA_AMT PICTURE '99999999.99'
         @ 21, 29 SAY WSA_PRE PICTURE '99999999.99'
         @ 21, 46 SAY WSA_TAX PICTURE '99999999.99'
         @ 21, 67 SAY WSA_OTHE PICTURE '9999999.99'
      endif
   endif
endif
select 2
return ERR_F

procedure ROSA00_F
do WHILE .T.
   set colo to &co_form
   @ 10, 10 CLEAR TO 19, 70
   @ 10, 11 SAY '┌───────────────────────────┐'
   @ 11, 11 SAY '│                                                      │'
   @ 12, 11 SAY '│                                                      │'
   @ 13, 11 SAY '│                                                      │'
   @ 14, 11 SAY '│                                                      │'
   @ 15, 11 SAY '│    銷貨單號:             至                          │'
   @ 16, 11 SAY '│                                                      │'
   @ 17, 11 SAY '│                                                      │'
   @ 18, 11 SAY '│                                                      │'
   @ 19, 11 SAY '│                                   （ 按[Esc]結束 ）  │'
   @ 20, 11 SAY '└───────────────────────────┘'
   set colo to &co_say
   W_NOL = SA00.SA_NO
   W_NOH = SA00.SA_NO
   WCU_SALE = SPACE(5)
   W_YN = 'Y'
   P_COD = 1
   do WHILE .T.
      R_COD = P_COD
      @ 15, 26 SAY W_NOL
      @ 15, 42 SAY W_NOH
      do CASE
         case R_COD=0
            unlock ALL
            return
         case R_COD=1
            select SA00
            set RELATION TO CU_NO INTO 6
            TITAL = '銷貨單號  客戶簡稱 銷貨日期 結帳日期 貨款期限 確認'
            TITAL1 = '========= ======== ======== ======== ======== ===='
            WINF = 'F'
            do CHK_WIN WITH LEN(TITAL)+2, 'sa_no', "cu00->cu_na+' '+sa_date+' '+sa_chdat+' '+sa_ltdat+' '+sa_sure", 15, 26, WINF, W_NOL
            R_FLG = .F.
            do CHK_WINF WITH P_COD, WINF, .F., R_FLG
            set RELATION TO
            if R_FLG
               loop
            endif
            store SA_NO TO W_NOL, W_NOH
         case R_COD=2
            WINF = 'F'
            do CHK_WIN WITH LEN(TITAL)+2, 'sa_no', "cu00->cu_na+' '+sa_date+' '+sa_chdat+' '+sa_ltdat+' '+sa_sure", 15, 42, WINF, W_NOH
            R_FLG = .F.
            do CHK_WINF WITH P_COD, WINF, .F., R_FLG
            if R_FLG
               loop
            endif
            W_NOH = SA_NO
         case R_COD=3 .or. R_COD=-1
            exit
      endcase
   enddo
   if  .not. MESG_YN(' 確定執行 (Y/N) ？ ')
      loop
   else
      do CHK_MSG WITH '銷貨單確認,轉製應收憑單中,請稍待', 'S'
      dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
      = SET_DBF(1,DBF_SA+'rood20','rood20_1','od20',0)
      do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
      if ERR_USE
         close DATABASES
         return
      endif
      select SA00
      seek W_NOL
      do WHILE  .not. EOF() .and. SA_NO<=W_NOH
         FLG_BL = .T.
         if SA_ID$'12' .and. (SA_AMT>0 .or. SA_OTHE#0)
            if OD_SATYP='2' .and. IE_RATE1='Y'
               TR_DATE = SA00.SA_DATE
               set NEAR ON
               select OD20
               seek SA00.OD_ID+TR_DATE
               if TR_DATE#OD_YMD .and.  .not. EOF()
                  skip -1
               endif
               if SA00.OD_ID#OD_ID
                  do CHK_MSG WITH '匯率資料無小於銷貨日的資料!!'
                  select OD00
                  seek SA00.OD_ID
               endif
               set NEAR OFF
               WSA_RATE = OD_RATE2
               select SA00
               if _RLOCK(30)
                  return
               endif
               replace SA_RATE WITH WSA_RATE
               unlock
            endif
            select 1
            if _RLOCK(30)
               select 1
               skip
               loop
            endif
            WSA_TAXID = SA_TAXID
            WCU_NO = CU_NO
            WSA_NO = SA_NO
            WSA_BIL = SA_BIL
            WIV_PAGE = IV_PAGE
            WSA_ID = SA_ID
            WSA_DATE = SA_DATE
            WSA_SIGN = SA_SIGN
            WSA_CHDAT = SA_CHDAT
            WSA_LTDAT = SA_LTDAT
            WSA_IVNO1 = SA_IVNO1
            WSA_IVNO = SA_IVNO
            WSA_RATE = SA_RATE
            WSA_CHARG = SA_CHARG
            WSA_CHARG1 = SA_CHARG1
            WOD_ID = OD_ID
            WOD_SATYP = OD_SATYP
            WCU_SALE = CU_SALE
            WDP_NO = DP_NO
            WSA_COMM = SA_COMM
            WSA_PRE = SA_PRE
            WSA_TAX = SA_TAX
            WSA_AMT = SA_AMT
            select 1
            if WIV_PAGE=2 .and. IE_IVAUTO='N'
               WIV_SORT = '32'
            else
               WIV_SORT = '31'
            endif
            if WOD_ID=IE_ODID
               WSA_CAMT = CHK_RND(WSA_COMM*WSA_AMT*0.01)
            else
               WSA_CAMT = ROUND(WSA_COMM*WSA_AMT*0.01,2)
            endif
            select 1
            replace SA_CAMT WITH WSA_CAMT
            if WOD_ID=IE_ODID
               WSA_AMT = CHK_RND(SA_AMT)
               WSA_PRE = CHK_RND(SA_PRE)
               WSA_TAX = CHK_RND(SA_TAX)
               WSA_OTHE = CHK_RND(SA_OTHE)
            else
               WSA_AMT = ROUND(SA_AMT,2)
               WSA_PRE = ROUND(SA_PRE,2)
               WSA_TAX = ROUND(SA_TAX,2)
               WSA_OTHE = ROUND(SA_OTHE,2)
            endif
            WNT_AMT = CHK_RND(WSA_AMT*WSA_RATE)
            WNT_PRE = CHK_RND(WSA_PRE*WSA_RATE)
            WNT_TAX = CHK_RND(WSA_TAX*WSA_RATE)
            WNT_OTHE = CHK_RND(WSA_OTHE*WSA_RATE)
            WNT_VAR = CHK_RND((WSA_AMT+WSA_TAX+WSA_OTHE-WSA_PRE)*WSA_RATE)-(WNT_AMT+WNT_TAX-WNT_PRE+WNT_OTHE)
            FLG_ADJ = .F.
            ADJ_REC = 0
            N_AMT = WSA_AMT+WSA_TAX+WSA_OTHE-WSA_PRE
            if N_AMT=0
               if WNT_AMT+WNT_TAX+WNT_OTHE-WNT_PRE#0
                  FLG_ADJ = .T.
               endif
               N_NTAMT = 0
            else
               N_NTAMT = WNT_AMT+WNT_TAX+WNT_OTHE-WNT_PRE
            endif
            select DP00
            seek WDP_NO
            WSA_DPNO = SA_DPNO
            select SA01
            seek WSA_NO
            TEL_NO = EL_NO
            select EL00
            seek TEL_NO
            WIN_ID = IN_ID
            select AR08
            seek WAR_RENO+WSA_ID
            WAC_NO1 = AC_NO1
            WAC_NO2 = AC_NO2
            select CU00
            seek WSA_BIL
            WCU_NA = CU_NA
            WIV_UNIT = CU_UNIT
            WCU_ODID = CU_ODID
            WCU_RELA = CU_RELA
            do CASE
               case WSA_ID='1'
                  WAC_NO1 = TRIM(IIF(WCU_RELA='Y',WAC_RECV1,WAC_RECV))
                  if IE_ACAR='Y'
                     WAC_NO1 = WAC_NO1+WSA_BIL
                  else
                     if IE_ACARTYP='Y'
                        WAC_NO1 = WAC_NO1+WOD_SATYP
                     endif
                  endif
                  WAC_NO2 = TRIM(IIF(WCU_RELA='Y',WAC_INCM2,WAC_INCM))
                  if IE_ACSATYP='Y'
                     WAC_NO2 = WAC_NO2+WOD_SATYP
                  endif
               case WSA_ID='2'
                  WAC_NO1 = TRIM(IIF(WCU_RELA='Y',WAC_OTRE1,WAC_OTRE))
                  if IE_ACAR='Y' .and. WAC_OTRE=WAC_RECV
                     WAC_NO1 = WAC_NO1+WSA_BIL
                  else
                     if IE_ACARTYP='Y' .and. WAC_OTRE=WAC_RECV
                        WAC_NO1 = WAC_NO1+WOD_SATYP
                     endif
                  endif
                  WAC_NO2 = IIF(WCU_RELA='Y',WAC_OINCM1,WAC_OINCM)
                  if WAC_OINCM=WAC_INCM
                     WAC_NO2 = TRIM(IIF(WCU_RELA='Y',WAC_INCM2,WAC_INCM))
                     if IE_ACSATYP='Y'
                        WAC_NO2 = WAC_NO2+WOD_SATYP
                     endif
                  endif
               otherwise
            endcase
            if  .not. WSA_CHARG$'5'
               FLG_EDIT = .T.
               select AR00
               seek WSA_BIL+WSA_NO+' '+WAR_RENO
               if EOF()
                  WAR_DOCU = SPACE(LEN(AR_DOCU))
                  select AR00
                  set ORDER TO 3
                  do WHILE .T.
                     do CHK_NOA WITH WSA_DATE, 'AR', 'A', WAR_DOCU
                     select AR00
                     seek WAR_DOCU
                     if EOF()
                        exit
                     endif
                  enddo
                  select AR00
                  set ORDER TO 1
                  select AR00
                  append BLANK
               else
                  WAR_DOCU = AR_DOCU
                  if AR_SURE#' '
                     select SA00
                     if  .not. EOF()
                        skip
                     endif
                     loop
                  endif
                  select AR06
                  seek WAR_DOCU
                  FLG_EDIT = .F.
                  do WHILE  .not. EOF() .and. AR_DOCU=WAR_DOCU
                     do WHILE _RLOCK(30)
                     enddo
                     delete
                     unlock
                     skip
                  enddo
               endif
               select AR00
               do WHILE .T.
                  if _RLOCK(30)
                     loop
                  endif
                  exit
               enddo
               replace AR_DOCU WITH WAR_DOCU
               replace AR_DATE WITH WSA_DATE
               replace CU_NO WITH WSA_BIL
               replace AR_NO WITH WSA_NO
               replace AR_RENO WITH WAR_RENO
               replace AR_REID WITH WSA_ID
               replace AR_RENA WITH '銷(出)貨單'
               replace SA_AMT WITH N_NTAMT+WNT_VAR
               if WCU_ODID$'2'
                  replace SA_AMT1 WITH N_NTAMT+WNT_VAR
                  replace OD_ID WITH IE_ODID
                  replace SA_RATE WITH 1
               else
                  replace OD_ID WITH WOD_ID
                  replace SA_AMT1 WITH N_AMT
                  replace SA_RATE WITH WSA_RATE
               endif
               replace SA_NAMT WITH SA_AMT-SA_ACPT-SA_DISCD
               replace IV_SORT WITH WIV_SORT
               replace IV_PAGE WITH WIV_PAGE
               replace SA_CHARG WITH WSA_CHARG
               replace SA_CHARG1 WITH WSA_CHARG1
               replace SA_ARDAT WITH WSA_CHDAT
               replace SA_CHDAT WITH WSA_LTDAT
               replace SA_IVNO WITH WSA_IVNO1
               replace SA_INVOICE WITH WSA_IVNO
               replace SA_TAXID WITH WSA_TAXID
               replace AC_NO WITH WAC_NO1
               replace CU_SALE WITH WCU_SALE
               replace DP_NO WITH WDP_NO
               unlock
               FLG_EDIT = .T.
            else
               FLG_EDIT = .F.
            endif
            if FLG_EDIT
               if N_NTAMT>0
                  select AR06
                  append BLANK
                  do WHILE .T.
                     if _RLOCK(30)
                        loop
                     endif
                     exit
                  enddo
                  replace AR_DATE WITH WSA_DATE
                  replace AR_DOCU WITH WAR_DOCU
                  replace AC_NO WITH WAC_NO1
                  replace AR_DC WITH '1'
                  replace AR_AMT WITH WNT_AMT+WNT_TAX+WNT_OTHE-WNT_PRE+WNT_VAR
                  if IE_ARREMK3='1'
                     replace AR_REMK WITH WCU_NA
                  else
                     replace AR_REMK WITH WSA_NO
                  endif
                  replace DP_NO WITH WDP_NO
                  replace SA_DPNO WITH WSA_DPNO
                  replace IN_ID WITH WIN_ID
                  replace AC_VS1 WITH WSA_BIL
                  unlock
               endif
               WAR_LOSS = 0
               FNT_PRE = 0
               if WNT_PRE>0
                  FLG_VAR = IIF(WNT_VAR#0 .and. FLG_ADJ,.T.,.F.)
                  select AR10
                  seek WAR_RENO+WSA_NO
                  W_AC3 = ''
                  I = 1
                  do WHILE  .not. EOF() .and. AR_RENO+AR_LIST=WAR_RENO+WSA_NO
                     select AR16
                     seek AR10.RE_LIST+AR10.RE_IDCOD
                     FAC3 = 'w_'+AC_NO
                     if  .not. AC_NO$W_AC3
                        &fac3 = chk_rnd(ar10->ar_amt*ar16->ar_rate)
                        W_AC3 = W_AC3+AC_NO
                        I = I+1
                     else
                        &fac3 = &fac3+chk_rnd(ar10->ar_amt*ar16->ar_rate)
                     endif
                     select AR10
                     FNT_PRE = FNT_PRE+CHK_RND(AR_AMT*AR16.AR_RATE)
                     WAR_LOSS = WAR_LOSS+CHK_RND(AR_AMT*(WSA_RATE-AR16.AR_RATE))
                     skip
                  enddo
                  J = I
                  I = 1
                  do WHILE I<J
                     FAC3 = 'w_'+SUBSTR(W_AC3,1+9*(I-1),9)
                     select AR06
                     append BLANK
                     do WHILE .T.
                        if _RLOCK(30)
                           loop
                        endif
                        exit
                     enddo
                     replace AR_DATE WITH WSA_DATE
                     replace AR_DOCU WITH WAR_DOCU
                     replace AC_NO WITH SUBSTR(W_AC3,1+9*(I-1),9)
                     replace AR_DC WITH '1'
                     repl ar_amt   with &fac3
                     if FLG_VAR
                        replace AR_AMT WITH AR_AMT+WNT_VAR
                        FLG_VAR = .F.
                     endif
                     if IE_ARREMK3='1'
                        replace AR_REMK WITH WCU_NA
                     else
                        replace AR_REMK WITH WSA_NO
                     endif
                     replace DP_NO WITH WDP_NO
                     replace SA_DPNO WITH WSA_DPNO
                     replace IN_ID WITH WIN_ID
                     replace AC_VS1 WITH WSA_BIL
                     unlock
                     I = I+1
                  enddo
                  WAR_LOSS = WNT_PRE-FNT_PRE
                  if WAR_LOSS>0
                     select AR06
                     append BLANK
                     do WHILE _RLOCK(30)
                     enddo
                     replace AR_DATE WITH WSA_DATE
                     replace AR_DOCU WITH WAR_DOCU
                     replace AC_NO WITH WAC_LOS2
                     replace AR_DC WITH '1'
                     replace AR_AMT WITH WAR_LOSS
                     if IE_ARREMK3='1'
                        replace AR_REMK WITH WCU_NA
                     else
                        replace AR_REMK WITH WSA_NO
                     endif
                     replace DP_NO WITH WDP_NO
                     replace SA_DPNO WITH WSA_DPNO
                     replace IN_ID WITH WIN_ID
                     replace AC_VS1 WITH WSA_BIL
                     unlock
                  endif
               endif
               select SA09
               seek TSA_TYPE+WSA_NO
               if  .not. EOF()
                  TT_OTHE = 0
                  if WSA_RATE>1
                     select SA09
                     seek TSA_TYPE+WSA_NO
                     do WHILE  .not. EOF() .and. SA_TYPE+SA_NO=TSA_TYPE+WSA_NO
                        if EX_CHARG$'Y'
                           TT_OTHE = TT_OTHE+CHK_RND(EX_AMT*WSA_RATE)
                        endif
                        skip
                     enddo
                     if TT_OTHE#WNT_OTHE
                        TT_OTHE = WNT_OTHE-TT_OTHE
                     else
                        TT_OTHE = 0
                     endif
                     seek TSA_TYPE+WSA_NO
                  endif
                  do WHILE  .not. EOF() .and. SA_TYPE+SA_NO=TSA_TYPE+WSA_NO
                     if EX_CHARG='Y' .and. EX_AMT<0
                        select AR06
                        append BLANK
                        do WHILE _RLOCK(30)
                        enddo
                        replace AR_DATE WITH WSA_DATE
                        replace AR_DOCU WITH WAR_DOCU
                        replace AC_NO WITH SA09.AC_NO
                        replace AR_DC WITH '1'
                        replace AR_AMT WITH ABS(CHK_RND(SA09.EX_AMT*WSA_RATE))
                        if IE_ARREMK3='1'
                           replace AR_REMK WITH WCU_NA
                        else
                           replace AR_REMK WITH WSA_NO
                        endif
                        replace DP_NO WITH WDP_NO
                        replace SA_DPNO WITH WSA_DPNO
                        replace IN_ID WITH WIN_ID
                        replace AC_VS1 WITH WSA_BIL
                        unlock
                     endif
                     select SA09
                     skip
                  enddo
                  if WSA_RATE>1 .and. TT_OTHE<0
                     select AR06
                     do WHILE _RLOCK(30)
                     enddo
                     replace AR_AMT WITH AR_AMT-TT_OTHE
                     unlock
                  endif
                  select SA09
                  seek TSA_TYPE+WSA_NO
                  do WHILE  .not. EOF() .and. SA_TYPE+SA_NO=TSA_TYPE+WSA_NO
                     if EX_CHARG='Y' .and. EX_AMT>0
                        select AR06
                        append BLANK
                        do WHILE _RLOCK(30)
                        enddo
                        replace AR_DATE WITH WSA_DATE
                        replace AR_DOCU WITH WAR_DOCU
                        replace AC_NO WITH SA09.AC_NO
                        replace AR_DC WITH '2'
                        replace AR_AMT WITH CHK_RND(SA09.EX_AMT*WSA_RATE)
                        if WSA_TAXID='4'
                           replace AR_AMT WITH CHK_RND(SA09.EX_AMT*WSA_RATE/(1+TA_TAX))
                        endif
                        if IE_ARREMK3='1'
                           replace AR_REMK WITH WCU_NA
                        else
                           replace AR_REMK WITH WSA_NO
                        endif
                        replace DP_NO WITH WDP_NO
                        replace SA_DPNO WITH WSA_DPNO
                        replace IN_ID WITH WIN_ID
                        replace AC_VS1 WITH WSA_BIL
                        unlock
                     endif
                     select SA09
                     skip
                  enddo
                  if WSA_RATE>1 .and. TT_OTHE>0
                     select AR06
                     do WHILE _RLOCK(30)
                     enddo
                     replace AR_AMT WITH AR_AMT+TT_OTHE
                     unlock
                  endif
               endif
               if WNT_AMT>0
                  if IE_ACSAINV#'Y'
                     if WOD_SATYP$'4'
                        dimension DBF_ARY[ 3], TAG_ARY[ 3], ALIAS_ARY[ 3], ANO_ARY[ 3]
                        = SET_DBF(3,DBF_SA+'roch01','roch01_1','ch01',0)
                        = SET_DBF(2,DBF_SA+'roch02','roch02_1','ch02',0)
                        = SET_DBF(1,DBF_SC+'romt04','romt04_1','mt04',0)
                        do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
                        if ERR_USE
                           close DATABASES
                           return
                        endif
                        WMT_QTY = 0
                        WCH_AMT = 0
                        select MT04
                        set ORDER TO 1
                        seek 'Q'+WSA_NO
                        do WHILE  .not. EOF() .and. 'Q'+WSA_NO=MT_CODE+MT_LIST
                           PPP = RECNO()
                           WLOT_NO = LOT_NO
                           WMT_AREA = MT_AREA
                           WBIN_NO = BIN_NO
                           WMT_QTY = MT_QTY
                           select MT04
                           set ORDER TO 10
                           seek 'A'+WLOT_NO+WMT_AREA+WBIN_NO
                           WCH_NO = SUBSTR(MT_REFR,1,9)
                           WCH_SEQ = CH_SEQ
                           select CH02
                           set ORDER TO 1
                           seek WCH_NO+WCH_SEQ
                           WCH_SORT = CH_SORT
                           select CH01
                           seek WCH_SORT+WCH_NO
                           select CH02
                           WCH_AMT = WCH_AMT+(CH_PRICE*WMT_QTY*CH01.CH_RATE)
                           select MT04
                           set ORDER TO 1
                           goto PPP
                           skip
                        enddo
                        select AR06
                        append BLANK
                        do WHILE _RLOCK(30)
                        enddo
                        replace AR_DATE WITH WSA_DATE
                        replace AR_DOCU WITH WAR_DOCU
                        replace AC_NO WITH WAC_NO2
                        replace AR_DC WITH '2'
                        replace AR_AMT WITH WNT_AMT+WNT_VAR-WCH_AMT
                        replace DP_NO WITH WDP_NO
                        replace SA_DPNO WITH WSA_DPNO
                        replace IN_ID WITH WIN_ID
                        replace AC_VS1 WITH WSA_BIL
                        do CASE
                           case IE_ARREMK1='1'
                              replace AR_REMK WITH TEL_NO
                           case IE_ARREMK1='2'
                              replace AR_REMK WITH WSA_NO
                        endcase
                        unlock
                        select AR06
                        append BLANK
                        do WHILE _RLOCK(30)
                        enddo
                        replace AR_DATE WITH WSA_DATE
                        replace AR_DOCU WITH WAR_DOCU
                        replace AC_NO WITH WAC_COMM
                        replace AR_DC WITH '2'
                        replace AR_AMT WITH WCH_AMT
                        replace DP_NO WITH WDP_NO
                        replace SA_DPNO WITH WSA_DPNO
                        replace IN_ID WITH WIN_ID
                        replace AC_VS1 WITH WSA_BIL
                        do CASE
                           case IE_ARREMK1='1'
                              replace AR_REMK WITH TEL_NO
                           case IE_ARREMK1='2'
                              replace AR_REMK WITH WSA_NO
                        endcase
                        unlock
                        use IN MT04
                        use IN CH02
                        use IN CH01
                        select AR06
                     else
                        T_TOTL = WNT_AMT+WNT_VAR
                        W_TOTL = 0
                        W_ACM = ''
                        W_ELNO = ''
                        store 0 TO MM_1, SS_2, PP_3, ZZ_4
                        I = 1
                        select 2
                        seek WSA_NO
                        TEL_NO = EL_NO
                        do WHILE  .not. EOF() .and. SA_NO=WSA_NO
                           WSA_CH = SA_CH
                           if SA_PRICE>0 .and. WSA_CH='Y'
                              if  .not. ' '$WSA_SIGN
                                 TSA_QTY = SA_ACQTY
                              else
                                 TSA_QTY = SA_QTY
                              endif
                              if WSA_TAXID='4'
                                 WSA_PRICE = ROUND(SA_PRICE*WSA_RATE/(1+TA_TAX),4)
                              else
                                 WSA_PRICE = SA_PRICE*WSA_RATE
                              endif
                              W_EXP = CHK_RND(WSA_PRICE*TSA_QTY)
                              WEL_INVID = EL_INVID
                              WIN_ID = IN_ID
                              WEL_NO = EL_NO
                              if UPPER(SUBSTR(WEL_NO,1,3))='XYZ'
                                 TAC_NO = SUBSTR(WEL_NO,5,4)
                                 W_TOTL = W_TOTL+W_EXP
                                 FACM = 'w_'+TAC_NO
                                 if  .not. TAC_NO$W_ACM
                                    &facm  = w_exp
                                    W_ACM = W_ACM+TAC_NO
                                    W_ELNO = W_ELNO+WEL_NO
                                    I = I+1
                                 else
                                    &facm  = &facm+w_exp
                                 endif
                              endif
                           endif
                           select 2
                           skip
                        enddo
                        J = I
                        I = 1
                        do WHILE I<J
                           FACM = 'w_'+SUBSTR(W_ACM,1+9*(I-1),9)
                           if &facm>0
                              select AR06
                              append BLANK
                              do WHILE .T.
                                 if _RLOCK(30)
                                    loop
                                 endif
                                 exit
                              enddo
                              replace AR_DATE WITH WSA_DATE
                              replace AR_DOCU WITH WAR_DOCU
                              replace AC_NO WITH SUBSTR(W_ACM,1+9*(I-1),9)
                              replace AR_DC WITH '2'
                              repl ar_amt   with &facm
                              replace DP_NO WITH WDP_NO
                              replace SA_DPNO WITH WSA_DPNO
                              replace IN_ID WITH WIN_ID
                              replace AC_VS1 WITH WSA_BIL
                              do CASE
                                 case IE_ARREMK1='1'
                                    replace AR_REMK WITH SUBSTR(W_ELNO,1+15*(I-1),15)
                                 case IE_ARREMK1='2'
                                    replace AR_REMK WITH WSA_NO
                              endcase
                              unlock
                           endif
                           I = I+1
                        enddo
                        select AR06
                        append BLANK
                        do WHILE _RLOCK(30)
                        enddo
                        replace AR_DATE WITH WSA_DATE
                        replace AR_DOCU WITH WAR_DOCU
                        replace AC_NO WITH WAC_NO2
                        replace AR_DC WITH '2'
                        replace AR_AMT WITH WNT_AMT+WNT_VAR-W_TOTL
                        replace DP_NO WITH WDP_NO
                        replace SA_DPNO WITH WSA_DPNO
                        replace IN_ID WITH WIN_ID
                        replace AC_VS1 WITH WSA_BIL
                        do CASE
                           case IE_ARREMK1='1'
                              replace AR_REMK WITH TEL_NO
                           case IE_ARREMK1='2'
                              replace AR_REMK WITH WSA_NO
                        endcase
                        unlock
                        ADJ_REC = RECNO()
                     endif
                  else
                     T_TOTL = WNT_AMT+WNT_VAR
                     W_TOTL = 0
                     W_ACM = ''
                     W_ELNO = ''
                     store 0 TO MM_1, SS_2, PP_3, ZZ_4
                     I = 1
                     select 2
                     seek WSA_NO
                     TEL_NO = EL_NO
                     do WHILE  .not. EOF() .and. SA_NO=WSA_NO
                        WSA_CH = SA_CH
                        if SA_PRICE>0 .and. WSA_CH='Y'
                           if  .not. ' '$WSA_SIGN
                              TSA_QTY = SA_ACQTY
                           else
                              TSA_QTY = SA_QTY
                           endif
                           if WSA_TAXID='4'
                              WSA_PRICE = ROUND(SA_PRICE*WSA_RATE/(1+TA_TAX),4)
                           else
                              WSA_PRICE = SA_PRICE*WSA_RATE
                           endif
                           W_EXP = CHK_RND(WSA_PRICE*TSA_QTY)
                           W_TOTL = W_TOTL+W_EXP
                           WEL_INVID = EL_INVID
                           WIN_ID = IN_ID
                           WEL_NO = EL_NO
                           if UPPER(SUBSTR(WEL_NO,1,3))='XYZ'
                              TAC_NO = SUBSTR(WEL_NO,5,4)
                           else
                              if WEL_INVID=' '
                                 select EL00
                                 seek WEL_NO
                                 WEL_INVID = EL_INVID
                              endif
                              do CASE
                                 case WEL_INVID$'MU'
                                    W_INVID = '1'
                                 case WEL_INVID='S'
                                    W_INVID = '2'
                                 case WEL_INVID='P'
                                    W_INVID = '3'
                                 case WEL_INVID='Z'
                                    W_INVID = '4'
                                 otherwise
                                    W_INVID = '1'
                              endcase
                              TAC_NO = SUBSTR(WAC_NO2+W_INVID+SPACE(5),1,9)
                           endif
                           FACM = 'w_'+TAC_NO
                           if  .not. TAC_NO$W_ACM
                              &facm  = w_exp
                              W_ACM = W_ACM+TAC_NO
                              W_ELNO = W_ELNO+WEL_NO
                              I = I+1
                           else
                              &facm  = &facm+w_exp
                           endif
                        endif
                        select 2
                        skip
                     enddo
                     select SA05
                     seek WSA_NO
                     TEL_NO = EL_NO
                     do WHILE  .not. EOF() .and. SA_NO=WSA_NO
                        if SA_PRICE>0 .and. WSA_CH='Y'
                           if WSA_TAXID='4'
                              WSA_PRICE = ROUND(SA_PRICE*WSA_RATE/(1+TA_TAX),4)
                           else
                              WSA_PRICE = SA_PRICE*WSA_RATE
                           endif
                           W_EXP = CHK_RND(WSA_PRICE*SA_QTY)
                           W_TOTL = W_TOTL+W_EXP
                           WEL_INVID = EL_INVID
                           WIN_ID = IN_ID
                           WEL_NO = EL_NO
                           if WEL_INVID=' '
                              select EL00
                              seek WEL_NO
                              WEL_INVID = EL_INVID
                           endif
                           do CASE
                              case WEL_INVID$'MU'
                                 W_INVID = '1'
                              case WEL_INVID='S'
                                 W_INVID = '2'
                              case WEL_INVID='P'
                                 W_INVID = '3'
                              case WEL_INVID='Z'
                                 W_INVID = '4'
                              otherwise
                                 W_INVID = '1'
                           endcase
                           TAC_NO = SUBSTR(WAC_NO2+W_INVID+SPACE(5),1,9)
                           FACM = 'w_'+TAC_NO
                           if  .not. TAC_NO$W_ACM
                              &facm = w_exp
                              W_ACM = W_ACM+TAC_NO
                              W_ELNO = W_ELNO+WEL_NO
                              I = I+1
                           else
                              &facm = &facm+w_exp
                           endif
                        endif
                        select SA05
                        skip
                     enddo
                     select SA06
                     seek WSA_NO
                     TEL_NO = EL_NO
                     do WHILE  .not. EOF() .and. SA_NO=WSA_NO
                        if SA_PRICE>0 .and. WSA_CH='Y'
                           if WSA_TAXID='4'
                              WSA_PRICE = ROUND(SA_PRICE*WSA_RATE/(1+TA_TAX),4)
                           else
                              WSA_PRICE = SA_PRICE*WSA_RATE
                           endif
                           W_EXP = CHK_RND(WSA_PRICE*SA_QTY)
                           W_TOTL = W_TOTL+W_EXP
                           WEL_INVID = EL_INVID
                           WIN_ID = IN_ID
                           if WEL_INVID=' '
                              select EL00
                              seek WEL_NO
                              WEL_INVID = EL_INVID
                           endif
                           do CASE
                              case WEL_INVID$'MU'
                                 W_INVID = '1'
                              case WEL_INVID='S'
                                 W_INVID = '2'
                              case WEL_INVID='P'
                                 W_INVID = '3'
                              case WEL_INVID='Z'
                                 W_INVID = '4'
                              otherwise
                                 W_INVID = '1'
                           endcase
                           TAC_NO = SUBSTR(WAC_NO2+W_INVID+SPACE(5),1,9)
                           FACM = 'w_'+TAC_NO
                           if  .not. TAC_NO$W_ACM
                              &facm = w_exp
                              W_ACM = W_ACM+TAC_NO
                              W_ELNO = W_ELNO+WEL_NO
                              I = I+1
                           else
                              &facm = &facm+w_exp
                           endif
                        endif
                        select SA06
                        skip
                     enddo
                     J = I
                     I = 1
                     do WHILE I<J
                        FACM = 'w_'+SUBSTR(W_ACM,1+9*(I-1),9)
                        if &facm>0
                           select AR06
                           append BLANK
                           do WHILE .T.
                              if _RLOCK(30)
                                 loop
                              endif
                              exit
                           enddo
                           replace AR_DATE WITH WSA_DATE
                           replace AR_DOCU WITH WAR_DOCU
                           replace AC_NO WITH SUBSTR(W_ACM,1+9*(I-1),9)
                           replace AR_DC WITH '2'
                           repl ar_amt   with &facm
                           replace DP_NO WITH WDP_NO
                           replace SA_DPNO WITH WSA_DPNO
                           replace IN_ID WITH WIN_ID
                           replace AC_VS1 WITH WSA_BIL
                           do CASE
                              case IE_ARREMK1='1'
                                 replace AR_REMK WITH SUBSTR(W_ELNO,1+15*(I-1),15)
                              case IE_ARREMK1='2'
                                 replace AR_REMK WITH WSA_NO
                           endcase
                           unlock
                        endif
                        I = I+1
                     enddo
                     if W_TOTL#T_TOTL
                        select AR06
                        W_EXP = AR_AMT-W_TOTL+T_TOTL
                        select AR06
                        do WHILE .T.
                           if _RLOCK(30)
                              loop
                           endif
                           exit
                        enddo
                        replace AR_AMT WITH W_EXP
                        unlock
                     endif
                     ADJ_REC = RECNO()
                  endif
               endif
               if WNT_TAX>0
                  select AR06
                  append BLANK
                  do WHILE .T.
                     if _RLOCK(30)
                        loop
                     endif
                     exit
                  enddo
                  replace AR_DATE WITH WSA_DATE
                  replace AR_DOCU WITH WAR_DOCU
                  replace AC_NO WITH WAC_SLTX
                  replace AR_DC WITH '2'
                  replace AR_AMT WITH WNT_TAX
                  if TRIM(WSA_IVNO1)=''
                     REMK = WCU_NA
                  else
                     REMK = WSA_IVNO1
                  endif
                  replace AR_REMK WITH REMK
                  replace AR_RELA WITH WSA_IVNO1
                  replace DP_NO WITH WDP_NO
                  replace SA_DPNO WITH WSA_DPNO
                  replace IN_ID WITH WIN_ID
                  replace AC_VS1 WITH WSA_BIL
                  unlock
               endif
               if WAR_LOSS<0
                  select AR06
                  append BLANK
                  do WHILE .T.
                     if _RLOCK(30)
                        loop
                     endif
                     exit
                  enddo
                  replace AR_DATE WITH WSA_DATE
                  replace AR_DOCU WITH WAR_DOCU
                  replace AC_NO WITH WAC_LOS1
                  replace AR_DC WITH '2'
                  replace AR_AMT WITH WAR_LOSS*-1
                  replace AR_REMK WITH WCU_NA
                  replace DP_NO WITH WDP_NO
                  replace SA_DPNO WITH WSA_DPNO
                  replace IN_ID WITH WIN_ID
                  replace AC_VS1 WITH WSA_BIL
                  unlock
               endif
            endif
            if  .not. A.SA_CHARG$'5'
               DSUM = 0
               CSUM = 0
               select AR06
               seek WAR_DOCU
               do WHILE  .not. EOF() .and. AR_DOCU=WAR_DOCU
                  if AR_DC='1'
                     DSUM = DSUM+AR_AMT
                  else
                     CSUM = CSUM+AR_AMT
                  endif
                  skip
               enddo
               if DSUM#CSUM
                  if FLG_ADJ .and. ADJ_REC>0
                     goto ADJ_REC
                     replace AR_AMT WITH AR_AMT+(DSUM-CSUM)
                  else
                     FLG_BL = .F.
                     ?? CHR(7)
                     do CHK_MSG WITH '借貸不平衡不轉應收憑單:差額:'+STR(DSUM-CSUM,12,2)
                     select AR00
                     do WHILE .T.
                        if _RLOCK(30)
                           loop
                        endif
                        exit
                     enddo
                     delete
                     unlock
                     select AR06
                     seek WAR_DOCU
                     do WHILE  .not. EOF() .and. AR_DOCU=WAR_DOCU
                        do WHILE .T.
                           if _RLOCK(30)
                              loop
                           endif
                           exit
                        enddo
                        delete
                        unlock
                        skip
                     enddo
                  endif
               endif
            endif
            select SA00
            unlock
         endif
         if A.SA_CHARG$'5'
            FLG_BL = .T.
         endif
         if FLG_BL
            select SA00
            do WHILE .T.
               if  .not. _RLOCK(30)
                  exit
               endif
            enddo
            replace SA_SURE WITH 'Y'
            unlock
         endif
         select SA00
         unlock
         skip
      enddo
      select SA00
      seek W_NOL
      do WHILE  .not. EOF() .and. SA_NO<=W_NOH
         if SA_IVNO1#SPACE(10)
            select 1
            WSA_TAXID = SA_TAXID
            WCU_NO = CU_NO
            WSA_NO = SA_NO
            WSA_BIL = SA_BIL
            WIV_PAGE = IV_PAGE
            WSA_ID = SA_ID
            WSA_DATE = SA_DATE
            WSA_IVNO1 = SA_IVNO1
            WOD_ID = OD_ID
            WOD_SATYP = OD_SATYP
            WSA_VIA = SA_VIA
            WIV_CUNO = IV_CUNO
            WBN_ID = BN_ID
            WSA_RATE = SA_RATE
            WSA_IVNO = SA_IVNO
            WIV_DATE = IV_DATE
            WIV_AMT = IV_AMT
            WIV_TAX = IV_TAX
            if WIV_PAGE=2 .and. IE_IVAUTO='N'
               WIV_SORT = '32'
            else
               WIV_SORT = '31'
            endif
            TIV_TAXID = SUBSTR(' 2311',VAL(WSA_TAXID)+1,1)
            select CU00
            seek WSA_BIL
            WCU_NA = CU_NA
            WIV_UNIT = CU_UNIT
            select CU00
            seek WIV_CUNO
            WIV_UNIT = CU_UNIT
            select OV01
            seek '1'+WSA_IVNO1
            FLG_IV = .F.
            FLG_AD = .F.
            if EOF()
               FLG_IV = .T.
               FLG_AD = .T.
               append BLANK
            else
               if IV_SURE#'Y'
                  FLG_IV = .T.
               else
                  FLG_IV = .F.
               endif
            endif
            if FLG_IV
               do WHILE _RLOCK(30)
               enddo
               replace IV_NO WITH WSA_IVNO1
               replace IV_DATE WITH WIV_DATE
               replace IV_CODE WITH '1'
               replace IV_SALE WITH '1'
               replace IV_AREA WITH WOD_SATYP
               replace CU_NO1 WITH WSA_BIL
               replace CU_NO WITH WIV_CUNO
               replace IV_TAXID WITH TIV_TAXID
               replace OD_ID WITH WOD_ID
               replace IV_RATE WITH WSA_RATE
               replace IV_AMT WITH WIV_AMT
               replace IV_TAX WITH WIV_TAX
               replace IV_SORT WITH WIV_SORT
               replace IV_PAGE WITH WIV_PAGE
               replace IV_UNIT WITH WIV_UNIT
               replace IV_OKNO WITH SUBSTR(WSA_VIA,1,19)+WBN_ID
               replace SA_CLOS WITH WIV_DATE
               unlock
               if  .not. FLG_AD
                  select OV02
                  seek '1'+WSA_IVNO1
                  do WHILE  .not. EOF() .and. IV_CODE+IV_NO='1'+WSA_IVNO1
                     do WHILE _RLOCK(30)
                     enddo
                     delete
                     unlock
                     skip
                  enddo
               endif
               dimension DBF_ARY[ 1], TAG_ARY[ 1], ALIAS_ARY[ 1], ANO_ARY[ 1]
               = SET_DBF(1,DBF_SA+'rochex','rochex_1','chex',0)
               do CHK_OPEN WITH DBF_ARY, TAG_ARY, ALIAS_ARY, ANO_ARY
               if ERR_USE
                  close DATABASES
                  return
               endif
               select SA09
               seek TSA_TYPE+WSA_NO
               do WHILE  .not. EOF() .and. SA_TYPE+SA_NO=TSA_TYPE+WSA_NO
                  if IV_YN='Y'
                     if WSA_TAXID='4'
                        WIV_UP = EX_AMT/(1+TA_TAX)
                     else
                        WIV_UP = EX_AMT
                     endif
                     select CHEX
                     seek SA09.EX_NO
                     select OV02
                     append BLANK
                     do WHILE .T.
                        if _RLOCK(30)
                           loop
                        endif
                        exit
                     enddo
                     replace IV_NO WITH WSA_IVNO1
                     replace IV_SORT WITH WIV_SORT
                     replace IV_CODE WITH '1'
                     replace IV_DATE WITH WSA_DATE
                     replace CU_NO WITH WIV_CUNO
                     replace CU_NO1 WITH WSA_BIL
                     replace EL_NO WITH 'XYZ'
                     replace IV_QTY WITH 1
                     replace IV_UP WITH SA09.EX_AMT
                     replace IV_TOTAL WITH ROUND(1*WIV_UP,2)
                     replace IV_REMK WITH '費用'
                     replace IV_SIZE WITH CHEX.EX_NAME
                     unlock
                  endif
                  select SA09
                  skip
               enddo
               select CHEX
               use
               select OV02
               select 2
               seek WSA_NO
               TIV_AMT = 0
               do WHILE  .not. EOF() .and. SA_NO=WSA_NO
                  if WSA_TAXID='4'
                     WIV_UP = SA_PRICE/(1+TA_TAX)
                  else
                     WIV_UP = SA_PRICE
                  endif
                  select OV02
                  append BLANK
                  do WHILE _RLOCK(30)
                  enddo
                  replace IV_NO WITH WSA_IVNO1
                  replace IV_SORT WITH WIV_SORT
                  replace IV_CODE WITH '1'
                  replace IV_DATE WITH WIV_DATE
                  replace CU_NO WITH WIV_CUNO
                  replace CU_NO1 WITH WSA_BIL
                  replace EL_NO WITH B.EL_NO
                  replace IV_QTY WITH B.SA_QTY
                  replace IV_UP WITH WIV_UP
                  if B.SA_CH#'Y'
                     replace IV_TOTAL WITH 0
                  else
                     replace IV_TOTAL WITH ROUND(B.SA_QTY*WIV_UP,2)
                  endif
                  unlock
                  select 2
                  skip
               enddo
               select SA05
               seek WSA_NO
               do WHILE  .not. EOF() .and. SA_NO=WSA_NO
                  if WSA_TAXID='4'
                     WIV_UP = SA_PRICE/(1+TA_TAX)
                  else
                     WIV_UP = SA_PRICE
                  endif
                  select OV02
                  append BLANK
                  do WHILE _RLOCK(30)
                  enddo
                  replace IV_NO WITH WSA_IVNO1
                  replace IV_SORT WITH WIV_SORT
                  replace IV_CODE WITH '1'
                  replace IV_DATE WITH WIV_DATE
                  replace CU_NO WITH WIV_CUNO
                  replace CU_NO1 WITH WSA_BIL
                  replace EL_NO WITH SA05.EL_NO
                  replace IV_QTY WITH SA05.SA_QTY
                  replace IV_UP WITH WIV_UP
                  replace IV_TOTAL WITH ROUND(SA05.SA_QTY*WIV_UP,2)
                  unlock
                  select SA05
                  skip
               enddo
            endif
         endif
         select SA00
         skip
      enddo
      select OD20
      use
      deactivate WINDOW WIN_MSG
      release WINDOW WIN_MSG
   endif
enddo
*
