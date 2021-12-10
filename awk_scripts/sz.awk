# sz.awk
# 
# Usage:
# Via using find (it's the default):
# find <start-folder> -type f -ls | awk -f sz_find.awk [-v sz=<numbytes>]
# -or-
# ls -lR <path> | awk -f sz.awk [filesize]
#  -could sort the output by size (largest first) by:
# ls -lR <path> | awk -f sz.awk [filesize] |sort -k3nr

BEGIN {
   # if size is not passed, assign a "reasonable" default instead...
#  	if( ARGC==1 ) sz=1024*1024;		# 1 Mb
#	else if ( ARGC==2 ) sz=ARGV[1];

   UsingFind=1   # set to 0 is using 'ls'

   printf("File Size Reporter : %d bytes\n",sz);
   if (sz == 0)
       sz = 1024*1024; # 1 MB default

   printf("File Size Reporter > %d bytes\n",sz);
   n=0;
}

{
#if( $1 ~ /^[dlbcps]/ ) {   # skip directories,symlinks,blk/char,...
#        printf("\n\tskipping %s",$9);
#}
#if( ($1 ~ /^-/) && ($5 > sz) ) {
if (UsingFind == 1) {
	if ($7 > sz) {
		printf("\n%-60s: %9d bytes", $11, $7);
		n++;
	}
} else {   # using 'ls -lR'
	if ($5 > sz) {
		printf("\n%-60s: %9d bytes", $9, $5);
		n++;
	}
}
}

END {
printf("\n----------------------------\n");
printf("Done: total of %d files processed, %d files found > %d bytes.\n",
   NR, n, sz );
}

# Eg. Output::
# 
# $ ls -lR .. | awk -f sz3.awk -v sz=65535
# File Size Reporter > 65535 bytes
# bigfl*: size 157228 bytes
# bigfl2*: size 157228 bytes
# treeps-1.2.1.tar.gz*: size 391785 bytes
# treeps-1.2.1.tar.gz.orig*: size 391785 bytes
# treeps*: size 332704 bytes
# treeps.o: size 166128 bytes
# menu_bar.c: size 66401 bytes
# treeps.c: size 238997 bytes
# Tree.c: size 121321 bytes
# ----------------------------
# Done: total of 1345 files processed, 9 files found > 65535 bytes.
# $ 
