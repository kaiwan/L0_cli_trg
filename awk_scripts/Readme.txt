How to run the sample awk scripts:

1. passwd

Displays a "report" given the raw /etc/passwd file as input.
awk -f passwd2.awk /etc/passwd




2. total

Given a starting folder, it recursively totals up all regular files (and
folders if you want), displaying the total and average number of bytes used.

Eg.
$ ls -l .. | awk -f total.awk          <-- only regular files counted
9 files; total size: 894340 bytes (873 Kb, 0.853     Mb)
average size: 99371 bytes
$ 
$ ls -l .. | awk -f total.awk -v dirs=1   <-- directories also counted
13 directories and 9 files [total: 22] found.
sizes:
directories: 53248 bytes     files: 894340 bytes
total: 947588 bytes (925 Kb, 0.904     Mb)
average: 43072 bytes
$ 




3. sz

Finds all regular files in a given folder (recursively from there), that are greater than a given filesize.

$ ./sz.sh 
Usage: ./sz.sh start_folder min_size
$ 

[Internally invokes the sz.awk awk script].




4. monitor
We want to check periodically if anyone is running certain "blacklisted"
programs; currently, these are 'wall', 'talk' and 'write'. 
So we have a script monitor this with the aid of an awk script.

$ ./mon1.sh

[Internally invokes the mon1.awk awk script].

