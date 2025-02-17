{
    # Build the direction array and set current position
    [1 10000:z-1z~)]z*z

    @{
      # For each character in the input:

      # set current direction by cutting 0, 1 or 3 elements 
      # from the beginning of the directions array
      'SR L'?
      @>

      # move to current direction
      .0=@+.

      # format as number and addd newline
      `n
    }%

    # split by newlines
    n/

    # cleanup
    @;\;

    # return 1 if array contains distinct elements, 0 otherwise
    ..&=
}:ungolfed;


{
[10.4?:z-10z~)]z*z@{'R L S'?@>(@+.`n}%n/@;\;..&=
}:program;


# Tests
#######
{ .@.@={;;'OK.'}{'FAIL! ['\+'] does not equal ['+\']!'++}if puts}:assert_equals;

# Valid snakes
##############

'SSLSLSRSRSSRSSSLLSSSRRLRSLRLLSSS'
program 1 assert_equals

'SRRLSLLRRLLSLRRSRLLRSRRLLRRSRLLSSLLRSRRLLRRSRLLRSRRLSLLRRLLSLRR' #(A hilbert curve)
program 1 assert_equals

'RLLRSRRLSLLRRLLSLRRSRLLRSRRLLRRSRLLSSLLRSRRLLRRSRLLRSRRLSLLRRLLSLRRSRLLRSRRLLRRSRLLSSLLRSRRLLRR'
program 1 assert_equals

'SRRSRSRSSRSSRSSSRSSSRSSSSRSSSSRSSSSSRSSSSSRSSSSSSRSSSSSSRSSSSSS' #(Spiral)
program 1 assert_equals

'SSSSSSSSSSLSSSSSSSLSSSSSSSSLSSSSSLSSSSSSLSSSLLRRLLRRLLSLSSSRRSSSSRSSSRSSSSSSRSSSSSRSSSSSSSSRSSSSSSSRSSSSSSSSS' #(bigger, squigglier spiral)
program 1 assert_equals

'LRSLLRLSRSLLSRLSLRSLSSSLRRSSLSRRLRSRLRLSLRLLRLRSSLSLRLRSRSSSSSLSRRLSLSSSRRLRLRLRLRRLLSSLSSSRRLRLRLRLRLSLSSSSSSSSSSSSSRLRLLRLRLRLRLRLRLRLSLSSSLSLSLL'
program 1 assert_equals



# Invalid snakes
################

'SRRLSLLRRLLSLRRSRLLRSRRLLRRSRLLLLRSRRLLRRSRLLRSRRLSLLRRLLSLRR'
program 0 assert_equals

'SRRLSLLRRLLSLRRSRLLRSRRLLSRSSSRSSSSSSSRSRSSSSSSSRRLLRRSRLLRSRRLSLLRRLLSLRR'
program 0 assert_equals

'SRRSRSRSSRSSRSSSRSSSRSSSSSSSSSSRSSSSRSSSSSRSSSSSRSSSSSSRSSSSSSRSSSSSS'
program 0 assert_equals

'SSSSSSSSSSLSSSSSSSLSSSSSSSSLSSSSSLSSSSSSLSSSLLRRLRLRRLLSLSSSRRSSSSRSSSRSSSSSSRSSSSSRSSSSSSSSRSSSSSSSRSSSSSSSSS'
program 0 assert_equals

'LRSLLRLSRSLLSRLSLRSLSSSLRRSSLSRRLRSRLRLSLRLLRLRSSLSLRLRSRSSSSSLSRRLSLSSSRRLRLRLRLRRLLSSLSSSRRLRLRLRLRLSLSSSSSSSSSSSSSRLRLLRLRLRLRLRLRLRLSLSSSLSLSLLSLRLSLRSLRSLRSLSLSLRSRLSLRSLRLSRSLLLRLRLRRRRSLSLSSLLSLSLSLSSLLSLSLLRLRSLLRSRLSLSSLLLLSSSSSSSSSSSSSSSSSSSSRLRLLRRLRLRLLRLRLRLRLRLSSSSLSLRLLRLSLSSLSLSLSLSLRLLRLSLLLSRSSSSSSSSSSSSSSSRLRLRLLRLRLSLSRSRSSSLSRLRLRLRSLSLSLSRLLSRLSLSLSLSLSSLSLSLLSLSRLLRLRLRLRLRLRLRLRLRLRLSLSRLRLSLLRRLSLLSLSLSLSLSLLSLSLSLRLRLRLRLRLRLRLRLRLRRLRSLSLSLSLSLSLSLSSLSSSSSLSLSSSLSLSLSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS'
program 0 assert_equals










