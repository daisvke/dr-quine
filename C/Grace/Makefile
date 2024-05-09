NAME		= Grace
CC			= clang
CFLAGS		= -Wall -Wextra

TMP			= Grace_kid.c
LOG			= diff.log
SRC			= $(NAME).c

.PHONY: all clean fclean re

all: $(NAME)

$(NAME):
	$(CC) $(CFLAGS) $(SRC) -o $(NAME)

test:
	./$(NAME)
	(diff $(SRC) $(TMP) > $(LOG) || true)
	echo "\n\n\033[33mPrinting the diff...\033[0m\n"
	cat $(LOG)

clean:
	rm -f $(TMP) $(LOG)

fclean: clean
	rm -f $(NAME)

re: fclean all
