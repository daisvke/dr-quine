NAME	= Grace
SRC		= $(NAME).s
OBJ		= $(NAME).o
ASM		= nasm -f elf64
# Specify the symbolic link to the actual dynamic linker file
LD		= ld --dynamic-linker=/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 -lc
TMP		= $(NAME)_kid.s
LOG		= diff.log

.PHONY: all test clean fclean re

all: $(NAME)

$(NAME): $(SRC)
	$(ASM) $(SRC) -o $(OBJ)
	$(LD) $(OBJ) -o $@

test: $(NAME)
	./$(NAME)
	diff $(SRC) $(TMP) > $(LOG) || true
	@echo "\n\033[33mPrinting the diff...\033[0m\n"
	@cat $(LOG)

clean:
	rm -f $(OBJ) $(TMP) $(LOG)

fclean: clean
	rm -f $(NAME)

re: fclean all
