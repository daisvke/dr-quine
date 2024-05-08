NAME	= Colleen
SRC		= $(NAME).s
OBJ		= $(NAME).o
ASM		= nasm -f elf64
CC		= clang -Wall -Wextra -Werror
TMP		= tmp_$(NAME)
LOG		= diff.log

.PHONY: all test clean fclean re

all: $(NAME) test

$(NAME):
	$(ASM) $(SRC) -o $(OBJ)
	$(CC) $(OBJ) -o $@

test:
	./$(NAME) > $(TMP)
	diff $(TMP) $(SRC) > $(LOG) || true
	echo "\n\n\033[33mPrinting the diff...\033[0m\n"
	cat $(LOG)

clean:
	rm -f $(OBJ) $(TMP) $(LOG)

fclean: clean
	rm -f $(NAME)

re: fclean all
