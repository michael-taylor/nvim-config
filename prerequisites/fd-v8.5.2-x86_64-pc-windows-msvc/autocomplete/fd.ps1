
using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'D:\a\fd\fd\target\release\fd.exe' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'D:\a\fd\fd\target\release\fd.exe'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'D:\a\fd\fd\target\release\fd.exe' {
            [CompletionResult]::new('-d', 'd', [CompletionResultType]::ParameterName, 'Set maximum search depth (default: none)')
            [CompletionResult]::new('--max-depth', 'max-depth', [CompletionResultType]::ParameterName, 'Set maximum search depth (default: none)')
            [CompletionResult]::new('--min-depth', 'min-depth', [CompletionResultType]::ParameterName, 'Only show search results starting at the given depth')
            [CompletionResult]::new('--exact-depth', 'exact-depth', [CompletionResultType]::ParameterName, 'Only show search results at the exact given depth')
            [CompletionResult]::new('-E', 'E', [CompletionResultType]::ParameterName, 'Exclude entries that match the given glob pattern')
            [CompletionResult]::new('--exclude', 'exclude', [CompletionResultType]::ParameterName, 'Exclude entries that match the given glob pattern')
            [CompletionResult]::new('-t', 't', [CompletionResultType]::ParameterName, 'Filter by type: file (f), directory (d), symlink (l), executable (x), empty (e), socket (s), pipe (p)')
            [CompletionResult]::new('--type', 'type', [CompletionResultType]::ParameterName, 'Filter by type: file (f), directory (d), symlink (l), executable (x), empty (e), socket (s), pipe (p)')
            [CompletionResult]::new('-e', 'e', [CompletionResultType]::ParameterName, 'Filter by file extension')
            [CompletionResult]::new('--extension', 'extension', [CompletionResultType]::ParameterName, 'Filter by file extension')
            [CompletionResult]::new('-S', 'S', [CompletionResultType]::ParameterName, 'Limit results based on the size of files')
            [CompletionResult]::new('--size', 'size', [CompletionResultType]::ParameterName, 'Limit results based on the size of files')
            [CompletionResult]::new('--changed-within', 'changed-within', [CompletionResultType]::ParameterName, 'Filter by file modification time (newer than)')
            [CompletionResult]::new('--changed-before', 'changed-before', [CompletionResultType]::ParameterName, 'Filter by file modification time (older than)')
            [CompletionResult]::new('-x', 'x', [CompletionResultType]::ParameterName, 'Execute a command for each search result')
            [CompletionResult]::new('--exec', 'exec', [CompletionResultType]::ParameterName, 'Execute a command for each search result')
            [CompletionResult]::new('-X', 'X', [CompletionResultType]::ParameterName, 'Execute a command with all search results at once')
            [CompletionResult]::new('--exec-batch', 'exec-batch', [CompletionResultType]::ParameterName, 'Execute a command with all search results at once')
            [CompletionResult]::new('--batch-size', 'batch-size', [CompletionResultType]::ParameterName, 'Max number of arguments to run as a batch size with -X')
            [CompletionResult]::new('--ignore-file', 'ignore-file', [CompletionResultType]::ParameterName, 'Add a custom ignore-file in ''.gitignore'' format')
            [CompletionResult]::new('-c', 'c', [CompletionResultType]::ParameterName, 'When to use colors')
            [CompletionResult]::new('--color', 'color', [CompletionResultType]::ParameterName, 'When to use colors')
            [CompletionResult]::new('-j', 'j', [CompletionResultType]::ParameterName, 'Set number of threads to use for searching & executing (default: number of available CPU cores)')
            [CompletionResult]::new('--threads', 'threads', [CompletionResultType]::ParameterName, 'Set number of threads to use for searching & executing (default: number of available CPU cores)')
            [CompletionResult]::new('--max-buffer-time', 'max-buffer-time', [CompletionResultType]::ParameterName, 'Milliseconds to buffer before streaming search results to console')
            [CompletionResult]::new('--max-results', 'max-results', [CompletionResultType]::ParameterName, 'Limit number of search results')
            [CompletionResult]::new('--base-directory', 'base-directory', [CompletionResultType]::ParameterName, 'Change current working directory')
            [CompletionResult]::new('--path-separator', 'path-separator', [CompletionResultType]::ParameterName, 'Set path separator when printing file paths')
            [CompletionResult]::new('--search-path', 'search-path', [CompletionResultType]::ParameterName, 'Provides paths to search as an alternative to the positional <path> argument')
            [CompletionResult]::new('--gen-completions', 'gen-completions', [CompletionResultType]::ParameterName, 'gen-completions')
            [CompletionResult]::new('-H', 'H', [CompletionResultType]::ParameterName, 'Search hidden files and directories')
            [CompletionResult]::new('--hidden', 'hidden', [CompletionResultType]::ParameterName, 'Search hidden files and directories')
            [CompletionResult]::new('-I', 'I', [CompletionResultType]::ParameterName, 'Do not respect .(git|fd)ignore files')
            [CompletionResult]::new('--no-ignore', 'no-ignore', [CompletionResultType]::ParameterName, 'Do not respect .(git|fd)ignore files')
            [CompletionResult]::new('--no-ignore-vcs', 'no-ignore-vcs', [CompletionResultType]::ParameterName, 'Do not respect .gitignore files')
            [CompletionResult]::new('--no-ignore-parent', 'no-ignore-parent', [CompletionResultType]::ParameterName, 'Do not respect .(git|fd)ignore files in parent directories')
            [CompletionResult]::new('--no-global-ignore-file', 'no-global-ignore-file', [CompletionResultType]::ParameterName, 'Do not respect the global ignore file')
            [CompletionResult]::new('-u', 'u', [CompletionResultType]::ParameterName, 'Unrestricted search, alias for ''--no-ignore --hidden''')
            [CompletionResult]::new('--unrestricted', 'unrestricted', [CompletionResultType]::ParameterName, 'Unrestricted search, alias for ''--no-ignore --hidden''')
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'Case-sensitive search (default: smart case)')
            [CompletionResult]::new('--case-sensitive', 'case-sensitive', [CompletionResultType]::ParameterName, 'Case-sensitive search (default: smart case)')
            [CompletionResult]::new('-i', 'i', [CompletionResultType]::ParameterName, 'Case-insensitive search (default: smart case)')
            [CompletionResult]::new('--ignore-case', 'ignore-case', [CompletionResultType]::ParameterName, 'Case-insensitive search (default: smart case)')
            [CompletionResult]::new('-g', 'g', [CompletionResultType]::ParameterName, 'Glob-based search (default: regular expression)')
            [CompletionResult]::new('--glob', 'glob', [CompletionResultType]::ParameterName, 'Glob-based search (default: regular expression)')
            [CompletionResult]::new('--regex', 'regex', [CompletionResultType]::ParameterName, 'Regular-expression based search (default)')
            [CompletionResult]::new('-F', 'F', [CompletionResultType]::ParameterName, 'Treat pattern as literal string stead of regex')
            [CompletionResult]::new('--fixed-strings', 'fixed-strings', [CompletionResultType]::ParameterName, 'Treat pattern as literal string stead of regex')
            [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Show absolute instead of relative paths')
            [CompletionResult]::new('--absolute-path', 'absolute-path', [CompletionResultType]::ParameterName, 'Show absolute instead of relative paths')
            [CompletionResult]::new('-l', 'l', [CompletionResultType]::ParameterName, 'Use a long listing format with file metadata')
            [CompletionResult]::new('--list-details', 'list-details', [CompletionResultType]::ParameterName, 'Use a long listing format with file metadata')
            [CompletionResult]::new('-L', 'L', [CompletionResultType]::ParameterName, 'Follow symbolic links')
            [CompletionResult]::new('--follow', 'follow', [CompletionResultType]::ParameterName, 'Follow symbolic links')
            [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'Search full abs. path (default: filename only)')
            [CompletionResult]::new('--full-path', 'full-path', [CompletionResultType]::ParameterName, 'Search full abs. path (default: filename only)')
            [CompletionResult]::new('-0', '0', [CompletionResultType]::ParameterName, 'Separate search results by the null character')
            [CompletionResult]::new('--print0', 'print0', [CompletionResultType]::ParameterName, 'Separate search results by the null character')
            [CompletionResult]::new('--prune', 'prune', [CompletionResultType]::ParameterName, 'Do not traverse into directories that match the search criteria. If you want to exclude specific directories, use the ''--exclude=…'' option')
            [CompletionResult]::new('-1', '1', [CompletionResultType]::ParameterName, 'Limit search to a single result')
            [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Print nothing, exit code 0 if match found, 1 otherwise')
            [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Print nothing, exit code 0 if match found, 1 otherwise')
            [CompletionResult]::new('--show-errors', 'show-errors', [CompletionResultType]::ParameterName, 'Show filesystem errors')
            [CompletionResult]::new('--strip-cwd-prefix', 'strip-cwd-prefix', [CompletionResultType]::ParameterName, 'By default, relative paths are prefixed with ''./'' when -x/--exec, -X/--exec-batch, or -0/--print0 are given, to reduce the risk of a path starting with ''-'' being treated as a command line option. Use this flag to disable this behaviour')
            [CompletionResult]::new('--one-file-system', 'one-file-system', [CompletionResultType]::ParameterName, 'one-file-system')
            [CompletionResult]::new('--no-hidden', 'no-hidden', [CompletionResultType]::ParameterName, 'no-hidden')
            [CompletionResult]::new('--ignore', 'ignore', [CompletionResultType]::ParameterName, 'ignore')
            [CompletionResult]::new('--ignore-vcs', 'ignore-vcs', [CompletionResultType]::ParameterName, 'ignore-vcs')
            [CompletionResult]::new('--relative-path', 'relative-path', [CompletionResultType]::ParameterName, 'relative-path')
            [CompletionResult]::new('--no-follow', 'no-follow', [CompletionResultType]::ParameterName, 'no-follow')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information (use `--help` for more detail)')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information (use `--help` for more detail)')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Print version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version information')
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
