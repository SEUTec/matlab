*version 6.1 1066595702
u 56
L? 2
C? 2
R? 2
D? 3
Q? 2
V? 4
@libraries
@analysis
.AC 0 1 0
+0 101
+1 10
+2 1.00K
.TRAN 1 0 0 0
+0 10us
+1 10ms
@targets
@attributes
@translators
a 0 u 13 0 0 0 hln 100 PSPICE=PSPICE
a 0 u 13 0 0 0 hln 100 PADS=PCB
a 0 u 13 0 0 0 hln 100 PCAD=PCB
a 0 u 13 0 0 0 hln 100 TANGO=PCB
a 0 u 13 0 0 0 hln 100 CADSTAR=PCB
a 0 u 13 0 0 0 hln 100 EDIF=PCB
a 0 u 13 0 0 0 hln 100 SCICARDS=PCB
a 0 u 13 0 0 0 hln 100 POLARIS=PCB
@index
pageloc 1 0 2541 
@status
n 0 97:00:05:23:33:52;852503632 e 
e 0 97:00:05:23:03:00;852501780 e 
*page 1 0 1520 970 iB
@ports
port 46 agnd 160 130 h
port 47 BUBBLE 260 60 d
a 1 x 14 0 10 -14 hcn 100 LABEL=Vo
@parts
part 1 l 90 60 h
a 0 sp 0 0 0 10 hlb 100 PART=l
a 0 a 0 0 0 0 hln 100 PKGREF=L1
a 0 ap 9 0 15 0 hln 100 REFDES=L1
a 0 u 13 0 15 25 hln 100 VALUE=200uH
part 2 c 220 110 v
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 a 0 0 0 0 hln 100 PKGREF=C1
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 u 13 0 -1 9 hln 100 VALUE=200uF
part 3 r 260 120 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 a 0 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 u 13 0 21 35 hln 100 VALUE=10
part 5 QbreakN 140 90 h
a 0 sp 0 0 0 50 hln 100 PART=QbreakN
a 0 a 0 0 0 0 hln 100 PKGREF=Q1
a 0 ap 9 0 21 23 hln 100 REFDES=Q1
a 0 sp 11 0 -23 40 hln 100 MODEL=QbreakN
part 6 VDC 70 70 h
a 1 u 13 0 -11 26 hcn 100 DC=10V
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 x 0 0 0 0 hln 100 PKGREF=Vg
a 1 xp 9 0 -8 9 hcn 100 REFDES=Vg
part 43 VPULSE 100 90 h
a 1 u 0 0 0 0 hcn 100 AC=1
a 1 u 0 0 0 0 hcn 100 V1=1
a 1 u 0 0 0 0 hcn 100 V2=0
a 1 u 0 0 0 0 hcn 100 TD=10e-6
a 1 u 0 0 0 0 hcn 100 TR=0.2e-6
a 1 u 0 0 0 0 hcn 100 TF=0.2e-6
a 1 u 0 0 0 0 hcn 100 PW=10e-6
a 1 u 0 0 0 0 hcn 100 PER=20e-6
a 0 x 0 0 0 0 hln 100 PKGREF=Vu
a 1 xp 9 0 -8 26 hcn 100 REFDES=Vu
part 45 Dbreak 170 60 h
a 0 sp 11 0 5 27 hln 100 MODEL=Dbreak
a 0 x 0 0 0 0 hln 100 PKGREF=D
a 0 xp 9 0 15 0 hln 100 REFDES=D
part 0 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PageSize=B
a 1 s 13 0 180 60 hcn 100 PageTitle=
a 1 s 13 0 300 95 hrn 100 PageNO=1
a 1 s 13 0 340 95 hrn 100 PageCount=1
@conn
w 8
s 70 70 70 60 7
s 70 60 90 60 9
w 12
s 150 60 160 60 11
s 160 60 170 60 51
s 160 70 160 60 49
w 17
s 200 60 220 60 16
s 260 60 260 80 18
s 220 60 260 60 22
s 220 80 220 60 20
w 24
s 260 120 260 130 23
s 260 130 220 130 25
s 70 130 70 110 27
s 220 130 160 130 34
s 220 110 220 130 32
s 160 130 100 130 36
s 100 130 70 130 44
s 160 110 160 130 52
w 38
s 140 90 100 90 54
@junction
j 70 70
+ p 6 +
+ w 8
j 90 60
+ p 1 1
+ w 8
j 150 60
+ p 1 2
+ w 12
j 260 80
+ p 3 2
+ w 17
j 220 80
+ p 2 2
+ w 17
j 220 60
+ w 17
+ w 17
j 260 120
+ p 3 1
+ w 24
j 70 110
+ p 6 -
+ w 24
j 220 110
+ p 2 1
+ w 24
j 220 130
+ w 24
+ w 24
j 100 130
+ p 43 -
+ w 24
j 100 90
+ p 43 +
+ w 38
j 170 60
+ p 45 1
+ w 12
j 200 60
+ p 45 2
+ w 17
j 160 130
+ s 46
+ w 24
j 260 60
+ s 47
+ w 17
j 160 70
+ p 5 c
+ w 12
j 160 60
+ w 12
+ w 12
j 160 110
+ p 5 e
+ w 24
j 140 90
+ p 5 b
+ w 38
@attributes
a 0 s 0 0 0 0 hln 100 PAGETITLE=
a 0 s 0 0 0 0 hln 100 PAGENO=1
a 0 s 0 0 0 0 hln 100 PAGESIZE=B
a 0 s 0 0 0 0 hln 100 PAGECOUNT=1
@text
