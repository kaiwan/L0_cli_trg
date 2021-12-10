# passwd2.awk
# prints a report using the account database /etc/passwd
# usage: $ awk -f passwd2.awk /etc/passwd

BEGIN {
        FS=":";
        printf("          Login name       UID  Real Name\n");
        printf("---------------------------------------------------------------------\n");
		isnull=0;
		debug=0;
}
{
	if( $5=="" ) isnull=1;

        uid=$3;
        if( uid == 0 ) {
          if( !isnull ) 
			printf("%19s %10d\t%-30s ***\n",$1,uid,$5);
          else 
			printf("%19s %10d\t- ***\n",$1,uid);
        }
        else {
          if( !isnull ) 
              	printf("%19s %10d\t%-50s\n",$1,uid,$5);
  		  else
               	printf("%19s %10d\t-\n",$1,uid);
        }
	isnull=0;

	# To step : press Enter to continue..
	if (debug) getline < "/dev/stdin" ;
}
END {
        printf("--------------------------------------\n");
        printf("Done: %d records processed",NR);
        printf("\n--------------------------------------\n");
}                      
