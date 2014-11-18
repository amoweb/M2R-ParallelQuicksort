
OUTPUT_DIRECTORY=data/`hostname`_`date +%F`
mkdir -p $OUTPUT_DIRECTORY
OUTPUT_FILE=$OUTPUT_DIRECTORY/measurements_`date +%R`.txt

touch $OUTPUT_FILE
#for i in 100 1000 10000 100000 1000000 10000000 30000000 60000000 90000000; do
for i in 100000000; do
        echo "Size: $i";
        for j in 0 1 2 3 4; do
        #for j in 0 1 2 3 4 5 6 7 8; do
            for rep in `seq 1 5`; do
            echo "$j - $rep";
                echo "Size: $i" >> $OUTPUT_FILE;
                echo "Threads: $j" >> $OUTPUT_FILE;
                ./src/parallelQuicksort $i $j $rep >> $OUTPUT_FILE;
            done ;
    done ;
done
