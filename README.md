# Ruby/Rails centric vim_files and installer

With a great colour scheme and support for auto-complete, git, rvm and sparkup.

## Requirements

Vim 7.3 or better
Tested on MacOS and Linux

Introduction to Vim: http://blog.interlinked.org/tutorials/vim_tutorial.html

## Basic Mappings

The leader is mapped to `,`

### In Normal mode (`Esc` or `jj`)

`,p`     - File browser (NerdTree)

`,s`     - Find in Files (Ctrlp)

`Space`  - Search in buffer

`,a`     - Search in files (Ack)

`,b`     - Search open buffers (Ctrlp)

`,d`     - close buffer

`,D`     - close all buffers

`,Space` - Remove search highlighting

`,t`     - Show tags

`,x`     - Delete trailing whte spaces

`//`     - Toggle comments (T-Comment)

`F5`     - Undo history (GUndo)

`F6`     - Auto format

`Tab`    - Next buffer

`Shift + Tab` - Previous buffer

`,,`     - Toggle between last two buffers

`,m`     - Jump to model

`,v`     - Jump to view

`,sm`    - Search in app/models

`,sc`    - Search in app/controller

`,sv`    - Search in app/views

`,sh`    - Search in app/helpers

`,sl`    - Search in lib

`,sp`    - Search in public

`,sj`    - Search in app/assets/javascripts

`,ss`    - Search in app/assets/stylesheets

`,or`    - Open routes in split

`,og`    - Open Gemfile in split

`,vir`   - Visual select inner Ruby block

`,var`   - Visual select around Ruby block

### In Insert mode (`i`)

`jj` - Back to normal mode

`<tab>` - auto complete or expand snippet

See `.vimrc` for more.

## Plugins

### rails

*Lots* of stuff - get to know this plugin!

`:Rmodel` - jump to model

`:Rview` - jump to view

`:help rails`

### coffee-script

CoffeeScript support

`:CoffeeCompile watch` show compiled js in split

https://github.com/kchmck/vim-coffee-script


### ejs/jst

Added support for jst templates

### ruby-block

Provides text-objects for Ruby blocks

`var` (visual around Ruby)

`vir` (visual inner Ruby)

`ar` / `ir` (expand/contract selection)

`cir` (change inner Ruby)

`dar` (delete around Ruby)

http://vimcasts.org/blog/2010/12/a-text-object-for-ruby-blocks/

### fugitive

Git integration

*Lots* of stuff

`,gc` - git commit

`,gs` - git status (and press `-` to stage file)

`,gp` - git push

`,gu` - git pull (update)

`,gd` - git diff

http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/

### rvm

Add RVM integration

### ctrlp (`,s` `,b`)

Find open buffer by path/filename

`,b buffer_name`

Search for files in your project with minimal keypresses

For example `conadus` would find `controllers/admin/users`

`,s path_or_filename`

`,sd path_or_filename` - search in current directory

`Ctrl + n` - next result

`Ctrl + p` - previous result

`Ctrl + c` - cancel

### snipmate (`TAB`)

Snippets, press `TAB` to expand

Examples (in a Ruby file):

`def<tab>`

`.each<tab>`

`.eado<tab>`

`ife<tab>`

### gist (`:Gist`)

Gist current file/selection

Requires setting GITHUB_TOKEN and GITHUB_USER Env's

### gundo (`F5`)

Navigate changes history tree

http://vimcasts.org/episodes/undo-branching-and-gundo-vim/

### tabular

Align stuff

http://vimcasts.org/episodes/aligning-text-with-tabular-vim/

### tcomment (`//`)

Comment/Uncomment stuff out

### yankring

Shows history of yanked (copied) text

Pressing `ctrl + p` will also cycle through paste history

### ack (`,a`)

Search project for text (aka find in files)

`,a word`

`,a "some words"`

### nerdtree (`,p`)

Project file browser

`,p` opens file browser

`o` / `x` open and close files/folders

`m` menu to move/delete/copy files/folders

`?` Help

I use nerdtree for creating or moving files, but find ctrlp quicker for
opening files.

### surround (`ys`/`cs`/`ds`)

Allows adding/removing/changing of surroundings

I would highly recommend getting to know this plugin, it is very useful.
Especially when you grok text objects.

