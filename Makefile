# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: svalente <svalente@student.42lisboa.com >  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/11 12:11:55 by svalente          #+#    #+#              #
#    Updated: 2023/06/12 12:18:01 by svalente         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = pipex

SRC = 	main\
		utils\
		processes

CC = cc
CFLAGS = -Wall -Wextra -Werror -g #-fsanitize=address
RM = rm -f

$(VERBOSE).SILENT:

FT_LIBFT = ./Libft/libft.a
FT_LIBFT_PATH = ./Libft

all: $(NAME)

$(NAME): $(SRC:=.o)
		make -C $(FT_LIBFT_PATH)
		$(CC) $(CFLAGS) $(SRC:=.o) $(FT_LIBFT) -o $(NAME)
		echo "Compiled"

clean:
		make clean -C $(FT_LIBFT_PATH)
		$(RM) $(SRC:=.o)
		echo Removed $(NAME) objects files

fclean: clean
		make fclean -C $(FT_LIBFT_PATH)
		$(RM) $(NAME)
		echo Removed $(NAME)

re: fclean all
