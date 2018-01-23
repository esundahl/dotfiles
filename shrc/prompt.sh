# COLOR_RED="\033[0;31m"
PROMPT_COLOR_YELLOW="\033[0;33m"
# PROMPT_COLOR_GREEN="\033[0;32m"
# COLOR_MAGENTA="\033[0;35m"
# COLOR_CYAN="\033[0;36m"
# COLOR_OCHRE="\033[38;5;95m"
# PROMPT_COLOR_BLUE="\033[0;34m"
# COLOR_WHITE="\033[0;37m"
PROMPT_COLOR_RESET="\033[0m"
PROMPT_COLOR_PRIMARY="\033[38;5;95m"
PROMPT_COLOR_SECONDARY="\033[0;36m"


# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "(${BRANCH})"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[$PROMPT_COLOR_PRIMARY\]\h\[$PROMPT_COLOR_SECONDARY\]:\W\[$PROMPT_COLOR_YELLOW\]\`parse_git_branch\` \[$PROMPT_COLOR_RESET\]→ "