*Characters*

`ysiw)`    - surround inner word with `()`

`ysiw(`    - surround inner word with `(  )`

In the above example `iw` can be replaced with any text object or motion.

If you find yourself manually adding surroundings, stop and work out the
correct text object or motion.

`cs"'`     - change surrounding from `"` to `'`

`ds`       - delete surrounding

*Tags*

`yss<p>`  - surround line in `<p>` tags

`cst<div>` - change surround tag to `<div>`

### molokai

My favorite colour scheme for now.

### taglist (`,l`)

Lists method names, provide auto complete

Run `ctags -R` in project root to generate tags

### preview (`,P`)

Preview markup files such as Markdown and RDoc

Each format requires the relevant gem to be installed such as `bluecloth`
for Markdown and `github-markup` for RDoc.

### syntastic

Syntax checking

When a file is saved the syntax is automatically checked and any errors
reported.

### powerline

The ultimate vim statusline utility.
Customed over it.

### vundle

Plugin manager and part of the reason why my vim_files as so compact

## INSTALLATION

Note: If you are using RVM make sure you use system ruby before installation.

    rvm use system

Note: If you already have Vim installed ensure it has support for Ruby:

    vim --version | grep ruby

You should see `+ruby,` if you see `-ruby` you need to reinstall Vim with Ruby support

### Install Vim (if not already installed)

#### MacOS: MacVim / Vim

    brew install macvim --override-system-vim --enable-clipboard

Add `/usr/local/bin` before `/usr/bin` in your `$PATH` so you use the version of
vim installed by Homebrew, not the one that comes with MacOS.

By installing Vim in this way MacVim and regular Vim are exactly the same.

#### Ubuntu: gVim / Vim

*Server*

    apt-get install vim-nox

*Desktop*

    apt-get install vim-gnome

#### GNU/Linux from source

If you have an old GNU/Linux distro which does not have Vim 7.3 or better in its repos then install from source.

The configure options below leave out any GUI related features as I have only compiled Vim on a server.

Vim source is in a hg (Mercurial) repository so you need to install the hg
client first, e.g.  `sudo apt-get install mercurial`.

    hg clone https://vim.googlecode.com/hg/ vim
    cd vim/vim73
    ./configure
    ./configure --with-features=huge --enable-cscope --enable-pythoninterp --enable-rubyinterp --enable-perlinterp --enable-multibyte
    make
    sudo make install

This installs Vim to `/usr/local/bin,` check this is in your `$PATH` before `/usr/bin` which may contain an older system version of Vim.

If you get an error `no terminal library found` install `libncurses5-dev`.

### Install these vim_files

Note: You will already have a `~/.vim` folder, either delete or move it.

    mv ~/.vim ~/.vim.old
    git clone https://github.com/episko/vim_files ~/.vim
    cd ~/.vim
    rake install

#### To update to the latest vim_files

    cd ~/.vim
    rake update

#### Install Dependacies

*MacOS*

    brew install ack
    brew install ctags

Note: MacOS comes with the BSD version of ctags which is not compatible.

*Ubuntu*

    sudo apt-get install exuberant-ctags
    sudo apt-get install ack-grep
    sudo ln -s /usr/bin/ack-grep /usr/local/bin/ack

## Helpful Stuff

- http://github.com/krisleech/vimfiles/wiki
- http://walking-without-crutches.heroku.com/image/images/vi-vim-cheat-sheet.png
- http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/
- http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118
- http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-lines
- `:help key-notation`
- http://vimcasts.org/

## Acknowledgments

- Tim Pope (of course) http://tpo.pe/
- https://github.com/carlhuda/janus
- https://github.com/rson/vimfiles/blob/master/plugins.vim
- https://github.com/codegram/vimfiles
- https://www.destroyallsoftware.com/file-navigation-in-vim.html
- https://github.com/alexreisner/dotfiles/blob/master/.vimrc
- http://items.sjbach.com/319/configuring-vim-right
- https://github.com/sickill/dotfiles/blob/master/.vimrc
- #vim on freenode
 - woldrich
 - spiiph

## Credits

Special thanks to Kris Leech for his [vimfiles](https://github.com/krisleech/vimfiles)
on which this configuration is based on.
