data class;
set sashelp.class;
run;


proc sql noprint;
select distinct name into: Stdname1-  from class;
quit;
%put &=Stdname1;
%put &=sqlobs;
 
%macro class;
%do i=1 %to &sqlobs.;
data &&stdname&i.;
set class;
if name="&&stdname&i." then output;
run;

data &&stdname&i.;
set &&stdname&i.;
bmi=weight*height;
run;
%end;
%mend;
%class;
