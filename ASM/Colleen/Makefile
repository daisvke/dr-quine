NAME	= Colleen
SRC		= $(NAME).s
OBJ		= $(NAME).o
ASM		= nasm -f elf64
CC		= ld --dynamic-linker /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 -lc -g -e main
TMP		= tmp_$(NAME)
LOG		= diff.log

.PHONY: all test clean fclean re

all: $(NAME)

$(NAME): $(SRC)
	$(ASM) $(SRC) -o $(OBJ)
	$(CC) $(OBJ) -o $@

test: $(NAME)
	valgrind --track-fds=yes ./$(NAME) > $(TMP)
	diff $(SRC) $(TMP) > $(LOG) || true
	@echo "\n\033[33mPrinting the diff...\033[0m\n"
	@cat $(LOG)

clean:
	rm -f $(OBJ) $(TMP) $(LOG)

fclean: clean
	rm -f $(NAME)

re: fclean all
