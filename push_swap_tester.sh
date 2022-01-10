#!/bin/bash

testingerrors() {
	error=0
	echo
	echo "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ "
	echo
	echo "	Test Error cases"
	echo
	ps_ret=`./push_swap 1 "" 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		echo "	Your push_swap does not return Error with args : 1 \"\" 2 "
		error=1
	fi
	ps_ret=`./push_swap 2 1 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		echo "	Your push_swap does not return Error with args : 2 1 2 "
		error=1
	fi
	ps_ret=`./push_swap 1 2147483648 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		echo "	Your push_swap does not return Error with args : 1 214683648 2 "
		error=1
	fi
	ps_ret=`./push_swap 1 -2147483649 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		echo "	Your push_swap does not return Error with args : 1 -2147483648 2 "
		error=1
	fi
	ps_ret=`./push_swap 1 999999999999999999 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		echo "	Your push_swap does not return Error with args : 1 999999999999999999999 2 "
		error=1
	fi
	ps_ret=`./push_swap 1 " 12" 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		echo "	Your push_swap does not return Error with args : 1 \" 12\" 2 "
		error=1
	fi
	ps_ret=`./push_swap 1 "12ab" 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		echo "	Your push_swap does not return Error with args : 1 \"12ab\" 2 "
		error=1
	fi
	ps_ret=`./push_swap 1 "12 " 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		echo "	Your push_swap does not return Error with args : 1 \"12 \" 2 "
		error=1
	fi
	ps_ret=`./push_swap 1 "ab" 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		echo "	Your push_swap does not return Error with args : 1 \"ab\" 2 "
		error=1
	fi
	ps_ret=`./push_swap 1 " ab" 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		echo "	Your push_swap does not return Error with args : 1 \" ab\" 2 "
		error=1
	fi
	if [ $error == 0 ]
	then
		echo "	Your push_swap perfectly handle any Error case"
	fi
	echo
	echo "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ "
	echo
}

