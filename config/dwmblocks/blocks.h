//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{" ", "~/.local/bin/statusbar.sh network",					1,		0},
	{" ", "~/.local/bin/statusbar.sh lang",					    1,		0},
	{" ", "~/.local/bin/statusbar.sh time",					    60,		0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = "  ";
static unsigned int delimLen = 5;
