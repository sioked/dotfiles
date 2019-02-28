function __fish_complete_geeknote --description "Complete the commandline using geeknote's 'completion' tool"
  # npm completion is bash-centric, so we need to translate fish's "commandline" stuff to bash's $COMP_* stuff
  # COMP_LINE is an array with the words in the commandline
  set -lx COMP_WORDS (commandline -o)
  # COMP_CWORD is the index of the current word in COMP_LINE
  # bash starts arrays with 0, so subtract 1
  set -lx COMP_CWORD (math (count $COMP_WORDS) - 1)
  # COMP_POINT is the index of point/cursor when the commandline is viewed as a string
  set -lx COMP_POINT (commandline -C)
  # If the cursor is after the last word, the empty token will disappear in the expansion
  # Readd it
  if test (commandline -ct) = ""
    set COMP_CWORD (math $COMP_CWORD + 1)
    set COMP_WORDS $COMP_WORDS ""
  end
  geeknote autocomplete -- $COMP_WORDS ^/dev/null
end
complete -f -c geeknote --arguments '(__fish_complete_geeknote)'
