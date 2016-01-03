DOCS=index publications software photography teaching

HDOCS=$(addsuffix .html, $(DOCS))

.PHONY: default
default: docs

.PHONY : docs 

docs : $(HDOCS)
%.html : %.jemdoc MENU
	@printf 'Running jemdoc\n'
	./jemdoc -c bodonoghue.conf -o $@ $< 

.PHONY : clean
clean :
	-rm -f *.html

