speccy: speccy.l speccy.y
				bison -d speccy.y
				flex speccy.l
				cc -o $@ speccy.tab.c lex.yy.c -lfl
