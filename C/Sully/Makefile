NAME		= Sully
CC			= clang
CFLAGS		= -Wall -Wextra

SRC			= $(NAME).c

.PHONY: all test clean fclean re

all: $(NAME)

$(NAME): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(NAME)

test: $(NAME)
	./$(NAME)
	diff $(SRC) $(NAME)_4.c || true # To avoid error 1

clean:
	rm -f $(NAME)_*

fclean: clean
	rm -f $(NAME)

re: fclean all
