#!/bin/bash

Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
BYellow='\033[1;33m'
white='\033[1;37m'
green='\033[0;32m'
red='\033[0;31m'
yell='\033[0;33m'
reset='\033[0m'

checker_path=../checker_linux
push_swap_path=../push_swap
nb_tests_to_run=1
nb_of_values=100
seq_begin=1
seq_end=1024

testingerrors() {
	error=0
	printf "\n${Purple}Test Error cases${reset}\n"
	ps_ret=`$push_swap_path 1 "" 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your push_swap does not return Error with args : 1 \"\" 2 ${reset}\n"
		error=1
	fi
	ps_ret=`$push_swap_path 2 1 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your push_swap does not return Error with args : 2 1 2 ${reset}\n"
		error=1
	fi
	ps_ret=`$push_swap_path 1 2147483648 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your push_swap does not return Error with args : 1 214683648 2 ${reset}\n"
		error=1
	fi
	ps_ret=`$push_swap_path 1 -2147483649 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your push_swap does not return Error with args : 1 -2147483648 2 ${reset}\n"
		error=1
	fi
	ps_ret=`$push_swap_path 1 999999999999999999 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your push_swap does not return Error with args : 1 999999999999999999999 2 ${reset}\n"
		error=1
	fi
	ps_ret=`$push_swap_path 1 " 12" 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your push_swap does not return Error with args : 1 \" 12\" 2 ${reset}\n"
		error=1
	fi
	ps_ret=`$push_swap_path 1 "12ab" 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your push_swap does not return Error with args : 1 \"12ab\" 2 ${reset}\n"
		error=1
	fi
	ps_ret=`$push_swap_path 1 "12 " 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your push_swap does not return Error with args : 1 \"12 \" 2 ${reset}\n"
		error=1
	fi
	ps_ret=`$push_swap_path 1 "ab" 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your push_swap does not return Error with args : 1 \"ab\" 2 ${reset}\n"
		error=1
	fi
	ps_ret=`$push_swap_path 1 " ab" 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your push_swap does not return Error with args : 1 \" ab\" 2 ${reset}\n"
		error=1
	fi
	if [ $error == 0 ]
	then
		printf "${green}Your push_swap perfectly handle any Error case${reset}\n"
	fi
}

