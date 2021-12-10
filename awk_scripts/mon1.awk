# mon1.awk
# usage: ps -Aef | awk -f m1.awk
BEGIN {
}
{
        if( ($8=="Wall") || ($8=="write") || ($8=="talk") ) {
                printf("caught %s: running %s tty %s time %s pid %d\n",
$1,$8,$6,$5,$2);
        }
}