testing3() {
	max_ret_len=0
	nb_errors=0

	ret_len=`./push_swap 1 2 3 | wc -l`
	ret_checker=`./push_swap 1 2 3 | ./checker_linux 1 2 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 3 2 | wc -l`
	ret_checker=`./push_swap 1 3 2 | ./checker_linux 1 3 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 1 2 | wc -l`
	ret_checker=`./push_swap 3 1 2 | ./checker_linux 3 1 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 2 1 | wc -l`
	ret_checker=`./push_swap 3 2 1 | ./checker_linux 3 2 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 3 1 | wc -l`
	ret_checker=`./push_swap 2 3 1 | ./checker_linux 2 3 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 1 3 | wc -l`
	ret_checker=`./push_swap 2 1 3 | ./checker_linux 2 1 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	echo
	echo "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ "
	echo
	echo "	Test 3 numbers"
	echo "	6 tests with all possibilities"
	echo
	echo "	Max : $max_ret_len"
	echo "	Number of errors : $nb_errors"
	echo
	echo "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ "
	echo
}

testing5() {
	max_ret_len=0
	nb_errors=0

	ret_len=`./push_swap 1 2 3 4 5 | wc -l`
	ret_checker=`./push_swap 1 2 3 4 5 | ./checker_linux 1 2 3 4 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 2 3 5 4 | wc -l`
	ret_checker=`./push_swap 1 2 3 5 4 | ./checker_linux 1 2 3 5 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 2 4 3 5 | wc -l`
	ret_checker=`./push_swap 1 2 4 3 5 | ./checker_linux 1 2 4 3 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 2 4 5 3 | wc -l`
	ret_checker=`./push_swap 1 2 4 5 3 | ./checker_linux 1 2 4 5 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 2 5 3 4 | wc -l`
	ret_checker=`./push_swap 1 2 5 3 4 | ./checker_linux 1 2 5 3 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 2 5 4 3 | wc -l`
	ret_checker=`./push_swap 1 2 5 4 3 | ./checker_linux 1 2 5 4 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 3 2 4 5 | wc -l`
	ret_checker=`./push_swap 1 3 2 4 5 | ./checker_linux 1 3 2 4 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 3 2 5 4 | wc -l`
	ret_checker=`./push_swap 1 3 2 5 4 | ./checker_linux 1 3 2 5 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 3 4 2 5 | wc -l`
	ret_checker=`./push_swap 1 3 4 2 5 | ./checker_linux 1 3 4 2 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 3 4 5 2 | wc -l`
	ret_checker=`./push_swap 1 3 4 5 2 | ./checker_linux 1 3 4 5 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 3 5 2 4 | wc -l`
	ret_checker=`./push_swap 1 3 5 2 4 | ./checker_linux 1 3 5 2 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 3 5 4 2 | wc -l`
	ret_checker=`./push_swap 1 3 5 4 2 | ./checker_linux 1 3 5 4 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 4 2 3 5 | wc -l`
	ret_checker=`./push_swap 1 4 2 3 5 | ./checker_linux 1 4 2 3 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 4 2 5 3 | wc -l`
	ret_checker=`./push_swap 1 4 2 5 3 | ./checker_linux 1 4 2 5 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 4 3 2 5 | wc -l`
	ret_checker=`./push_swap 1 4 3 2 5 | ./checker_linux 1 4 3 2 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 4 3 5 2 | wc -l`
	ret_checker=`./push_swap 1 4 3 5 2 | ./checker_linux 1 4 3 5 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 4 5 2 3 | wc -l`
	ret_checker=`./push_swap 1 4 5 2 3 | ./checker_linux 1 4 5 2 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 4 5 3 2 | wc -l`
	ret_checker=`./push_swap 1 4 5 3 2 | ./checker_linux 1 4 5 3 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 5 2 3 4 | wc -l`
	ret_checker=`./push_swap 1 5 2 3 4 | ./checker_linux 1 5 2 3 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 5 2 4 3 | wc -l`
	ret_checker=`./push_swap 1 5 2 4 3 | ./checker_linux 1 5 2 4 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 5 3 2 4 | wc -l`
	ret_checker=`./push_swap 1 5 3 2 4 | ./checker_linux 1 5 3 2 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 5 3 4 2 | wc -l`
	ret_checker=`./push_swap 1 5 3 4 2 | ./checker_linux 1 5 3 4 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 5 4 2 3 | wc -l`
	ret_checker=`./push_swap 1 5 4 2 3 | ./checker_linux 1 5 4 2 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 1 5 4 3 2 | wc -l`
	ret_checker=`./push_swap 1 5 4 3 2 | ./checker_linux 1 5 4 3 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 1 3 4 5 | wc -l`
	ret_checker=`./push_swap 2 1 3 4 5 | ./checker_linux 2 1 3 4 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 1 3 5 4 | wc -l`
	ret_checker=`./push_swap 2 1 3 5 4 | ./checker_linux 2 1 3 5 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 1 4 3 5 | wc -l`
	ret_checker=`./push_swap 2 1 4 3 5 | ./checker_linux 2 1 4 3 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 1 4 5 3 | wc -l`
	ret_checker=`./push_swap 2 1 4 5 3 | ./checker_linux 2 1 4 5 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 1 5 3 4 | wc -l`
	ret_checker=`./push_swap 2 1 5 3 4 | ./checker_linux 2 1 5 3 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 1 5 4 3 | wc -l`
	ret_checker=`./push_swap 2 1 5 4 3 | ./checker_linux 2 1 5 4 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 3 1 4 5 | wc -l`
	ret_checker=`./push_swap 2 3 1 4 5 | ./checker_linux 2 3 1 4 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 3 1 5 4 | wc -l`
	ret_checker=`./push_swap 2 3 1 5 4 | ./checker_linux 2 3 1 5 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 3 4 1 5 | wc -l`
	ret_checker=`./push_swap 2 3 4 1 5 | ./checker_linux 2 3 4 1 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 3 4 5 1 | wc -l`
	ret_checker=`./push_swap 2 3 4 5 1 | ./checker_linux 2 3 4 5 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 3 5 1 4 | wc -l`
	ret_checker=`./push_swap 2 3 5 1 4 | ./checker_linux 2 3 5 1 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 3 5 4 1 | wc -l`
	ret_checker=`./push_swap 2 3 5 4 1 | ./checker_linux 2 3 5 4 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 4 1 3 5 | wc -l`
	ret_checker=`./push_swap 2 4 1 3 5 | ./checker_linux 2 4 1 3 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 4 1 5 3 | wc -l`
	ret_checker=`./push_swap 2 4 1 5 3 | ./checker_linux 2 4 1 5 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 4 3 1 5 | wc -l`
	ret_checker=`./push_swap 2 4 3 1 5 | ./checker_linux 2 4 3 1 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 4 3 5 1 | wc -l`
	ret_checker=`./push_swap 2 4 3 5 1 | ./checker_linux 2 4 3 5 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 4 5 1 3 | wc -l`
	ret_checker=`./push_swap 2 4 5 1 3 | ./checker_linux 2 4 5 1 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 4 5 3 1 | wc -l`
	ret_checker=`./push_swap 2 4 5 3 1 | ./checker_linux 2 4 5 3 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 5 1 3 4 | wc -l`
	ret_checker=`./push_swap 2 5 1 3 4 | ./checker_linux 2 5 1 3 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 5 1 4 3 | wc -l`
	ret_checker=`./push_swap 2 5 1 4 3 | ./checker_linux 2 5 1 4 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 5 3 1 4 | wc -l`
	ret_checker=`./push_swap 2 5 3 1 4 | ./checker_linux 2 5 3 1 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 5 3 4 1 | wc -l`
	ret_checker=`./push_swap 2 5 3 4 1 | ./checker_linux 2 5 3 4 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 5 4 1 3 | wc -l`
	ret_checker=`./push_swap 2 5 4 1 3 | ./checker_linux 2 5 4 1 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 2 5 4 3 1 | wc -l`
	ret_checker=`./push_swap 2 5 4 3 1 | ./checker_linux 2 5 4 3 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 1 2 4 5 | wc -l`
	ret_checker=`./push_swap 3 1 2 4 5 | ./checker_linux 3 1 2 4 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 1 2 5 4 | wc -l`
	ret_checker=`./push_swap 3 1 2 5 4 | ./checker_linux 3 1 2 5 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 1 4 2 5 | wc -l`
	ret_checker=`./push_swap 3 1 4 2 5 | ./checker_linux 3 1 4 2 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 1 4 5 2 | wc -l`
	ret_checker=`./push_swap 3 1 4 5 2 | ./checker_linux 3 1 4 5 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 1 5 2 4 | wc -l`
	ret_checker=`./push_swap 3 1 5 2 4 | ./checker_linux 3 1 5 2 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 1 5 4 2 | wc -l`
	ret_checker=`./push_swap 3 1 5 4 2 | ./checker_linux 3 1 5 4 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 2 1 4 5 | wc -l`
	ret_checker=`./push_swap 3 2 1 4 5 | ./checker_linux 3 2 1 4 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 2 1 5 4 | wc -l`
	ret_checker=`./push_swap 3 2 1 5 4 | ./checker_linux 3 2 1 5 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 2 4 1 5 | wc -l`
	ret_checker=`./push_swap 3 2 4 1 5 | ./checker_linux 3 2 4 1 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 2 4 5 1 | wc -l`
	ret_checker=`./push_swap 3 2 4 5 1 | ./checker_linux 3 2 4 5 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 2 5 1 4 | wc -l`
	ret_checker=`./push_swap 3 2 5 1 4 | ./checker_linux 3 2 5 1 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 2 5 4 1 | wc -l`
	ret_checker=`./push_swap 3 2 5 4 1 | ./checker_linux 3 2 5 4 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 4 1 2 5 | wc -l`
	ret_checker=`./push_swap 3 4 1 2 5 | ./checker_linux 3 4 1 2 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 4 1 5 2 | wc -l`
	ret_checker=`./push_swap 3 4 1 5 2 | ./checker_linux 3 4 1 5 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 4 2 1 5 | wc -l`
	ret_checker=`./push_swap 3 4 2 1 5 | ./checker_linux 3 4 2 1 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 4 2 5 1 | wc -l`
	ret_checker=`./push_swap 3 4 2 5 1 | ./checker_linux 3 4 2 5 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 4 5 1 2 | wc -l`
	ret_checker=`./push_swap 3 4 5 1 2 | ./checker_linux 3 4 5 1 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 4 5 2 1 | wc -l`
	ret_checker=`./push_swap 3 4 5 2 1 | ./checker_linux 3 4 5 2 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 5 1 2 4 | wc -l`
	ret_checker=`./push_swap 3 5 1 2 4 | ./checker_linux 3 5 1 2 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 5 1 4 2 | wc -l`
	ret_checker=`./push_swap 3 5 1 4 2 | ./checker_linux 3 5 1 4 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 5 2 1 4 | wc -l`
	ret_checker=`./push_swap 3 5 2 1 4 | ./checker_linux 3 5 2 1 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 5 2 4 1 | wc -l`
	ret_checker=`./push_swap 3 5 2 4 1 | ./checker_linux 3 5 2 4 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 5 4 1 2 | wc -l`
	ret_checker=`./push_swap 3 5 4 1 2 | ./checker_linux 3 5 4 1 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 3 5 4 2 1 | wc -l`
	ret_checker=`./push_swap 3 5 4 2 1 | ./checker_linux 3 5 4 2 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 1 2 3 5 | wc -l`
	ret_checker=`./push_swap 4 1 2 3 5 | ./checker_linux 4 1 2 3 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 1 2 5 3 | wc -l`
	ret_checker=`./push_swap 4 1 2 5 3 | ./checker_linux 4 1 2 5 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 1 3 2 5 | wc -l`
	ret_checker=`./push_swap 4 1 3 2 5 | ./checker_linux 4 1 3 2 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 1 3 5 2 | wc -l`
	ret_checker=`./push_swap 4 1 3 5 2 | ./checker_linux 4 1 3 5 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 1 5 2 3 | wc -l`
	ret_checker=`./push_swap 4 1 5 2 3 | ./checker_linux 4 1 5 2 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 1 5 3 2 | wc -l`
	ret_checker=`./push_swap 4 1 5 3 2 | ./checker_linux 4 1 5 3 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 2 1 3 5 | wc -l`
	ret_checker=`./push_swap 4 2 1 3 5 | ./checker_linux 4 2 1 3 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 2 1 5 3 | wc -l`
	ret_checker=`./push_swap 4 2 1 5 3 | ./checker_linux 4 2 1 5 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 2 3 1 5 | wc -l`
	ret_checker=`./push_swap 4 2 3 1 5 | ./checker_linux 4 2 3 1 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 2 3 5 1 | wc -l`
	ret_checker=`./push_swap 4 2 3 5 1 | ./checker_linux 4 2 3 5 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 2 5 1 3 | wc -l`
	ret_checker=`./push_swap 4 2 5 1 3 | ./checker_linux 4 2 5 1 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 2 5 3 1 | wc -l`
	ret_checker=`./push_swap 4 2 5 3 1 | ./checker_linux 4 2 5 3 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 3 1 2 5 | wc -l`
	ret_checker=`./push_swap 4 3 1 2 5 | ./checker_linux 4 3 1 2 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 3 1 5 2 | wc -l`
	ret_checker=`./push_swap 4 3 1 5 2 | ./checker_linux 4 3 1 5 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 3 2 1 5 | wc -l`
	ret_checker=`./push_swap 4 3 2 1 5 | ./checker_linux 4 3 2 1 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 3 2 5 1 | wc -l`
	ret_checker=`./push_swap 4 3 2 5 1 | ./checker_linux 4 3 2 5 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 3 5 1 2 | wc -l`
	ret_checker=`./push_swap 4 3 5 1 2 | ./checker_linux 4 3 5 1 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 3 5 2 1 | wc -l`
	ret_checker=`./push_swap 4 3 5 2 1 | ./checker_linux 4 3 5 2 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 5 1 2 3 | wc -l`
	ret_checker=`./push_swap 4 5 1 2 3 | ./checker_linux 4 5 1 2 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 5 1 3 2 | wc -l`
	ret_checker=`./push_swap 4 5 1 3 2 | ./checker_linux 4 5 1 3 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 5 2 1 3 | wc -l`
	ret_checker=`./push_swap 4 5 2 1 3 | ./checker_linux 4 5 2 1 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 5 2 3 1 | wc -l`
	ret_checker=`./push_swap 4 5 2 3 1 | ./checker_linux 4 5 2 3 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 5 3 1 2 | wc -l`
	ret_checker=`./push_swap 4 5 3 1 2 | ./checker_linux 4 5 3 1 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 4 5 3 2 1 | wc -l`
	ret_checker=`./push_swap 4 5 3 2 1 | ./checker_linux 4 5 3 2 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 1 2 3 4 | wc -l`
	ret_checker=`./push_swap 5 1 2 3 4 | ./checker_linux 5 1 2 3 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 1 2 4 3 | wc -l`
	ret_checker=`./push_swap 5 1 2 4 3 | ./checker_linux 5 1 2 4 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 1 3 2 4 | wc -l`
	ret_checker=`./push_swap 5 1 3 2 4 | ./checker_linux 5 1 3 2 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 1 3 4 2 | wc -l`
	ret_checker=`./push_swap 5 1 3 4 2 | ./checker_linux 5 1 3 4 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 1 4 2 3 | wc -l`
	ret_checker=`./push_swap 5 1 4 2 3 | ./checker_linux 5 1 4 2 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 1 4 3 2 | wc -l`
	ret_checker=`./push_swap 5 1 4 3 2 | ./checker_linux 5 1 4 3 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 2 1 3 4 | wc -l`
	ret_checker=`./push_swap 5 2 1 3 4 | ./checker_linux 5 2 1 3 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 2 1 4 3 | wc -l`
	ret_checker=`./push_swap 5 2 1 4 3 | ./checker_linux 5 2 1 4 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 2 3 1 4 | wc -l`
	ret_checker=`./push_swap 5 2 3 1 4 | ./checker_linux 5 2 3 1 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 2 3 4 1 | wc -l`
	ret_checker=`./push_swap 5 2 3 4 1 | ./checker_linux 5 2 3 4 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 2 4 1 3 | wc -l`
	ret_checker=`./push_swap 5 2 4 1 3 | ./checker_linux 5 2 4 1 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 2 4 3 1 | wc -l`
	ret_checker=`./push_swap 5 2 4 3 1 | ./checker_linux 5 2 4 3 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 3 1 2 4 | wc -l`
	ret_checker=`./push_swap 5 3 1 2 4 | ./checker_linux 5 3 1 2 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 3 1 4 2 | wc -l`
	ret_checker=`./push_swap 5 3 1 4 2 | ./checker_linux 5 3 1 4 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 3 2 1 4 | wc -l`
	ret_checker=`./push_swap 5 3 2 1 4 | ./checker_linux 5 3 2 1 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 3 2 4 1 | wc -l`
	ret_checker=`./push_swap 5 3 2 4 1 | ./checker_linux 5 3 2 4 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 3 4 1 2 | wc -l`
	ret_checker=`./push_swap 5 3 4 1 2 | ./checker_linux 5 3 4 1 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 3 4 2 1 | wc -l`
	ret_checker=`./push_swap 5 3 4 2 1 | ./checker_linux 5 3 4 2 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 4 1 2 3 | wc -l`
	ret_checker=`./push_swap 5 4 1 2 3 | ./checker_linux 5 4 1 2 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 4 1 3 2 | wc -l`
	ret_checker=`./push_swap 5 4 1 3 2 | ./checker_linux 5 4 1 3 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 4 2 1 3 | wc -l`
	ret_checker=`./push_swap 5 4 2 1 3 | ./checker_linux 5 4 2 1 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 4 2 3 1 | wc -l`
	ret_checker=`./push_swap 5 4 2 3 1 | ./checker_linux 5 4 2 3 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 4 3 1 2 | wc -l`
	ret_checker=`./push_swap 5 4 3 1 2 | ./checker_linux 5 4 3 1 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`./push_swap 5 4 3 2 1 | wc -l`
	ret_checker=`./push_swap 5 4 3 2 1 | ./checker_linux 5 4 3 2 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	echo
	echo "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ "
	echo
	echo "	Test 5 numbers"
	echo "	120 tests with all possibilities"
	echo
	echo "	Max : $max_ret_len"
	echo "	Number of errors : $nb_errors"
	echo
	echo "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ "
	echo
}

testing100() {
max=0
min=100000
test_nb=50000
value_nb=100
min_val=1
max_val=50000
moyenne=0
nb_errors=0
	for i in `seq 1 $test_nb`
	do
		arg=`shuf -i $min_val-$max_val -n $value_nb`
		arg=`echo $arg | sed 's/\n/ /g'`
		current=`./push_swap $arg | wc -l`
		ret_checker=`./push_swap $arg | ./checker_linux $arg`
		if [ "$ret_checker" != "OK" ]
		then
			nb_errors=$(($nb_errors+1))
		fi
		moyenne=$(($moyenne+$current))
		if [[ $current -gt $max ]]
		then
			max="$current"
		fi
		if [ $current -lt $min ]
		then
			min="$current"
		fi
	done
	moyenne=$(($moyenne/$i))
	echo
	echo "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ "
	echo
	echo "	Testing $value_nb numbers"
	echo "	$test_nb tests"
	echo
	echo "	Max : $max"
	echo "	Min : $min"
	echo "	Moyenne : $moyenne"
	echo "	Number of errors : $nb_errors"
	echo
	echo "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ "
	echo
}

testing500() {
max=0
min=100000
test_nb=5000
value_nb=500
min_val=1
max_val=50000
moyenne=0
nb_errors=0
	for i in `seq 1 $test_nb`
	do
		arg=`shuf -i $min_val-$max_val -n $value_nb`
		arg=`echo $arg | sed 's/\n/ /g'`
		current=`./push_swap $arg | wc -l`
		ret_checker=`./push_swap $arg | ./checker_linux $arg`
		if [ "$ret_checker" != "OK" ]
		then
			nb_errors=$(($nb_errors+1))
		fi
		moyenne=$(($moyenne+$current))
		if [[ $current -gt $max ]]
		then
			max="$current"
		fi
		if [ $current -lt $min ]
		then
			min="$current"
		fi
	done
	moyenne=$(($moyenne/$i))
	echo
	echo "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ "
	echo
	echo "	Testing $value_nb numbers"
	echo "	$test_nb tests"
	echo
	echo "	Max : $max"
	echo "	Min : $min"
	echo "	Moyenne : $moyenne"
	echo "	Number of errors : $nb_errors"
	echo
	echo "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ "
	echo
}

main() {
	testingerrors
	testing3
	testing5
	testing100
	testing500
}

main
