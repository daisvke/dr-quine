NAME		= Sully
CC			= clang
CFLAGS		= -Wall -Wextra -Werror

SRC			= $(NAME).c
TMP_DIR		= tmp

.PHONY: all test clean fclean re

all: $(NAME)

$(NAME): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(NAME)

test: $(NAME)
	mkdir -p $(TMP_DIR)/
	cp $(NAME) $(TMP_DIR)/$(NAME)
	cd $(TMP_DIR) && ./$(NAME) \
	&& echo "\n\033[31m========== Runnning 1st test ==========\033[0m" \
	&& ls -al | grep $(NAME) | wc -l \
	&& echo "\n\033[31m========== Runnning 2nd test ==========\033[0m" \
	&& diff ../$(SRC) $(NAME)_5.c ; \
	diff ../$(SRC) $(NAME)_4.c ; \
	diff $(NAME)_5.c $(NAME)_0.c || true

clean:
	rm -f $(NAME)_*
	rm -rf $(TMP_DIR)/

fclean: clean
	rm -f $(NAME)

re: fclean all
