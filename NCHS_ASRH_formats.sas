* FORMATS FOR NCHS SERIES OR ANNUAL POSTCENSAL DATASETS *;

*-------- LOAD FORMATS ------------------------------------------------------------*;
PROC format;
		VALUE age18fmt
			1	='  0-4 yrs'
			2	='  5-9 yrs'
			3	='10-14 yrs'
			4	='15-19 yrs'
			5	='20-24 yrs'
			6	='25-29 yrs'
			7	='30-34 yrs'
			8	='35-39 yrs'
			9	='40-44 yrs'
			10	='45-49 yrs'
			11	='50-54 yrs'
			12	='55-59 yrs'
			13	='60-64 yrs'
			14	='65-69 yrs'
			15	='70-74 yrs'
			16	='75-79 yrs'
			17	='80-84 yrs'
			18	='85+   yrs';
		VALUE age19fmt
			0	='   <1 yrs'
			1	='  1-4 yrs'
			2	='  5-9 yrs'
			3	='10-14 yrs'
			4	='15-19 yrs'
			5	='20-24 yrs'
			6	='25-29 yrs'
			7	='30-34 yrs'
			8	='35-39 yrs'
			9	='40-44 yrs'
			10	='45-49 yrs'
			11	='50-54 yrs'
			12	='55-59 yrs'
			13	='60-64 yrs'
			14	='65-69 yrs'
			15	='70-74 yrs'
			16	='75-79 yrs'
			17	='80-84 yrs'
			18	='85+   yrs';
		VALUE racesexfmt
			1='White M'
			2='White F'
			3='Black M'
			4='Black F'
			5='AmInd M'
			6='AmInd F'
			7='Asian M'
			8='Asian F';
		VALUE racefmt
			1='White'
			2='Black'
			3='AmInd'
			4='Asian';
		VALUE sexfmt
			1='M'
			2='F';
		Value HISPfmt
			0='Non-Hisp'
			1='Hisp';
		VALUE ctyfmt
			1='Fairfield'
			2='Hartford'
			3='Litchfield'
			4='Middlesex'
			5='New Haven'
			6='New London'
			7='Tolland'
			8='Windham';
run;
