
OUTPUT_DIRECTORY=data/`hostname`_`date +%F`
mkdir -p $OUTPUT_DIRECTORY
OUTPUT_FILE=$OUTPUT_DIRECTORY/measurements_`date +%R`.txt

touch $OUTPUT_FILE
for i in 100 1000 10000 100000 1000000 10000000; do
        for j in 0 1 2 3 4 5 6 7 8; do
            for rep in `seq 1 5`; do
                echo "Size: $i" >> $OUTPUT_FILE;
                echo "Threads: $j" >> $OUTPUT_FILE;
                ./src/parallelQuicksort $i $j >> $OUTPUT_FILE;
            done ;
    done ;
done
