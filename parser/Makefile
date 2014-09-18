TEST = test/test1.2.out \
       test/test2.2.out \
       test/test3.2.out \
       test/test4.2.out \
       test/test5.2.out \
       test/test6.2.out \
       test/test7.2.out \
       parser.2.out

all: $(TEST)
	echo ALL TESTS PASSED

%.2.out: %.scm
	sh parser.sh $<

clean:
	rm -f test/*.out
	rm -f parser.scm.1.out
	rm -f parser.scm.2.out
