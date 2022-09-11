NAME =  lisp.exe
CC = g++
RM = rm -rf
SRCS = ${shell find "." -name "*.cpp" ! -name "test.cpp"}
TEST = "./testing/test.cpp"
OBJS = ${SRCS:.cpp=.o}
RES = "./testing/result.txt"
OUT = "./testing/output.txt"


all:  ${NAME}

test_display: remove run_display display_test

run_display:
	${CC} ${SRCS} -o main && ./main ./testing/test_display.scm > ${OUT}

display_test:
	${CC} ${TEST} -o test && ./test ${OUT} ./testing/display_golden.txt ${RES}

test_define: remove run_define define_test

run_define:
	${CC} ${SRCS} -o main && ./main ./testing/test_define.scm > ${OUT}

define_test:
	${CC} ${TEST} -o test && ./test ${OUT} ./testing/define_golden.txt ${RES}

test_set: remove run_set set_test

run_set:
	${CC} ${SRCS} -o main && ./main ./testing/test_set.scm > ${OUT}

set_test:
	${CC} ${TEST} -o test && ./test ${OUT} ./testing/set_golden.txt ${RES}

test_if: remove run_if if_test

run_if:
	${CC} ${SRCS} -o main && ./main ./testing/test_if.scm > ${OUT}

if_test:
	${CC} ${TEST} -o test && ./test ${OUT} ./testing/if_golden.txt ${RES}

${NAME}: ${OBJS}
	${CC}  *.cpp -o ${NAME}

clean: 
	${RM} test main *.o ${OUT} ${RES}

remove:
	${RM} ${OUT} ${RES}


fclean: clean
	${RM} *.exe 

re : fclean all

.PHONY: all clean fclean re test_display run_display display_test test_define run_define define_test test_set run_set set_test test_if run_if if_test remove