testing3() {
	max_ret_len=0
	nb_errors=0

	ret_len=`$push_swap_path 1 2 3 | wc -l`
	ret_checker=`$push_swap_path 1 2 3 | $checker_path 1 2 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 3 2 | wc -l`
	ret_checker=`$push_swap_path 1 3 2 | $checker_path 1 3 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 1 2 | wc -l`
	ret_checker=`$push_swap_path 3 1 2 | $checker_path 3 1 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 2 1 | wc -l`
	ret_checker=`$push_swap_path 3 2 1 | $checker_path 3 2 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 3 1 | wc -l`
	ret_checker=`$push_swap_path 2 3 1 | $checker_path 2 3 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 1 3 | wc -l`
	ret_checker=`$push_swap_path 2 1 3 | $checker_path 2 1 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	printf "\n${Purple}Test ${Cyan}3 ${Purple}numbers : ${reset}"
	printf "${Cyan}6 ${Purple}tests with all possibilities${reset}\n"
	printf "${Purple}Max : ${green}$max_ret_len${reset}\n"
	printf "${Purple}Number of errors : ${green}$nb_errors${reset}\n"
}

testing5() {
	max_ret_len=0
	nb_errors=0

	ret_len=`$push_swap_path 1 2 3 4 5 | wc -l`
	ret_checker=`$push_swap_path 1 2 3 4 5 | $checker_path 1 2 3 4 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 2 3 5 4 | wc -l`
	ret_checker=`$push_swap_path 1 2 3 5 4 | $checker_path 1 2 3 5 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 2 4 3 5 | wc -l`
	ret_checker=`$push_swap_path 1 2 4 3 5 | $checker_path 1 2 4 3 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 2 4 5 3 | wc -l`
	ret_checker=`$push_swap_path 1 2 4 5 3 | $checker_path 1 2 4 5 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 2 5 3 4 | wc -l`
	ret_checker=`$push_swap_path 1 2 5 3 4 | $checker_path 1 2 5 3 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 2 5 4 3 | wc -l`
	ret_checker=`$push_swap_path 1 2 5 4 3 | $checker_path 1 2 5 4 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 3 2 4 5 | wc -l`
	ret_checker=`$push_swap_path 1 3 2 4 5 | $checker_path 1 3 2 4 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 3 2 5 4 | wc -l`
	ret_checker=`$push_swap_path 1 3 2 5 4 | $checker_path 1 3 2 5 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 3 4 2 5 | wc -l`
	ret_checker=`$push_swap_path 1 3 4 2 5 | $checker_path 1 3 4 2 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 3 4 5 2 | wc -l`
	ret_checker=`$push_swap_path 1 3 4 5 2 | $checker_path 1 3 4 5 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 3 5 2 4 | wc -l`
	ret_checker=`$push_swap_path 1 3 5 2 4 | $checker_path 1 3 5 2 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 3 5 4 2 | wc -l`
	ret_checker=`$push_swap_path 1 3 5 4 2 | $checker_path 1 3 5 4 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 4 2 3 5 | wc -l`
	ret_checker=`$push_swap_path 1 4 2 3 5 | $checker_path 1 4 2 3 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 4 2 5 3 | wc -l`
	ret_checker=`$push_swap_path 1 4 2 5 3 | $checker_path 1 4 2 5 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 4 3 2 5 | wc -l`
	ret_checker=`$push_swap_path 1 4 3 2 5 | $checker_path 1 4 3 2 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 4 3 5 2 | wc -l`
	ret_checker=`$push_swap_path 1 4 3 5 2 | $checker_path 1 4 3 5 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 4 5 2 3 | wc -l`
	ret_checker=`$push_swap_path 1 4 5 2 3 | $checker_path 1 4 5 2 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 4 5 3 2 | wc -l`
	ret_checker=`$push_swap_path 1 4 5 3 2 | $checker_path 1 4 5 3 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 5 2 3 4 | wc -l`
	ret_checker=`$push_swap_path 1 5 2 3 4 | $checker_path 1 5 2 3 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 5 2 4 3 | wc -l`
	ret_checker=`$push_swap_path 1 5 2 4 3 | $checker_path 1 5 2 4 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 5 3 2 4 | wc -l`
	ret_checker=`$push_swap_path 1 5 3 2 4 | $checker_path 1 5 3 2 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 5 3 4 2 | wc -l`
	ret_checker=`$push_swap_path 1 5 3 4 2 | $checker_path 1 5 3 4 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 5 4 2 3 | wc -l`
	ret_checker=`$push_swap_path 1 5 4 2 3 | $checker_path 1 5 4 2 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 1 5 4 3 2 | wc -l`
	ret_checker=`$push_swap_path 1 5 4 3 2 | $checker_path 1 5 4 3 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 1 3 4 5 | wc -l`
	ret_checker=`$push_swap_path 2 1 3 4 5 | $checker_path 2 1 3 4 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 1 3 5 4 | wc -l`
	ret_checker=`$push_swap_path 2 1 3 5 4 | $checker_path 2 1 3 5 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 1 4 3 5 | wc -l`
	ret_checker=`$push_swap_path 2 1 4 3 5 | $checker_path 2 1 4 3 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 1 4 5 3 | wc -l`
	ret_checker=`$push_swap_path 2 1 4 5 3 | $checker_path 2 1 4 5 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 1 5 3 4 | wc -l`
	ret_checker=`$push_swap_path 2 1 5 3 4 | $checker_path 2 1 5 3 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 1 5 4 3 | wc -l`
	ret_checker=`$push_swap_path 2 1 5 4 3 | $checker_path 2 1 5 4 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 3 1 4 5 | wc -l`
	ret_checker=`$push_swap_path 2 3 1 4 5 | $checker_path 2 3 1 4 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 3 1 5 4 | wc -l`
	ret_checker=`$push_swap_path 2 3 1 5 4 | $checker_path 2 3 1 5 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 3 4 1 5 | wc -l`
	ret_checker=`$push_swap_path 2 3 4 1 5 | $checker_path 2 3 4 1 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 3 4 5 1 | wc -l`
	ret_checker=`$push_swap_path 2 3 4 5 1 | $checker_path 2 3 4 5 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 3 5 1 4 | wc -l`
	ret_checker=`$push_swap_path 2 3 5 1 4 | $checker_path 2 3 5 1 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 3 5 4 1 | wc -l`
	ret_checker=`$push_swap_path 2 3 5 4 1 | $checker_path 2 3 5 4 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 4 1 3 5 | wc -l`
	ret_checker=`$push_swap_path 2 4 1 3 5 | $checker_path 2 4 1 3 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 4 1 5 3 | wc -l`
	ret_checker=`$push_swap_path 2 4 1 5 3 | $checker_path 2 4 1 5 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 4 3 1 5 | wc -l`
	ret_checker=`$push_swap_path 2 4 3 1 5 | $checker_path 2 4 3 1 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 4 3 5 1 | wc -l`
	ret_checker=`$push_swap_path 2 4 3 5 1 | $checker_path 2 4 3 5 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 4 5 1 3 | wc -l`
	ret_checker=`$push_swap_path 2 4 5 1 3 | $checker_path 2 4 5 1 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 4 5 3 1 | wc -l`
	ret_checker=`$push_swap_path 2 4 5 3 1 | $checker_path 2 4 5 3 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 5 1 3 4 | wc -l`
	ret_checker=`$push_swap_path 2 5 1 3 4 | $checker_path 2 5 1 3 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 5 1 4 3 | wc -l`
	ret_checker=`$push_swap_path 2 5 1 4 3 | $checker_path 2 5 1 4 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 5 3 1 4 | wc -l`
	ret_checker=`$push_swap_path 2 5 3 1 4 | $checker_path 2 5 3 1 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 5 3 4 1 | wc -l`
	ret_checker=`$push_swap_path 2 5 3 4 1 | $checker_path 2 5 3 4 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 5 4 1 3 | wc -l`
	ret_checker=`$push_swap_path 2 5 4 1 3 | $checker_path 2 5 4 1 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 2 5 4 3 1 | wc -l`
	ret_checker=`$push_swap_path 2 5 4 3 1 | $checker_path 2 5 4 3 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 1 2 4 5 | wc -l`
	ret_checker=`$push_swap_path 3 1 2 4 5 | $checker_path 3 1 2 4 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 1 2 5 4 | wc -l`
	ret_checker=`$push_swap_path 3 1 2 5 4 | $checker_path 3 1 2 5 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 1 4 2 5 | wc -l`
	ret_checker=`$push_swap_path 3 1 4 2 5 | $checker_path 3 1 4 2 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 1 4 5 2 | wc -l`
	ret_checker=`$push_swap_path 3 1 4 5 2 | $checker_path 3 1 4 5 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 1 5 2 4 | wc -l`
	ret_checker=`$push_swap_path 3 1 5 2 4 | $checker_path 3 1 5 2 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 1 5 4 2 | wc -l`
	ret_checker=`$push_swap_path 3 1 5 4 2 | $checker_path 3 1 5 4 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 2 1 4 5 | wc -l`
	ret_checker=`$push_swap_path 3 2 1 4 5 | $checker_path 3 2 1 4 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 2 1 5 4 | wc -l`
	ret_checker=`$push_swap_path 3 2 1 5 4 | $checker_path 3 2 1 5 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 2 4 1 5 | wc -l`
	ret_checker=`$push_swap_path 3 2 4 1 5 | $checker_path 3 2 4 1 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 2 4 5 1 | wc -l`
	ret_checker=`$push_swap_path 3 2 4 5 1 | $checker_path 3 2 4 5 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 2 5 1 4 | wc -l`
	ret_checker=`$push_swap_path 3 2 5 1 4 | $checker_path 3 2 5 1 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 2 5 4 1 | wc -l`
	ret_checker=`$push_swap_path 3 2 5 4 1 | $checker_path 3 2 5 4 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 4 1 2 5 | wc -l`
	ret_checker=`$push_swap_path 3 4 1 2 5 | $checker_path 3 4 1 2 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 4 1 5 2 | wc -l`
	ret_checker=`$push_swap_path 3 4 1 5 2 | $checker_path 3 4 1 5 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 4 2 1 5 | wc -l`
	ret_checker=`$push_swap_path 3 4 2 1 5 | $checker_path 3 4 2 1 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 4 2 5 1 | wc -l`
	ret_checker=`$push_swap_path 3 4 2 5 1 | $checker_path 3 4 2 5 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 4 5 1 2 | wc -l`
	ret_checker=`$push_swap_path 3 4 5 1 2 | $checker_path 3 4 5 1 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 4 5 2 1 | wc -l`
	ret_checker=`$push_swap_path 3 4 5 2 1 | $checker_path 3 4 5 2 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 5 1 2 4 | wc -l`
	ret_checker=`$push_swap_path 3 5 1 2 4 | $checker_path 3 5 1 2 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 5 1 4 2 | wc -l`
	ret_checker=`$push_swap_path 3 5 1 4 2 | $checker_path 3 5 1 4 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 5 2 1 4 | wc -l`
	ret_checker=`$push_swap_path 3 5 2 1 4 | $checker_path 3 5 2 1 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 5 2 4 1 | wc -l`
	ret_checker=`$push_swap_path 3 5 2 4 1 | $checker_path 3 5 2 4 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 5 4 1 2 | wc -l`
	ret_checker=`$push_swap_path 3 5 4 1 2 | $checker_path 3 5 4 1 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 3 5 4 2 1 | wc -l`
	ret_checker=`$push_swap_path 3 5 4 2 1 | $checker_path 3 5 4 2 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 1 2 3 5 | wc -l`
	ret_checker=`$push_swap_path 4 1 2 3 5 | $checker_path 4 1 2 3 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 1 2 5 3 | wc -l`
	ret_checker=`$push_swap_path 4 1 2 5 3 | $checker_path 4 1 2 5 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 1 3 2 5 | wc -l`
	ret_checker=`$push_swap_path 4 1 3 2 5 | $checker_path 4 1 3 2 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 1 3 5 2 | wc -l`
	ret_checker=`$push_swap_path 4 1 3 5 2 | $checker_path 4 1 3 5 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 1 5 2 3 | wc -l`
	ret_checker=`$push_swap_path 4 1 5 2 3 | $checker_path 4 1 5 2 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 1 5 3 2 | wc -l`
	ret_checker=`$push_swap_path 4 1 5 3 2 | $checker_path 4 1 5 3 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 2 1 3 5 | wc -l`
	ret_checker=`$push_swap_path 4 2 1 3 5 | $checker_path 4 2 1 3 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 2 1 5 3 | wc -l`
	ret_checker=`$push_swap_path 4 2 1 5 3 | $checker_path 4 2 1 5 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 2 3 1 5 | wc -l`
	ret_checker=`$push_swap_path 4 2 3 1 5 | $checker_path 4 2 3 1 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 2 3 5 1 | wc -l`
	ret_checker=`$push_swap_path 4 2 3 5 1 | $checker_path 4 2 3 5 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 2 5 1 3 | wc -l`
	ret_checker=`$push_swap_path 4 2 5 1 3 | $checker_path 4 2 5 1 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 2 5 3 1 | wc -l`
	ret_checker=`$push_swap_path 4 2 5 3 1 | $checker_path 4 2 5 3 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 3 1 2 5 | wc -l`
	ret_checker=`$push_swap_path 4 3 1 2 5 | $checker_path 4 3 1 2 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 3 1 5 2 | wc -l`
	ret_checker=`$push_swap_path 4 3 1 5 2 | $checker_path 4 3 1 5 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 3 2 1 5 | wc -l`
	ret_checker=`$push_swap_path 4 3 2 1 5 | $checker_path 4 3 2 1 5`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 3 2 5 1 | wc -l`
	ret_checker=`$push_swap_path 4 3 2 5 1 | $checker_path 4 3 2 5 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 3 5 1 2 | wc -l`
	ret_checker=`$push_swap_path 4 3 5 1 2 | $checker_path 4 3 5 1 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 3 5 2 1 | wc -l`
	ret_checker=`$push_swap_path 4 3 5 2 1 | $checker_path 4 3 5 2 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 5 1 2 3 | wc -l`
	ret_checker=`$push_swap_path 4 5 1 2 3 | $checker_path 4 5 1 2 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 5 1 3 2 | wc -l`
	ret_checker=`$push_swap_path 4 5 1 3 2 | $checker_path 4 5 1 3 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 5 2 1 3 | wc -l`
	ret_checker=`$push_swap_path 4 5 2 1 3 | $checker_path 4 5 2 1 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 5 2 3 1 | wc -l`
	ret_checker=`$push_swap_path 4 5 2 3 1 | $checker_path 4 5 2 3 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 5 3 1 2 | wc -l`
	ret_checker=`$push_swap_path 4 5 3 1 2 | $checker_path 4 5 3 1 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 4 5 3 2 1 | wc -l`
	ret_checker=`$push_swap_path 4 5 3 2 1 | $checker_path 4 5 3 2 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 1 2 3 4 | wc -l`
	ret_checker=`$push_swap_path 5 1 2 3 4 | $checker_path 5 1 2 3 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 1 2 4 3 | wc -l`
	ret_checker=`$push_swap_path 5 1 2 4 3 | $checker_path 5 1 2 4 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 1 3 2 4 | wc -l`
	ret_checker=`$push_swap_path 5 1 3 2 4 | $checker_path 5 1 3 2 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 1 3 4 2 | wc -l`
	ret_checker=`$push_swap_path 5 1 3 4 2 | $checker_path 5 1 3 4 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 1 4 2 3 | wc -l`
	ret_checker=`$push_swap_path 5 1 4 2 3 | $checker_path 5 1 4 2 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 1 4 3 2 | wc -l`
	ret_checker=`$push_swap_path 5 1 4 3 2 | $checker_path 5 1 4 3 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 2 1 3 4 | wc -l`
	ret_checker=`$push_swap_path 5 2 1 3 4 | $checker_path 5 2 1 3 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 2 1 4 3 | wc -l`
	ret_checker=`$push_swap_path 5 2 1 4 3 | $checker_path 5 2 1 4 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 2 3 1 4 | wc -l`
	ret_checker=`$push_swap_path 5 2 3 1 4 | $checker_path 5 2 3 1 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 2 3 4 1 | wc -l`
	ret_checker=`$push_swap_path 5 2 3 4 1 | $checker_path 5 2 3 4 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 2 4 1 3 | wc -l`
	ret_checker=`$push_swap_path 5 2 4 1 3 | $checker_path 5 2 4 1 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 2 4 3 1 | wc -l`
	ret_checker=`$push_swap_path 5 2 4 3 1 | $checker_path 5 2 4 3 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 3 1 2 4 | wc -l`
	ret_checker=`$push_swap_path 5 3 1 2 4 | $checker_path 5 3 1 2 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 3 1 4 2 | wc -l`
	ret_checker=`$push_swap_path 5 3 1 4 2 | $checker_path 5 3 1 4 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 3 2 1 4 | wc -l`
	ret_checker=`$push_swap_path 5 3 2 1 4 | $checker_path 5 3 2 1 4`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 3 2 4 1 | wc -l`
	ret_checker=`$push_swap_path 5 3 2 4 1 | $checker_path 5 3 2 4 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 3 4 1 2 | wc -l`
	ret_checker=`$push_swap_path 5 3 4 1 2 | $checker_path 5 3 4 1 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 3 4 2 1 | wc -l`
	ret_checker=`$push_swap_path 5 3 4 2 1 | $checker_path 5 3 4 2 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 4 1 2 3 | wc -l`
	ret_checker=`$push_swap_path 5 4 1 2 3 | $checker_path 5 4 1 2 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 4 1 3 2 | wc -l`
	ret_checker=`$push_swap_path 5 4 1 3 2 | $checker_path 5 4 1 3 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 4 2 1 3 | wc -l`
	ret_checker=`$push_swap_path 5 4 2 1 3 | $checker_path 5 4 2 1 3`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 4 2 3 1 | wc -l`
	ret_checker=`$push_swap_path 5 4 2 3 1 | $checker_path 5 4 2 3 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 4 3 1 2 | wc -l`
	ret_checker=`$push_swap_path 5 4 3 1 2 | $checker_path 5 4 3 1 2`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	ret_len=`$push_swap_path 5 4 3 2 1 | wc -l`
	ret_checker=`$push_swap_path 5 4 3 2 1 | $checker_path 5 4 3 2 1`
	if [ $ret_len -gt $max_ret_len ]
	then
		max_ret_len="$ret_len"
	fi
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	printf "\n${Purple}Test ${Cyan}5 ${Purple}numbers : ${reset}"
	printf "${Cyan}120 ${Purple}tests with all permutations.${reset}\n"
	printf "${Purple}Max : ${green}$max_ret_len${reset}\n"
	printf "${Purple}Number of errors : ${green}$nb_errors${reset}\n"
}

