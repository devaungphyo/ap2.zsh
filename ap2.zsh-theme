# Time display
function real_time() {
    local color="%{$fg_bold[magenta]%}";
    local time="[$(date +%I:%M:%S%p)]";
    local color_reset="%{$reset_color%}";
    echo "${color}${time}${color_reset}";
}


# Login info with custom styling
function login_info() {
    local color="%{$fg_bold[cyan]%}";
    local ip
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        ip="$(ifconfig | grep ^eth1 -A 1 | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | head -1)";
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        ip="$(ifconfig | grep ^en1 -A 4 | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | head -1)";
    fi
    local color_reset="%{$reset_color%}";
    echo "${color}[%n]${color_reset}";
}

# Directory display with distinct color
function directory() {
    local color="%{$fg_bold[blue]%}";
    local directory="${PWD/#$HOME}";  # Home path replaced with λ
    local color_reset="%{$reset_color%}";
    echo "${color}[${directory}]${color_reset}";
}

# Git prompt settings with modified colors
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}[";
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} ";
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}✖%{$fg_bold[green]%}]";
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}]";

function update_git_status() {
    GIT_STATUS=$(_omz_git_prompt_info);
}

function git_status() {
    echo "${GIT_STATUS}"
}

# Command status indicator with unique arrow style
function update_command_status() {
    local arrow;
    local color_reset="%{$reset_color%}";
    local reset_font="%{$fg_no_bold[white]%}";
    COMMAND_RESULT=$1;
    export COMMAND_RESULT=$COMMAND_RESULT
    if $COMMAND_RESULT; then
        arrow="%{$fg_bold[green]%}❯%{$fg_bold[yellow]%}❯%{$fg_bold[blue]%}❯";
    else
        arrow="%{$fg_bold[red]%}❯❯❯";
    fi
    COMMAND_STATUS="${arrow}${reset_font}${color_reset}";
}
update_command_status true;

function command_status() {
    echo "${COMMAND_STATUS}"
}

# timer
TMOUT=1;
TRAPALRM() {
    if [ "$WIDGET" = "" ] || [ "$WIDGET" = "accept-line" ]; then
        zle reset-prompt;
    fi
}

# prompt with elements on separate lines
PROMPT='$(real_time) $(login_info) $(directory) $(git_status)
$(command_status) '
