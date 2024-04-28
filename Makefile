CC			= clang
CFLAGS		= -Wall -Wextra

colleen:
	cd Colleen \
	&& $(CC) $(CFLAGs) Colleen.c -o Colleen \
	&& ./Colleen > tmp_Colleen \
	&& (diff tmp_Colleen Colleen.c > diff.log || true) \
	&& echo "\n\n\033[33mPrinting the diff...\033[0m\n" \
	&& cat diff.log

clean:
	cd Colleen && rm -rf Colleen tmp_Colleen diff.log
