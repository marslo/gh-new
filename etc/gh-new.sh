#!/usr/bin/env bash
# shellcheck disable=SC2207
#=============================================================================
#     FileName : gh-new.sh
#       Author : marslo
#      Created : 2026-02-27 23:04:41
#   LastChange : 2026-03-20 21:39:17
#=============================================================================

#=============================================================================#
# shared completion logic                                                     #
#=============================================================================#
function __gh_new_completion() {
  local cur prev
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  local opts="-o --open
              -l --label
              -v --verbose
              -a --auto
              -d --draft
              -D --dryrun
              -h --help"

  case "${prev}" in
    -l|--label ) COMPREPLY=(); return ;;   # free input
  esac

  for (( i=1; i < COMP_CWORD; i++ )); do
    [[ "${COMP_WORDS[i]}" == "--" ]] && return
  done

  if [[ ${cur} == -* ]] || [[ ${COMP_CWORD} -ge 1 ]]; then
    COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
  fi
}

#=============================================================================#
# for $ gh-new <tab>                                                          #
#=============================================================================#
function _gh_new() { __gh_new_completion; }
complete -F _gh_new gh-new

#=============================================================================#
# for $ gh new <tab>                                                          #
#=============================================================================#
function __gh_new_complete() { __gh_new_completion; }

# wrap the original __start_gh function
__orig_start_gh=$(declare -f __start_gh)
eval "${__orig_start_gh//__start_gh/__start_gh_orig}"

function __start_gh() {
  if [[ "${COMP_WORDS[1]}" == "new" && ${COMP_CWORD} -ge 2 ]]; then
    __gh_new_complete
    return
  fi
  __start_gh_orig "$@"
}

# vim:tabstop=2:softtabstop=2:shiftwidth=2:expandtab:filetype=sh:
