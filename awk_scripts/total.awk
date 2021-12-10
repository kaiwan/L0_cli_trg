# total.awk
# run as:
#	$ ls -l | awk -f total.awk [-v dirs=[0|1]]
#
BEGIN {
	total_f = nf = total_d = nd = 0;
}
{
	if( $1~/^-/ ) {
		nf ++;
		total_f += $5;
	}
	else if( (dirs==1) && ($1~/^d/) ) {
		nd ++;
		total_d += $5;
	}
}
END {
	if( !nf && !nd ) { 
		printf("No files/directories found..exiting\n");
		exit(1);
	}

	if( dirs ) {
		total = total_f + total_d;
		printf("%d directories and %d files [total: %ld] found.\n", nd, nf, nf+nd);
		printf("sizes:\ndirectories: %ld bytes     files: %ld bytes\ntotal: %ld bytes (%ld Kb, %-9.3f Mb)\n\
average: %ld bytes\n", 
			total_d, total_f, total, 
			total/1024, total/(1024*1024),
			total/(nf+nd) );
	}
	else {
		printf("%d files; ", nf );
		printf("total size: %ld bytes (%d Kb, %-9.3f Mb)\naverage size: %d bytes\n",
				total_f, total_f/1024, total_f/(1024*1024), total_f/nf);
	}
}

# end total.awk

