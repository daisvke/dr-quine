NAME		= Colleen
CC			= clang
CFLAGS		= -Wall -Wextra -Werror

TMP			= tmp_$(NAME)
LOG			= diff.log
SRC			= $(NAME).c
OBJ			= $(NAME).o

.PHONY: all clean fclean re

all: $(NAME) test

$(NAME):
	$(CC) $(CFLAGS) $(SRC) -o $@

test:
	./$(NAME) > $(TMP)
	diff $(TMP) $(SRC) > $(LOG) || true
	echo "\n\n\033[33mPrinting the diff...\033[0m\n"
	cat $(LOG)

clean:
	rm -f $(TMP) $(LOG) $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all
