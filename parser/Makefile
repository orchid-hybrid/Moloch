TEST = test/test1.2.out \
       test/test2.2.out \
       test/test3.2.out \
       test/test4.2.out \
       test/test5.2.out \
       test/test6.2.out \
       test/test7.2.out \
       parser-sane.2.out \
       prelude-macros.2.out

all: $(TEST)
	echo ALL TESTS PASSED

%.2.out: %.scm
	sh parser.sh $<

parser-sane.scm: parser.rkt
	sh sanitize_file.sh

prelude-macros.scm: ../prelude/macros.rkt
	cp ../prelude/macros.rkt prelude-macros.scm

clean:
	rm -f test/*.out
	rm -f parser-sane.rkt.1.out
	rm -f parser-sane.rkt.2.out
