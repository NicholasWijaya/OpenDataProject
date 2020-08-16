
%LET 	SERIES= W:\Planning\Health Info Systems and Reporting\POP\NCHS\Series;
libname SERIES "W:\Planning\Health Info Systems and Reporting\POP\NCHS\Series";

%include "W:\Planning\Health Info Systems and Reporting\POP\NCHS\Series\NCHS_formats.sas"; 
proc format;
	value AGETwentyOne
	1-21="Ages 1-21"
	0 = "Age 0"
	other="Ages 22+";
run;


* TABULATE SERIES DATASETS INTO TABLES -------------------------------------------*;
	* State level ASRH *;
	proc sort data=SERIES.a1srh_state_icen0009_pcen1016 out=ct; by YEAR; run;

	ods html path="W:\Planning\Health Info Systems and Reporting\POP\NCHS\Series" file="Oneto21_state_i009p1016.xls";
	Proc tabulate data=ct;
	FORMAT age ageTwentyOne.;
	Class year age;
	Var POP;
	table year="",(all age="")*POP=""*SUM=""/BOX="CT Population Totals, Age Groups Defined by Ages 1-21";
	run;
	ods html close;

	ods html file="W:\Planning\Health Info Systems and Reporting\POP\NCHS\Series\Fem1519_state_i009p1014.xls";
	Proc tabulate data=ct;
	where sex=2 and age in(15:19);
	FORMAT agegp18 agefert.;
	Class year age;
	Var POP;
	table year="",(all age="")*POP=""*SUM=""/BOX="Females 15-19 Icen0009Pcen1014";
	run;
	ods html close;


	ods html file="T:\SHA\SHA Report\Population_Women15-44.xls";
	Proc tabulate data=ct;
	where sex=2;
	FORMAT agegp18 agefert.;
	Class year agegp18;
	Var POP;
	table year,(all agegp18="")*POP=""*SUM=""/BOX="Women 15-44 Icen0009Pcen1012";
	run;
	ods html close;

	ods tagsets.excelxp file="&SERIES.\Table_icenASRHbySTATE_2000-2010.xls" style=minimal;
		%macro icenstate;
			%do i = 2000 %to 2010;
				TITLE "Intercensal ASRH Population, &i.";
				ods tagsets.excelxp options(sheet_interval='none' sheet_name="&i.");
					Proc tabulate data=ct;
					where year = %eval(&i.)*1;
					FORMAT agegp19 age19fmt. race racefmt. sex sexfmt. hisp hispfmt.;
					Class agegp19 RACE SEX HISP;
					Var POP;
					table agegp19="" ALL,((hisp=""*((Race=""*sex="") ALL)) ALL)*POP=""*SUM=""/BOX="Connecticut, &i.";
					/* Documentation for 2000-2010 Bridged-Race Intercensal Population Estimates for Calculating Vital Rates:
					The bridged-race intercensal estimates of the resident population of the United States for 2000-2010 represent a revision of the postcensal population estimates for this period. These estimates reconcile the 2000-based postcensal estimates of the July 1, 2000-July 1, 2010 populations with the 2010 census counts. The following series of estimates are being released:
					1) National: Intercensal estimates of the July 1 resident population of the United States (i.e., July 1, 2000-July 1, 2010) by year, single-year of age, bridged-race category (White, Black or African American, American Indian or Alaska Native, Asian or Pacific Islander),, and Hispanic origin (not Hispanic or Latino, Hispanic or Latino), and sex (1, 2)
					2) State: Intercensal estimates of the July 1 resident population of the 50 states and the District of Columbia (i.e. July 1, 2000-July 1, 2010) by year, 5-year age group, bridged-race category (White, Black or African American, American Indian or Alaska Native, Asian or Pacific Islander),, and Hispanic origin (not Hispanic or Latino, Hispanic or Latino), and sex (3, 4).
					The bridged-race intercensal population estimates on these files result from bridging the July 1, 2000-July 1, 2010 intercensal estimates with 31 race groups (the 31 race groups used in Census 2010 in accordance with the 1997 Office of Management and Budget (OMB) standards for the collection of data on race and ethnicity) to the four race categories specified under the 1977 OMB standards (5, 6).
					Age, sex, and Hispanic origin subtotals for “All races” obtained from these bridged files are consistent with those from the Census Bureau’s unbridged 2000-2010 intercensal series of estimates (7).
					The July 1, 2000-July 1, 2010 intercensal estimates are based on the 2000 and 2010 censuses and on 2000-2010 postcensal estimates (see 'Bridged-race Intercensal Population Estimates” below. The intercensal estimates for July 1, 2000-July 1, 2009 were derived using the methodology that has been used for the past several decades (8). The intercensal estimates for July 1, 2010, however, were derived using a different formula (8).
					*/
					run;
				quit;
			%end;
		%mend;
		%icenstate;
	ODS tagsets.excelxp close;

	ods tagsets.excelxp file="&SERIES.\Table_ASRHbySTATE_icen0810pcen1112.xls" style=minimal;
				TITLE "Intercensal ASRH Population, &i.";
				ods tagsets.excelxp ;
					Proc tabulate data=ct;
					where year in(2008:2012);
					FORMAT agegp19 age19fmt. race racefmt. sex sexfmt. hisp hispfmt.;
					Class agegp19 RACE SEX HISP;
					Var POP;
					table agegp19="" ALL,((hisp=""*((Race=""*sex="") ALL)) ALL)*POP=""*SUM=""/BOX="Connecticut, 2008-2012";
					/* Documentation for 2000-2010 Bridged-Race Intercensal Population Estimates for Calculating Vital Rates:
					The bridged-race intercensal estimates of the resident population of the United States for 2000-2010 represent a revision of the postcensal population estimates for this period. These estimates reconcile the 2000-based postcensal estimates of the July 1, 2000-July 1, 2010 populations with the 2010 census counts. The following series of estimates are being released:
					1) National: Intercensal estimates of the July 1 resident population of the United States (i.e., July 1, 2000-July 1, 2010) by year, single-year of age, bridged-race category (White, Black or African American, American Indian or Alaska Native, Asian or Pacific Islander),, and Hispanic origin (not Hispanic or Latino, Hispanic or Latino), and sex (1, 2)
					2) State: Intercensal estimates of the July 1 resident population of the 50 states and the District of Columbia (i.e. July 1, 2000-July 1, 2010) by year, 5-year age group, bridged-race category (White, Black or African American, American Indian or Alaska Native, Asian or Pacific Islander),, and Hispanic origin (not Hispanic or Latino, Hispanic or Latino), and sex (3, 4).
					The bridged-race intercensal population estimates on these files result from bridging the July 1, 2000-July 1, 2010 intercensal estimates with 31 race groups (the 31 race groups used in Census 2010 in accordance with the 1997 Office of Management and Budget (OMB) standards for the collection of data on race and ethnicity) to the four race categories specified under the 1977 OMB standards (5, 6).
					Age, sex, and Hispanic origin subtotals for “All races” obtained from these bridged files are consistent with those from the Census Bureau’s unbridged 2000-2010 intercensal series of estimates (7).
					The July 1, 2000-July 1, 2010 intercensal estimates are based on the 2000 and 2010 censuses and on 2000-2010 postcensal estimates (see 'Bridged-race Intercensal Population Estimates” below. The intercensal estimates for July 1, 2000-July 1, 2009 were derived using the methodology that has been used for the past several decades (8). The intercensal estimates for July 1, 2010, however, were derived using a different formula (8).
					*/
					run;
				quit;
			%end;
		%mend;
	ODS tagsets.excelxp close;

	* County level ASRH *;
	ODS tagsets.excelxp file="&NCHS.\Table_icenASRHbyCTY_2000-2010.xls" style=minimal;
		%macro icencty;
			%do i = 2000 %to 2010;
				TITLE "Intercensal ASRH Population, &i.";
				ods tagsets.excelxp options(sheet_interval='none' sheet_name="&i.");
					Proc tabulate data=ct;
					where year = %eval(&i.)*1;
					FORMAT cty2 ctyfmt. agegp19 age19fmt. race racefmt. sex sexfmt. hisp hispfmt.;
					Class cty2 agegp19 RACE SEX HISP;
					Var POP;
					table (ALL="Connecticut" cty2="")*(agegp19="" ALL),((hisp=""*((Race=""*sex="") ALL)) ALL)*POP=""*SUM=""/BOX="State & County, &i.";
					/* Documentation for 2000-2010 Bridged-Race Intercensal Population Estimates for Calculating Vital Rates:
					The bridged-race intercensal estimates of the resident population of the United States for 2000-2010 represent a revision of the postcensal population estimates for this period. These estimates reconcile the 2000-based postcensal estimates of the July 1, 2000-July 1, 2010 populations with the 2010 census counts. The following series of estimates are being released:
					1) National: Intercensal estimates of the July 1 resident population of the United States (i.e., July 1, 2000-July 1, 2010) by year, single-year of age, bridged-race category (White, Black or African American, American Indian or Alaska Native, Asian or Pacific Islander),, and Hispanic origin (not Hispanic or Latino, Hispanic or Latino), and sex (1, 2)
					2) State: Intercensal estimates of the July 1 resident population of the 50 states and the District of Columbia (i.e. July 1, 2000-July 1, 2010) by year, 5-year age group, bridged-race category (White, Black or African American, American Indian or Alaska Native, Asian or Pacific Islander),, and Hispanic origin (not Hispanic or Latino, Hispanic or Latino), and sex (3, 4).
					The bridged-race intercensal population estimates on these files result from bridging the July 1, 2000-July 1, 2010 intercensal estimates with 31 race groups (the 31 race groups used in Census 2010 in accordance with the 1997 Office of Management and Budget (OMB) standards for the collection of data on race and ethnicity) to the four race categories specified under the 1977 OMB standards (5, 6).
					Age, sex, and Hispanic origin subtotals for “All races” obtained from these bridged files are consistent with those from the Census Bureau’s unbridged 2000-2010 intercensal series of estimates (7).
					The July 1, 2000-July 1, 2010 intercensal estimates are based on the 2000 and 2010 censuses and on 2000-2010 postcensal estimates (see 'Bridged-race Intercensal Population Estimates” below. The intercensal estimates for July 1, 2000-July 1, 2009 were derived using the methodology that has been used for the past several decades (8). The intercensal estimates for July 1, 2010, however, were derived using a different formula (8).
					*/
					run;
				quit;
			%end;
		%mend;
		%icencty;
	ODS tagsets.excelxp close;
