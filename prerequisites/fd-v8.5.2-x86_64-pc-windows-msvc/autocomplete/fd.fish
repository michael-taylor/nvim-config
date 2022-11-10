complete -c D:\a\fd\fd\target\release\fd.exe -s d -l max-depth -d 'Set maximum search depth (default: none)' -r
complete -c D:\a\fd\fd\target\release\fd.exe -l min-depth -d 'Only show search results starting at the given depth' -r
complete -c D:\a\fd\fd\target\release\fd.exe -l exact-depth -d 'Only show search results at the exact given depth' -r
complete -c D:\a\fd\fd\target\release\fd.exe -s E -l exclude -d 'Exclude entries that match the given glob pattern' -r
complete -c D:\a\fd\fd\target\release\fd.exe -s t -l type -d 'Filter by type: file (f), directory (d), symlink (l), executable (x), empty (e), socket (s), pipe (p)' -r -f -a "{file	,directory	,symlink	,executable	,empty	,socket	,pipe	}"
complete -c D:\a\fd\fd\target\release\fd.exe -s e -l extension -d 'Filter by file extension' -r
complete -c D:\a\fd\fd\target\release\fd.exe -s S -l size -d 'Limit results based on the size of files' -r
complete -c D:\a\fd\fd\target\release\fd.exe -l changed-within -d 'Filter by file modification time (newer than)' -r
complete -c D:\a\fd\fd\target\release\fd.exe -l changed-before -d 'Filter by file modification time (older than)' -r
complete -c D:\a\fd\fd\target\release\fd.exe -s x -l exec -d 'Execute a command for each search result' -r
complete -c D:\a\fd\fd\target\release\fd.exe -s X -l exec-batch -d 'Execute a command with all search results at once' -r
complete -c D:\a\fd\fd\target\release\fd.exe -l batch-size -d 'Max number of arguments to run as a batch size with -X' -r
complete -c D:\a\fd\fd\target\release\fd.exe -l ignore-file -d 'Add a custom ignore-file in \'.gitignore\' format' -r -F
complete -c D:\a\fd\fd\target\release\fd.exe -s c -l color -d 'When to use colors' -r -f -a "{auto	show colors if the output goes to an interactive console (default),always	always use colorized output,never	do not use colorized output}"
complete -c D:\a\fd\fd\target\release\fd.exe -s j -l threads -d 'Set number of threads to use for searching & executing (default: number of available CPU cores)' -r
complete -c D:\a\fd\fd\target\release\fd.exe -l max-buffer-time -d 'Milliseconds to buffer before streaming search results to console' -r
complete -c D:\a\fd\fd\target\release\fd.exe -l max-results -d 'Limit number of search results' -r
complete -c D:\a\fd\fd\target\release\fd.exe -l base-directory -d 'Change current working directory' -r -F
complete -c D:\a\fd\fd\target\release\fd.exe -l path-separator -d 'Set path separator when printing file paths' -r
complete -c D:\a\fd\fd\target\release\fd.exe -l search-path -d 'Provides paths to search as an alternative to the positional <path> argument' -r -F
complete -c D:\a\fd\fd\target\release\fd.exe -l gen-completions -r -f -a "{bash	,elvish	,fish	,powershell	,zsh	}"
complete -c D:\a\fd\fd\target\release\fd.exe -s H -l hidden -d 'Search hidden files and directories'
complete -c D:\a\fd\fd\target\release\fd.exe -s I -l no-ignore -d 'Do not respect .(git|fd)ignore files'
complete -c D:\a\fd\fd\target\release\fd.exe -l no-ignore-vcs -d 'Do not respect .gitignore files'
complete -c D:\a\fd\fd\target\release\fd.exe -l no-ignore-parent -d 'Do not respect .(git|fd)ignore files in parent directories'
complete -c D:\a\fd\fd\target\release\fd.exe -l no-global-ignore-file -d 'Do not respect the global ignore file'
complete -c D:\a\fd\fd\target\release\fd.exe -s u -l unrestricted -d 'Unrestricted search, alias for \'--no-ignore --hidden\''
complete -c D:\a\fd\fd\target\release\fd.exe -s s -l case-sensitive -d 'Case-sensitive search (default: smart case)'
complete -c D:\a\fd\fd\target\release\fd.exe -s i -l ignore-case -d 'Case-insensitive search (default: smart case)'
complete -c D:\a\fd\fd\target\release\fd.exe -s g -l glob -d 'Glob-based search (default: regular expression)'
complete -c D:\a\fd\fd\target\release\fd.exe -l regex -d 'Regular-expression based search (default)'
complete -c D:\a\fd\fd\target\release\fd.exe -s F -l fixed-strings -d 'Treat pattern as literal string stead of regex'
complete -c D:\a\fd\fd\target\release\fd.exe -s a -l absolute-path -d 'Show absolute instead of relative paths'
complete -c D:\a\fd\fd\target\release\fd.exe -s l -l list-details -d 'Use a long listing format with file metadata'
complete -c D:\a\fd\fd\target\release\fd.exe -s L -l follow -d 'Follow symbolic links'
complete -c D:\a\fd\fd\target\release\fd.exe -s p -l full-path -d 'Search full abs. path (default: filename only)'
complete -c D:\a\fd\fd\target\release\fd.exe -s 0 -l print0 -d 'Separate search results by the null character'
complete -c D:\a\fd\fd\target\release\fd.exe -l prune -d 'Do not traverse into directories that match the search criteria. If you want to exclude specific directories, use the \'--exclude=…\' option'
complete -c D:\a\fd\fd\target\release\fd.exe -s 1 -d 'Limit search to a single result'
complete -c D:\a\fd\fd\target\release\fd.exe -s q -l quiet -d 'Print nothing, exit code 0 if match found, 1 otherwise'
complete -c D:\a\fd\fd\target\release\fd.exe -l show-errors -d 'Show filesystem errors'
complete -c D:\a\fd\fd\target\release\fd.exe -l strip-cwd-prefix -d 'By default, relative paths are prefixed with \'./\' when -x/--exec, -X/--exec-batch, or -0/--print0 are given, to reduce the risk of a path starting with \'-\' being treated as a command line option. Use this flag to disable this behaviour'
complete -c D:\a\fd\fd\target\release\fd.exe -l one-file-system
complete -c D:\a\fd\fd\target\release\fd.exe -l no-hidden
complete -c D:\a\fd\fd\target\release\fd.exe -l ignore
complete -c D:\a\fd\fd\target\release\fd.exe -l ignore-vcs
complete -c D:\a\fd\fd\target\release\fd.exe -l relative-path
complete -c D:\a\fd\fd\target\release\fd.exe -l no-follow
complete -c D:\a\fd\fd\target\release\fd.exe -s h -l help -d 'Print help information (use `--help` for more detail)'
complete -c D:\a\fd\fd\target\release\fd.exe -s V -l version -d 'Print version information'
