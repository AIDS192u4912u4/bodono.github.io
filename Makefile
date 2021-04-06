DOCS=index

HDOCS=$(addsuffix .html, $(DOCS))

.PHONY: default
default: docs

.PHONY : docs

docs : $(HDOCS)
%.html : %.jemdoc
	@printf 'Running jemdoc\n'
	./jemdoc -o $@ $<

.PHONY : clean
clean :
	-rm -f *.html

