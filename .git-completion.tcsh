#   Source this script in tcsh to setup shell completions
#   for git.  Completions are activated by typing <tab> or Control-D
#   in the shell after entering a partial command.
#
# Usage:
#   source git-completion.tcsh     (e.g. in ~/.cshrc)
#
# Supported completions:
#   git <tab>            (lists git commands)
#   git help <tab>       (lists git commands)
#   git branch <tab>     (lists branch names)
#   git checkout <tab>   (lists branch names)
#   git log <tab>        (lists the most commonly used flags)
#   git remote <tab>     (lists git remote commands)
#   git remote add|prune|rm|show|update <tab>
#                        (lists git remote names)
# In addition to entering <tab> where shown, you can enter it after
# typing part of the word, e.g. git branch bug<tab> to auto-complete
# branches starting with "bug".
#
# Author: David Adler, David Aguilar

if ( `where git` != "" ) then
    # Git is installed so define tcsh completions for it.

    # List of known git subcommands
    # This is a hard-coded list to avoid calling 'git help' at startup.
    set __git_cmd_names = (add bisect blame branch checkout clone commit config \
                           diff difftool fetch grep gui init log merge mv pull push \
                           rebase reset rm show shortlog stash status tag)

    alias __git_aliases 'git config --get-regexp "alias.*" | sed -n "s,alias\.\([^ ]*\).*,\1,p"'
    alias __git_branches 'git for-each-ref --format="%(refname)" refs/heads refs/remotes | sed -e s,refs/remotes/,, | sed -e s,refs/heads/,,'
    alias __git_origin_branches 'git for-each-ref --format="%(refname)" refs/remotes/origin | grep -v HEAD | sed -e s,refs/remotes/origin/,,'

    # Define the completions (see the tcsh man page).
    complete git \
             'p/1/`__git_aliases | xargs echo $__git_cmd_names`/' \
             "n/help/($__git_cmd_names)/" \
             'n/branch/`__git_branches | xargs echo -m -d`/' \
             'n/config/(--global --get-regexp --list)/' \
             'n/diff/`__git_branches | xargs echo --check --staged --stat -- *`/' \
             'n/difftool/`__git_branches | xargs echo --no-prompt --staged -- *`/' \
             'n/fetch/`git remote`/' \
             'n/merge/`__git_branches`/' \
             'n/log/`__git_branches | xargs echo -- --name-only --name-status --reverse --committer= --no-color --relative --ignore-space-change --ignore-space-at-eol --format=medium --format=full --format=fuller --graph`/' \
             'n/stash/(apply list save pop clear)/' \
             'n/push/`git remote`/' \
             'N/push/`__git_origin_branches`/' \
             'n/pull/`git remote | xargs echo --rebase`/' \
             'n/--rebase/`git remote`/' \
             'N/--rebase/`__git_origin_branches`/' \
             'N/pull/`__git_origin_branches`/' \
             'n/rebase/`__git_branches | xargs echo --continue --abort --onto --skip --interactive`/' \
             'N/rebase/`__git_branches`/' \
             'n/remote/(show add rm prune update)/' \
             'N/remote/`git remote`/' \
             'n/checkout/`__git_branches | xargs echo -b --`/' \
             'N/-b/`__git_branches`/'

endif

