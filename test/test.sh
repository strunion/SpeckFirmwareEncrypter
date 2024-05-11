# runs encrypter.py with <fast_blink.bin> and <slow_blink.bin> as input
# and compares the output file with encrypted_fast_blink.bin and encrypted_slow_blink.bin

TEST_FILES="slow_blink.bin fast_blink.bin"

KEY=0x1b1a1918131211100b0a090803020100

for file in $TEST_FILES
do
    # Run the encrypter.py script with the $file
    python3 ../encrypter.py -i $file -k $KEY -o test.bin
    # Compare the output file with the expected output file
    if cmp -s test.bin encrypted_$file; then
        echo "Test $file passed"
    else
        echo "Test $file failed"
    fi
done
# Remove the output file
rm test.bin
