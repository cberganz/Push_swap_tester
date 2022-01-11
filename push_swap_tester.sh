#!/bin/bash
date > /dev/null

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
seq_end=600

testingerrors() {
	error=0
	printf "\n${Purple}Test Error cases${reset}\n"
	ps_ret=`$push_swap_path 1 "" 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your push_swap does not return Error with arg : \"\" ${reset}\n"
		error=1
	else
		printf "${green}Your push_swap return Error with arg type : \"\". ${reset}\n"
	fi
	ps_ret=`$push_swap_path 2 1 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your push_swap does not return Error with duplicates. ${reset}\n"
		error=1
	else
		printf "${green}Your push_swap return Error with duplicates. ${reset}\n"
	fi
	ps_ret=`$push_swap_path 1 2147483648 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your push_swap does not return Error with arg over INT_MAX. ${reset}\n"
		error=1
	else
		printf "${green}Your push_swap return Error with arg over INT_MAX. ${reset}\n"
	fi
	ps_ret=`$push_swap_path 1 9999999999999999999999 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your push_swap does not return Error with arg over INT_MAX. ${reset}\n"
		error=1
	else
		printf "${green}Your push_swap return Error with arg over INT_MAX. ${reset}\n"
	fi
	ps_ret=`$push_swap_path 1 -2147483649 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your push_swap does not return Error with arg above INT_MIN. ${reset}\n"
		error=1
	else
		printf "${green}Your push_swap return Error with arg above INT_MIN. ${reset}\n"
	fi
	ps_ret=`$push_swap_path 1 "ab" 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your push_swap does not return Error with arg type \"ab\". ${reset}\n"
		error=1
	else
		printf "${green}Your push_swap return Error with arg type \"ab\". ${reset}\n"
	fi
	ps_ret=`$push_swap_path 1 " ab" 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your push_swap does not return Error with arg type \" ab\". ${reset}\n"
		error=1
	else
		printf "${green}Your push_swap return Error with arg type \" ab\". ${reset}\n"
	fi
	ps_ret=`$push_swap_path 1 "ab12" 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your push_swap does not return Error with arg type \"ab12\". ${reset}\n"
		error=1
	else
		printf "${green}Your push_swap return Error with arg type \"ab12\". ${reset}\n"
	fi
	ps_ret=`$push_swap_path 1 " 12" 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${yell}Your choosed to handle agr type \" 12\". It's up to you. ${reset}\n"
	else
		printf "${yell}Your choosed not to handle agr type \" 12\". It's up to you. ${reset}\n"
	fi
	ps_ret=`$push_swap_path 1 "12 " 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your choosed to handle arg type \"12 \". It's up to you. ${reset}\n"
	else
		printf "${yell}Your choosed not to handle agr type \"12 \". It's up to you. ${reset}\n"
	fi
	ps_ret=`$push_swap_path 1 "12ab" 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your choosed to handle arg type \"12ab\". It's up to you. ${reset}\n"
	else
		printf "${yell}Your choosed not to handle agr type \"12ab\". It's up to you. ${reset}\n"
	fi
	ps_ret=`$push_swap_path 1 " 12ab" 2 2>&1`
	if [ "$ps_ret" != "Error" ]
	then
		printf "${red}Your choosed to handle arg type \" 12ab\". It's up to you. ${reset}\n"
	else
		printf "${yell}Your choosed not to handle agr type \" 12ab\". It's up to you. ${reset}\n"
	fi
	if [ $error == 0 ]
	then
		printf "${Purple}Error cases result : ✅${reset}\n"
	else
		printf "${Purple}Error cases result : ❌${reset}\n"
	fi
}

testing3() {
	max_ret_len=0
	nb_errors=0

	ret_len=`$push_swap_path 1 2 3 | wc -l`
	ret_checker=`$push_swap_path 1 2 3 | $checker_path 1 2 3`
	printf "\n${Purple}Test ${Cyan}3 ${Purple}numbers : ${reset}"
	printf "${Cyan}6 ${Purple}tests with all permutations.${reset}\n"
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
	if [ $max_ret_len -gt 3 ]; then
		printf "${Purple}Max : ${red}$max_ret_len${reset}\n"
	else
		printf "${Purple}Max : ${green}$max_ret_len${reset}\n"
	fi
	if [ $nb_errors = 0 ]; then
		printf "${Purple}Number of errors : ${green}$nb_errors${reset}\n"
	else
		printf "${Purple}Number of errors : ${red}$nb_errors${reset}\n"
	fi
}

testing5() {
	max_ret_len=0
	nb_errors=0

	ret_len=`$push_swap_path 1 2 3 4 5 | wc -l`
	ret_checker=`$push_swap_path 1 2 3 4 5 | $checker_path 1 2 3 4 5`
	printf "\n${Purple}Test ${Cyan}5 ${Purple}numbers : ${reset}"
	printf "${Cyan}120 ${Purple}tests with all permutations.${reset}\n"
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
	if [ $max_ret_len -gt 12 ]; then
		printf "${Purple}Max : ${red}$max_ret_len${reset}\n"
	else
		printf "${Purple}Max : ${green}$max_ret_len${reset}\n"
	fi
	if [ $nb_errors = 0 ]; then
		printf "${Purple}Number of errors : ${green}$nb_errors${reset}\n"
	else
		printf "${Purple}Number of errors : ${red}$nb_errors${reset}\n"
	fi
}

tester() {
	max=0
	min=100000
	average=0
	nb_errors=0
	printf "\n${Purple}Testing ${Cyan}$nb_of_values ${Purple}numbers : ${reset}"
	printf "${Cyan}$nb_tests_to_run ${Purple}tests.${reset}\n"
	for i in `seq 1 $nb_tests_to_run`
	do
		arg=`shuf -i 1-100000 -n $nb_of_values`
		arg=`echo $arg | sed 's/\n/ /g'`
		current=`$push_swap_path $arg | wc -l`
		ret_checker=`$push_swap_path $arg | $checker_path $arg`
		if [ "$ret_checker" != "OK" ]
		then
			nb_errors=$(($nb_errors+1))
			echo "Failed on test $i with $nb_of_values inputs : $ret_checker" >> debug.txt
			echo $arg >> debug.txt
			echo >> debug.txt
		fi
		average=$(($average+$current))
		if [[ $current -gt $max ]]
		then
			max="$current"
		fi
		if [ $current -lt $min ]
		then
			min="$current"
		fi
	done
	average=$(($average/$i))
	printf "${Purple}Max : ${Cyan}$max${reset}\n"
	printf "${Purple}Min : ${Cyan}$min${reset}\n"
	printf "${Purple}average : ${Cyan}$average${reset}\n"
	if [ $nb_errors = 0 ]; then
		printf "${Purple}Number of errors : ${green}$nb_errors${reset}\n"
	else
		printf "${Purple}Number of errors : ${red}$nb_errors (see debug.txt file for details)${reset}\n"
	fi
}

tester_range() {
	max=0
	min=100000
	nb_errors=0
	printf "\n${Purple}Testing all sizes of stack between ${Cyan}$seq_begin${Purple} and ${Cyan}$seq_end${Purple} : ${reset}\n"
	printf "${Purple}Tests : ${reset}"
	for i in `seq $seq_begin $seq_end`
	do
		arg=`shuf -i 1-100000 -n $i`
		arg=`echo $arg | sed 's/\n/ /g'`
		current=`$push_swap_path $arg | wc -l`
		ret_checker=`$push_swap_path $arg | $checker_path $arg`
		if [ "$ret_checker" != "OK" ]
		then
			nb_errors=$(($nb_errors+1))
			echo "Failed on a sequencial test with list of $i inputs : $ret_checker" >> debug.txt
			echo $arg >> debug.txt
			echo >> debug.txt
			printf "❌"
		else
			printf "✅"
		fi
	done
	if [ $nb_errors = 0 ]; then
		printf "\n${Purple}Number of errors : ${green}$nb_errors${reset}\n"
	else
		printf "\n${Purple}Number of errors : ${red}$nb_errors (open debug.txt file for details)${reset}\n"
	fi
}

launch_all() {
	testingerrors
	testing3
	testing5
	nb_of_values=100
	nb_tests_to_run=1000
	tester
	nb_of_values=500
	nb_tests_to_run=100
	tester
	tester_range
	echo
}

mem_checker() {
	max=0
	min=100000
	average=0
	nb_errors=0
	printf "\n${Purple}Checking memory with ${Cyan}$nb_of_values ${Purple}numbers : ${reset}\n"
	arg=`shuf -i 1-100000 -n $nb_of_values`
	arg=`echo $arg | sed 's/\n/ /g'`
	valgrind $push_swap_path $arg | wc -l
	current=`$push_swap_path $arg | wc -l`
	ret_checker=`$push_swap_path $arg | $checker_path $arg`
	if [ "$ret_checker" != "OK" ]
	then
		nb_errors=$(($nb_errors+1))
	fi
	printf "${Purple}Number of operations : ${Cyan}$current${reset}\n"
	if [ $nb_errors = 0 ]; then
		printf "${Purple}Checker return : ✅\n\n"
	else
		printf "${Purple}Checker return : ❌\n\n"
	fi
}

print_help() {
	printf "\n${Blue}>>> Help menu <<<${reset}\n"
	printf "${white}run $>bash push_swap_tester.sh [optional - stack_size] [optional - number_of_tests] :${reset}\n"
	printf "${white}[optional - stack_size]${reset} The number of values in stacks\n"
	printf "${white}[optional - number_of_tests]${reset} The number of tests to run.\n"
	printf "${white}[No args]${reset} Every basical test is launched.\n"
	printf "${white}[Checker path]${reset} The default checker path is ./checker_linux. You can change the checker path by running :\n$>bash push_swap_tester [optional - checker_path] [optional - stack_size] [optional - number_of_tests]\n"
	printf "${white}[range mode]${reset} You can run a range of tests of your choice by running :\n$>bash push_swap_tester --range [optional - checker_path] [mandatory - range_begin] [mandatory - range_end]\n"
	printf "${white}[Memcheck mode]${reset} You can check for memory leaks and errors by running (does only work on linux with valgrind) :\n$>bash push_swap_tester --memory [optional - Checker_path] [mandatory - Size_of_stack]\n\n"
}

if [ -f "debug.txt" ]; then
	rm debug.txt
fi
if [ $# -gt 4 ]; then
	printf "${red}\nToo many args ! Help menu below : ${reset}\n" >&2
	print_help
	exit
fi
if [[ $1 = "--help" ]]; then
	print_help
	exit
fi
if [[ $1 = "--memory" ]]; then
	nb_of_values=$2
	mem_checker
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
	if [[ $1 = "--range" ]]; then
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
		print_help
		exit
	fi
fi
printf "${red}Error : ${white}Something went wrong with your arguments. Run --help for help menu.${reset}" >&2; exit