tester() {
	max=0
	min=100000
	min_val=1
	max_val=50000
	moyenne=0
	nb_errors=0
	for i in `seq 1 $nb_tests_to_run`
	do
		arg=`shuf -i $min_val-$max_val -n $nb_of_values`
		arg=`echo $arg | sed 's/\n/ /g'`
		current=`$push_swap_path $arg | wc -l`
		ret_checker=`$push_swap_path $arg | $checker_path $arg`
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
	printf "\n${Purple}Testing ${Cyan}$nb_of_values ${Purple}numbers : ${reset}"
	printf "${Cyan}$nb_tests_to_run ${Purple}tests.${reset}\n"
	printf "${Purple}Max : ${green}$max${reset}\n"
	printf "${Purple}Min : ${green}$min${reset}\n"
	printf "${Purple}Moyenne : ${green}$moyenne${reset}\n"
	printf "${Purple}Number of errors : ${green}$nb_errors${reset}\n"
}

tester_range() {
	max=0
	min=100000
	min_val=1
	max_val=50000
	nb_errors=0
	printf "\n${Purple}Testing all numbers between ${Cyan}$seq_begin${Purple} and ${Cyan}$seq_end${Purple} : ${reset}\n"
	printf "${Purple}Tests : ${reset}"
	for i in `seq $seq_begin $seq_end`
	do
		arg=`shuf -i $min_val-$max_val -n $i`
		arg=`echo $arg | sed 's/\n/ /g'`
		current=`$push_swap_path $arg | wc -l`
		ret_checker=`$push_swap_path $arg | $checker_path $arg`
		if [ "$ret_checker" != "OK" ]
		then
			nb_errors=$(($nb_errors+1))
			printf "❌"
		else
			printf "✅"
		fi
	done
	printf "\n${Purple}Number of errors : ${green}$nb_errors${reset}\n"
}

