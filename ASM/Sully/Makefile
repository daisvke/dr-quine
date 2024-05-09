NAME	= Sully
SRC		= $(NAME).s
OBJ		= $(NAME).o
ASM		= nasm -f elf64
CC		= clang -Wall -Wextra -Werror
TMP		= $(NAME)_kid.s
LOG		= diff.log

.PHONY: all test clean fclean re

all: $(NAME)

$(NAME): $(SRC)
	$(ASM) $(SRC) -o $(OBJ)
	$(CC) $(OBJ) -o $@

test: $(NAME)
	valgrind --track-fds=yes ./$(NAME)
	diff $(SRC) $(TMP) > $(LOG) || true
	@echo "\n\033[33mPrinting the diff...\033[0m\n"
	@cat $(LOG)

clean:
	rm -f $(OBJ) $(TMP) $(LOG)

fclean: clean
	rm -f $(NAME)

re: fclean all
