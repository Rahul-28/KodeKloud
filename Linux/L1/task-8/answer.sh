ssh natasha@ststor01

tar -czvf james.tar.gz /data/james

# Explanation of the command:
# -c: Create a new archive.
# -z: Filter the archive through gzip compression.
# -v: Verbosely list the files processed (optional, shows progress).
# -f: Specify the filename of the archive.
# james.tar.gz: The name you want to give your new archive file.
# /data/james: The actual directory or file(s) you want to compress

# output
# tar: Removing leading `/' from member names
# /data/james/
# /data/james/nautilus1.txt
# /data/james/nautilus2.txt
# /data/james/nautilus3.txt

sudo mv james.tar.gz /home/