launch_all() {
	testingerrors
	testing3
	testing5
	nb_of_values=100
	nb_tests_to_run=1000
	#	tester
	nb_of_values=500
	nb_tests_to_run=100
	#	tester
	tester_range
	echo
}

if [ $# -gt 4 ]; then
	printf "${red}\nToo many args ! Help menu below : ${reset}\n" >&2
	printf "\n${Blue}>>> Help menu <<<${reset}\n"
	printf "${white}run $>bash push_swap_tester.sh [optional arg 1] [optional arg 2] :${reset}\n"
	printf "${white}[optional arg 1]${reset} The number of values in stacks (-1 for Error checker).\n"
	printf "${white}[optional arg 2]${reset} The number of tests to run.\n"
	printf "${white}[No args]${reset} Every basical test is launched\n"
	printf "${white}[Checker path]${reset} The default checker path is ./checker_linux. You can change the checker path by running :\n$>bash push_swap_tester [optional checker path] [optional arg 1] [optional arg 2]\n"
	printf "${white}[Sequence mode]${reset} You run a sequence of numbers of args of your choice by running :\n$>bash push_swap_tester -seq [optional checker path] [mandatory sequence begin] [mandatory sequence end]\n\n"
	exit
fi
if [[ $1 = "--help" ]]; then
	printf "\n${Blue}>>> Help menu <<<${reset}\n"
	printf "${white}run $>bash push_swap_tester.sh [optional arg 1] [optional arg 2] :${reset}\n"
	printf "${white}[optional arg 1]${reset} The number of values in stacks (-1 for Error checker).\n"
	printf "${white}[optional arg 2]${reset} The number of tests to run.\n"
	printf "${white}[No args]${reset} Every basical test is launched\n"
	printf "${white}[Checker path]${reset} The default checker path is ./checker_linux. You can change the checker path by running :\n$>bash push_swap_tester [optional checker path] [optional arg 1] [optional arg 2]\n"
	printf "${white}[Sequence mode]${reset} You run a sequence of numbers of args of your choice by running :\n$>bash push_swap_tester -seq [optional checker path] [mandatory sequence begin] [mandatory sequence end]\n\n"
	exit
fi
if ! [[ $2 =~ $re ]]; then
	printf "${red}Error: ${white} arg 2 is not a number. Run --help for help menu.${reset}" >&2; exit
fi
if ! [ -f "$push_swap_path" ]; then
	printf "${red}Error : ${white}push_swap program not found. Run --help for help menu.${reset}" >&2; exit
fi
if ! [ -f $checker_path ]; then
	printf "${red}Error : ${white}checker program not found, or your first arg might not be a number. Run --help for help menu.${reset}" >&2 ; exit
fi
if [ -z "$1" ] && [[ $1 != "-seq" ]]; then
	launch_all
	exit
fi
if [ -z "$2" ] && [[ $1 != "-seq" ]]; then
	re='^[0-9]+$'
	if ! [[ $1 =~ $re ]]; then
		checker_path=$1
		if ! [ -f $checker_path ]; then
			printf "${red}Error : ${white}checker program not found, or your first arg might not be a number. Run --help for help menu.${reset}" >&2; exit
		fi
		launch_all
		exit
	fi
	if [[ $1 =~ $re ]]; then
		nb_of_values=$1
		tester
		echo
		exit
	fi
fi
if [ -z "$3" ] && [[ $1 != "-seq" ]]; then
	re='^[0-9]+$'
	if ! [[ $1 =~ $re ]]; then
		checker_path=$1
		if ! [ -f $checker_path ]; then
			printf "${red}Error : ${white}checker program not found, or your first arg might not be a number. Run --help for help menu.${reset}" >&2; exit
		fi
		nb_of_values=$2
		tester
		echo
		exit
	fi
	if [[ $1 =~ $re ]]; then
		nb_of_values=$1
		nb_tests_to_run=$2
		tester
		echo
		exit
	fi
fi
re='^[0-9]+$'
if ! [[ $1 =~ $re ]]; then
	if [[ $1 = "-seq" ]]; then
		if [[ $2 =~ $re ]] && [[ $3 =~ $re ]]; then
				seq_begin=$2
				seq_end=$3
				tester_range
				echo
				exit
		fi
		if ! [ -z "$3" ] && ! [ -z "$4" ]; then
			checker_path=$2
			if ! [ -f $checker_path ] || ! [[ $3 =~ $re ]] || ! [[ $4 =~ $re ]]; then
				printf "${red}Error : ${white}checker program not found, or there is a problem with your numerical args. Run --help for help menu.${reset}" >&2; exit
			fi
			seq_start=$3
			seq_end=$4
			tester_range
			echo
			exit
		else
			printf "${red}Error : ${white}No sequence begin and/or end found. Run --help for help menu.${reset}" >&2; exit
		fi
	else
		if [[ $2 =~ $re ]]; then
			checker_path=$1
			if ! [ -f $checker_path ]; then
				printf "${red}Error : ${white}checker program not found, or your first arg might not be a number. Run --help for help menu.${reset}" >&2; exit
			fi
			nb_of_values=$2
			if [[ $3 =~ $re ]]; then
				nb_tests_to_run=$3
			fi
			tester
			echo
			exit
		fi
	fi
	if [[ $1 =~ $re ]]; then
		printf "${red}\nToo many args ! You can use : ${reset}\n" >&2
		printf "\n${Blue}>>> Help menu <<<${reset}\n"
		printf "${white}run $>bash push_swap_tester.sh [optional arg 1] [optional arg 2] :${reset}\n"
		printf "${white}[optional arg 1]${reset} The number of values in stacks (-1 for Error checker).\n"
		printf "${white}[optional arg 2]${reset} The number of tests to run.\n"
		printf "${white}[No args]${reset} Every basical test is launched\n"
		printf "${white}[Checker path]${reset} The default checker path is ./checker_linux. You can change the checker path by running :\n$>bash push_swap_tester [optional checker path] [optional arg 1] [optional arg 2]\n"
		printf "${white}[Sequence mode]${reset} You run a sequence of numbers of args of your choice by running :\n$>bash push_swap_tester -seq [optional checker path] [mandatory sequence begin] [mandatory sequence end]\n\n"
		exit
	fi
fi
