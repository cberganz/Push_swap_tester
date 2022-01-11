# Push_swap_tester
A bash tester for the Push_swap project of 42 school

<img src="screenshot1.png" width="75%">

### Usage
Get inside your push_swap path and :
```bash
git clone https://github.com/cberganz/Push_swap_tester.git
cd push_swap_tester
bash push_swap_tester.sh
```

### Help menu
Display help menu :
```bash
bash push_swap_tester.sh --help
```



### Use another checker / change checker path
By default the script uses the linux checker with the path ../checker_linux. You can change the default checker path to the MacOS Checker or to your own checker with :
```bash
bash push_swap_tester.sh [optional - checker_path]
```

If you use the MacOS checker
```bash
bash push_swap_tester.sh ../checker_Mac
```

If you use your personal checker named "checker"
```bash
bash push_swap_tester.sh ../checker
```



### Specify your stack size and number of tests
You can run a test with the settings of your choice :
```bash
bash push_swap_tester.sh [optional - checker_path] [optional - stack_size] [optional - number_of_tests - default=1]
```
<img src="screenshot2.png" width="75%">



### Range mode
Your can run a range test with the range of your choice :
```bash
bash push_swap_tester.sh --range [optional - checker_path] [mandatory - range_begin] [mandatory - range_end]
```
<img src="screenshot3.png" width="75%">



### Memory check mode
Use valgrind to run a memory check with the stack size specified (works only on linux) :
```bash
bash push_swap_tester.sh --memory [mandatory - stack_size]
```
<img src="screenshot4.png" width="75%">
