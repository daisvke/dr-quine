NAME		= Sully
CC			= clang
CFLAGS		= -Wall -Wextra

SRC			= $(NAME).c

PHONY: all clean fclean re

all: $(NAME)

$(NAME):
	$(CC) $(CFLAGs) $(SRC) -o $(NAME)

test: $(NAME)
	./$(NAME)
	diff $(SRC) $(NAME)_4.c || true # To avoid error 1

clean:
	rm -f $(NAME)_*.c

fclean: clean
	rm -f $(NAME)

re: fclean all
