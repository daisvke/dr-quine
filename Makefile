QUINE1	= Colleen
QUINE2	= Grace

.PHONY: all clean fclean re

all: $(QUINE1) $(QUINE2)

$(QUINE1):
	$(MAKE) -C $(QUINE1)

$(QUINE2):
	$(MAKE) -C $(QUINE2)

clean:
	$(MAKE) -C $(QUINE1) clean
	$(MAKE) -C $(QUINE2) clean
	
fclean:
	$(MAKE) -C $(QUINE1) fclean
	$(MAKE) -C $(QUINE2) fclean

re:
	$(MAKE) -C $(QUINE1) re
	$(MAKE) -C $(QUINE2) re
