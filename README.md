# rootee

* https://github.com/zhaocai/rootee


## DESCRIPTION:

This short script tries to find project root path based on common source control directory structure and project related files.

It is not 100% accurate but works for most common cases.

## INSTALLATION:

* `[sudo] gem install rootee`

## USAGE EXAMPLE

### 1. Quick Jump

To quickly jump to current project root in the shell. Add an alias to your zshrc or bshrc.
```sh
alias r='cd "`rootee`"'   # cd project root
```

### 2. Launch Source Management Tool

To quickly launch Source Tree, for example.
```sh
st (){
    open -a SourceTree "${1:-`rootee`}"
}
```


## KNOWN ISSUE:


## DEVELOPERS:

After checking out the source, run:

  $ rake newb

This task will install any missing dependencies, run the tests/specs,
and generate the RDoc.

## LICENSE:

Copyright (c) 2013 Zhao Cai <caizhaoff@gmail.com>

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option)
any later version.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see <http://www.gnu.org/licenses/>.



