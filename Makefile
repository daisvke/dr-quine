QUINE1	= Colleen
QUINE2	= Grace

.PHONY: all clean fclean re

all: $(QUINE1)

$(QUINE1):
	$(MAKE) -C $(QUINE1)

clean:
	$(MAKE) -C $(QUINE1) clean
	
fclean:
	$(MAKE) -C $(QUINE1) fclean

re:
	$(MAKE) -C $(QUINE1) re
