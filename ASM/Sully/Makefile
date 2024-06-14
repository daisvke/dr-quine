NAME	= Sully
SRC		= $(NAME).s
OBJ		= $(NAME).o
ASM		= nasm -f elf64 -g
# Specify the symbolic link to the actual dynamic linker file
LD		= ld --dynamic-linker=/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 -lc
TMP		= $(NAME)_kid.s
TMP_DIR	= tmp
LOG		= diff.log

.PHONY: all test clean fclean re

all: $(NAME)

$(NAME): $(SRC)
	$(ASM) $(SRC) -o $(OBJ)
	$(LD) $(OBJ) -o $@

test: $(NAME)
	mkdir -p $(TMP_DIR)/
	cp $(NAME) $(TMP_DIR)/$(NAME)
	cd $(TMP_DIR) && ./$(NAME) \
	&& echo "\n\033[31m========== Runnning 1st test ==========\033[0m" \
	&& ls -al | grep $(NAME) | wc -l \
	&& echo "\n\033[31m========== Runnning 2nd test ==========\033[0m" \
	&& diff ../$(SRC) $(NAME)_5.s ; \
	diff ../$(SRC) $(NAME)_4.s ; \
	diff $(NAME)_5.s $(NAME)_0.s || true

clean:
	rm -rf $(OBJ) $(TMP) $(TMP_DIR) $(LOG) $(NAME)_*

fclean: clean
	rm -f $(NAME)

re: fclean all
