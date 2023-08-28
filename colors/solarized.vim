" Name:     Solarized vim colorscheme
" Author:   Ethan Schoonover <es@ethanschoonover.com>
"           Modified by hkmix <jack@zzh.ca>
" URL:      http://ethanschoonover.com/solarized
"           (see this url for latest release & screenshots)
" License:  OSI approved MIT license (see end of this file)
" Created:  In the middle of the night
" Modified: 2021 June 15
"
" Usage "{{{
"
" ---------------------------------------------------------------------
" ABOUT:
" ---------------------------------------------------------------------
" Solarized is a carefully designed selective contrast colorscheme with dual
" light and dark modes that runs in both GUI, 256 and 16 color modes.
"
" See the homepage above for screenshots and details.
"
" ---------------------------------------------------------------------
" OPTIONS:
" ---------------------------------------------------------------------
" See the "solarized.txt" help file included with this colorscheme (in the 
" "doc" subdirectory) for information on options, usage, the Toggle Background 
" function and more. If you have already installed Solarized, this is available 
" from the Solarized menu and command line as ":help solarized"
"
" ---------------------------------------------------------------------
" INSTALLATION:
" ---------------------------------------------------------------------
" Two options for installation: manual or pathogen
"
" MANUAL INSTALLATION OPTION:
" ---------------------------------------------------------------------
"
" 1.  Download the solarized distribution (available on the homepage above)
"     and unarchive the file.
" 2.  Move `solarized.vim` to your `.vim/colors` directory.
" 3.  Move each of the files in each subdirectories to the corresponding .vim
"     subdirectory (e.g. autoload/togglebg.vim goes into your .vim/autoload 
"     directory as .vim/autoload/togglebg.vim).
"
" RECOMMENDED PATHOGEN INSTALLATION OPTION:
" ---------------------------------------------------------------------
"
" 1.  Download and install Tim Pope's Pathogen from:
"     https://github.com/tpope/vim-pathogen
"
" 2.  Next, move or clone the `vim-colors-solarized` directory so that it is
"     a subdirectory of the `.vim/bundle` directory.
"
"     a. **clone with git:**
"
"       $ cd ~/.vim/bundle
"       $ git clone git://github.com/altercation/vim-colors-solarized.git
"
"     b. **or move manually into the pathogen bundle directory:**
"         In the parent directory of vim-colors-solarized:
"
"         $ mv vim-colors-solarized ~/.vim/bundle/
"
" MODIFY VIMRC:
"
" After either Option 1 or Option 2 above, put the following two lines in your
" .vimrc:
"
"     syntax enable
"     set background=dark
"     colorscheme solarized
"
" or, for the light background mode of Solarized:
"
"     syntax enable
"     set background=light
"     colorscheme solarized
"
" I like to have a different background in GUI and terminal modes, so I can use
" the following if-then. However, I find vim's background autodetection to be
" pretty good and, at least with MacVim, I can leave this background value
" assignment out entirely and get the same results.
"
"     if has('gui_running')
"       set background=light
"     else
"       set background=dark
"     endif
"
" See the Solarized homepage at http://ethanschoonover.com/solarized for
" screenshots which will help you select either the light or dark background.
"
" ---------------------------------------------------------------------
" COLOR VALUES
" ---------------------------------------------------------------------
" Download palettes and files from: http://ethanschoonover.com/solarized
"
" L\*a\*b values are canonical (White D65, Reference D50), other values are
" matched in sRGB space.
"
" SOLARIZED HEX     16/8 TERMCOL  XTERM/HEX   L*A*B      sRGB        HSB
" --------- ------- ---- -------  ----------- ---------- ----------- -----------
" base03    #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
" base02    #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
" base01    #586e75 10/7 brgreen  240 #4e4e4e 45 -07 -07  88 110 117 194  25  46
" base00    #657b83 11/7 bryellow 241 #585858 50 -07 -07 101 123 131 195  23  51
" base0     #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
" base1     #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
" base2     #eee8d5  7/7 white    254 #d7d7af 92 -00  10 238 232 213  44  11  93
" base3     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
" yellow    #b58900  3/3 yellow   136 #af8700 60  10  65 181 137   0  45 100  71
" orange    #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
" red       #dc322f  1/1 red      160 #d70000 50  65  45 220  50  47   1  79  86
" magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
" violet    #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
" blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
" cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
" green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60
"
" ---------------------------------------------------------------------
" COLORSCHEME HACKING
" ---------------------------------------------------------------------
"
" Useful commands for testing colorschemes:
" :source $VIMRUNTIME/syntax/hitest.vim
" :help highlight-groups
" :help cterm-colors
" :help group-name
"
" Useful links for developing colorschemes:
" http://www.vim.org/scripts/script.php?script_id=2937
" http://vimcasts.org/episodes/creating-colorschemes-for-vim/
" http://www.frexx.de/xterm-256-notes/"
"
" }}}
" Environment Specific Overrides "{{{
" Allow or disallow certain features based on current terminal emulator or 
" environment.

" Terminals that support italics
let s:terms_italic=[
            \"rxvt",
            \"gnome-terminal"
            \]
" For reference only, terminals are known to be incomptible.
" Terminals that are in neither list need to be tested.
let s:terms_noitalic=[
            \"iTerm.app",
            \"Apple_Terminal"
            \]
if has("gui_running")
    let s:terminal_italic=1 " TODO: could refactor to not require this at all
else
    let s:terminal_italic=0 " terminals will be guilty until proven compatible
    for term in s:terms_italic
        if $TERM_PROGRAM =~ term
            let s:terminal_italic=1
        endif
    endfor
endif

" }}}
" Default option values"{{{
" ---------------------------------------------------------------------
" s:options_list is used to autogenerate a list of all non-default options 
" using "call SolarizedOptions()" or with the "Generate .vimrc commands" 
" Solarized menu option. See the "Menus" section below for the function itself.
let s:options_list=[
            \'" this block of commands has been autogenerated by solarized.vim and',
            \'" includes the current, non-default Solarized option values.',
            \'" To use, place these commands in your .vimrc file (replacing any',
            \'" existing colorscheme commands). See also ":help solarized"',
            \'',
            \'" ------------------------------------------------------------------',
            \'" Solarized Colorscheme Config',
            \'" ------------------------------------------------------------------',
            \]
let s:colorscheme_list=[
            \'syntax enable',
            \'set background='.&background,
            \'colorscheme solarized',
            \]
let s:defaults_list=[
            \'" ------------------------------------------------------------------',
            \'',
            \'" The following items are available options, but do not need to be',
            \'" included in your .vimrc as they are currently set to their defaults.',
            \''
            \]
let s:lazycat_list=[
            \'" lazy method of appending this onto your .vimrc ":w! >> ~/.vimrc"',
            \'" ------------------------------------------------------------------',
            \]

function! s:SetOption(name,default)
    if type(a:default) == type(0)
        let l:wrap=''
        let l:ewrap=''
    else
        let l:wrap='"'
        let l:ewrap='\"'
    endif
    if !exists("g:solarized_".a:name) || g:solarized_{a:name}==a:default
        exe 'let g:solarized_'.a:name.'='.l:wrap.a:default.l:wrap.'"'
        exe 'call add(s:defaults_list, "\" let g:solarized_'.a:name.'='.l:ewrap.g:solarized_{a:name}.l:ewrap.'")'
    else
        exe 'call add(s:options_list,  "let g:solarized_'.a:name.'='.l:ewrap.g:solarized_{a:name}.l:ewrap.'    \"default value is '.a:default.'")'
    endif
endfunction

if ($TERM_PROGRAM ==? "apple_terminal" && &t_Co < 256)
    let s:solarized_termtrans_default = 1
else
    let s:solarized_termtrans_default = 0
endif
call s:SetOption("termtrans",s:solarized_termtrans_default)
call s:SetOption("degrade",0)
call s:SetOption("bold",1)
call s:SetOption("underline",1)
call s:SetOption("italic",1) " note that we need to override this later if the terminal doesn't support
call s:SetOption("termcolors",16)
call s:SetOption("contrast","normal")
call s:SetOption("visibility","normal")
call s:SetOption("diffmode","normal")
call s:SetOption("hitrail",0)
call s:SetOption("menu",1)

"}}}
" Colorscheme initialization "{{{
" ---------------------------------------------------------------------
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "solarized"

"}}}
" GUI & CSApprox hexadecimal palettes"{{{
" ---------------------------------------------------------------------
"
" Set both gui and terminal color values in separate conditional statements
" Due to possibility that CSApprox is running (though I suppose we could just
" leave the hex values out entirely in that case and include only cterm colors)
" We also check to see if user has set solarized (force use of the
" neutral gray monotone palette component)
if (has("gui_running") && g:solarized_degrade == 0)
    let s:vmode       = "gui"
    let s:base03      = "#002b36"
    let s:base02      = "#073642"
    let s:base01      = "#586e75"
    let s:base00      = "#657b83"
    let s:base0       = "#839496"
    let s:base1       = "#93a1a1"
    let s:base2       = "#eee8d5"
    let s:base3       = "#fdf6e3"
    let s:yellow      = "#b58900"
    let s:orange      = "#cb4b16"
    let s:red         = "#dc322f"
    let s:magenta     = "#d33682"
    let s:violet      = "#6c71c4"
    let s:blue        = "#268bd2"
    let s:cyan        = "#2aa198"
    "let s:green       = "#859900" "original
    let s:green       = "#719e07" "experimental
elseif (has("gui_running") && g:solarized_degrade == 1)
    " These colors are identical to the 256 color mode. They may be viewed
    " while in gui mode via "let g:solarized_degrade=1", though this is not
    " recommened and is for testing only.
    let s:vmode       = "gui"
    let s:base03      = "#1c1c1c"
    let s:base02      = "#262626"
    let s:base01      = "#4e4e4e"
    let s:base00      = "#585858"
    let s:base0       = "#808080"
    let s:base1       = "#8a8a8a"
    let s:base2       = "#d7d7af"
    let s:base3       = "#ffffd7"
    let s:yellow      = "#af8700"
    let s:orange      = "#d75f00"
    let s:red         = "#af0000"
    let s:magenta     = "#af005f"
    let s:violet      = "#5f5faf"
    let s:blue        = "#0087ff"
    let s:cyan        = "#00afaf"
    let s:green       = "#5f8700"
elseif g:solarized_termcolors != 256 && &t_Co >= 16
    let s:vmode       = "cterm"
    let s:base03      = "8"
    let s:base02      = "0"
    let s:base01      = "10"
    let s:base00      = "11"
    let s:base0       = "12"
    let s:base1       = "14"
    let s:base2       = "7"
    let s:base3       = "15"
    let s:yellow      = "3"
    let s:orange      = "9"
    let s:red         = "1"
    let s:magenta     = "5"
    let s:violet      = "13"
    let s:blue        = "4"
    let s:cyan        = "6"
    let s:green       = "2"
elseif g:solarized_termcolors == 256
    let s:vmode       = "cterm"
    let s:base03      = "234"
    let s:base02      = "235"
    let s:base01      = "239"
    let s:base00      = "240"
    let s:base0       = "244"
    let s:base1       = "245"
    let s:base2       = "187"
    let s:base3       = "230"
    let s:yellow      = "136"
    let s:orange      = "166"
    let s:red         = "124"
    let s:magenta     = "125"
    let s:violet      = "61"
    let s:blue        = "33"
    let s:cyan        = "37"
    let s:green       = "64"
else
    let s:vmode       = "cterm"
    let s:bright      = "* term=bold cterm=bold"
"   let s:base03      = "0".s:bright
"   let s:base02      = "0"
"   let s:base01      = "2".s:bright
"   let s:base00      = "3".s:bright
"   let s:base0       = "4".s:bright
"   let s:base1       = "6".s:bright
"   let s:base2       = "7"
"   let s:base3       = "7".s:bright
"   let s:yellow      = "3"
"   let s:orange      = "1".s:bright
"   let s:red         = "1"
"   let s:magenta     = "5"
"   let s:violet      = "5".s:bright
"   let s:blue        = "4"
"   let s:cyan        = "6"
"   let s:green       = "2"
    let s:base03      = "DarkGray"      " 0*
    let s:base02      = "Black"         " 0
    let s:base01      = "LightGreen"    " 2*
    let s:base00      = "LightYellow"   " 3*
    let s:base0       = "LightBlue"     " 4*
    let s:base1       = "LightCyan"     " 6*
    let s:base2       = "LightGray"     " 7
    let s:base3       = "White"         " 7*
    let s:yellow      = "DarkYellow"    " 3
    let s:orange      = "LightRed"      " 1*
    let s:red         = "DarkRed"       " 1
    let s:magenta     = "DarkMagenta"   " 5
    let s:violet      = "LightMagenta"  " 5*
    let s:blue        = "DarkBlue"      " 4
    let s:cyan        = "DarkCyan"      " 6
    let s:green       = "DarkGreen"     " 2

endif
"}}}
" Formatting options and null values for passthrough effect "{{{
" ---------------------------------------------------------------------
    let s:none            = "NONE"
    let s:none            = "NONE"
    let s:t_none          = "NONE"
    let s:n               = "NONE"
    let s:c               = ",undercurl"
    let s:r               = ",reverse"
    let s:s               = ",standout"
    let s:ou              = ""
    let s:ob              = ""
"}}}
" Background value based on termtrans setting "{{{
" ---------------------------------------------------------------------
if (has("gui_running") || g:solarized_termtrans == 0)
    let s:back        = s:base03
else
    let s:back        = "NONE"
endif
"}}}
" Alternate light scheme "{{{
" ---------------------------------------------------------------------
if &background == "light"
    let s:temp03      = s:base03
    let s:temp02      = s:base02
    let s:temp01      = s:base01
    let s:temp00      = s:base00
    let s:base03      = s:base3
    let s:base02      = s:base2
    let s:base01      = s:base1
    let s:base00      = s:base0
    let s:base0       = s:temp00
    let s:base1       = s:temp01
    let s:base2       = s:temp02
    let s:base3       = s:temp03
    if (s:back != "NONE")
        let s:back    = s:base03
    endif
endif
"}}}
" Optional contrast schemes "{{{
" ---------------------------------------------------------------------
if g:solarized_contrast == "high"
    let s:base01      = s:base00
    let s:base00      = s:base0
    let s:base0       = s:base1
    let s:base1       = s:base2
    let s:base2       = s:base3
    let s:back        = s:back
endif
if g:solarized_contrast == "low"
    let s:back        = s:base02
    let s:ou          = ",underline"
endif
"}}}
" Overrides dependent on user specified values and environment "{{{
" ---------------------------------------------------------------------
if (g:solarized_bold == 0 || &t_Co == 8 )
    let s:b           = ""
    let s:bb          = ",bold"
else
    let s:b           = ",bold"
    let s:bb          = ""
endif

if g:solarized_underline == 0
    let s:u           = ""
else
    let s:u           = ",underline"
endif

if g:solarized_italic == 0 || s:terminal_italic == 0
    let s:i           = ""
else
    let s:i           = ",italic"
endif
"}}}
" Highlighting primitives"{{{
" ---------------------------------------------------------------------

exe "let s:bg_none      = ' ".s:vmode."bg=".s:none   ."'"
exe "let s:bg_back      = ' ".s:vmode."bg=".s:back   ."'"
exe "let s:bg_base03    = ' ".s:vmode."bg=".s:base03 ."'"
exe "let s:bg_base02    = ' ".s:vmode."bg=".s:base02 ."'"
exe "let s:bg_base01    = ' ".s:vmode."bg=".s:base01 ."'"
exe "let s:bg_base00    = ' ".s:vmode."bg=".s:base00 ."'"
exe "let s:bg_base0     = ' ".s:vmode."bg=".s:base0  ."'"
exe "let s:bg_base1     = ' ".s:vmode."bg=".s:base1  ."'"
exe "let s:bg_base2     = ' ".s:vmode."bg=".s:base2  ."'"
exe "let s:bg_base3     = ' ".s:vmode."bg=".s:base3  ."'"
exe "let s:bg_green     = ' ".s:vmode."bg=".s:green  ."'"
exe "let s:bg_yellow    = ' ".s:vmode."bg=".s:yellow ."'"
exe "let s:bg_orange    = ' ".s:vmode."bg=".s:orange ."'"
exe "let s:bg_red       = ' ".s:vmode."bg=".s:red    ."'"
exe "let s:bg_magenta   = ' ".s:vmode."bg=".s:magenta."'"
exe "let s:bg_violet    = ' ".s:vmode."bg=".s:violet ."'"
exe "let s:bg_blue      = ' ".s:vmode."bg=".s:blue   ."'"
exe "let s:bg_cyan      = ' ".s:vmode."bg=".s:cyan   ."'"

exe "let s:fg_none      = ' ".s:vmode."fg=".s:none   ."'"
exe "let s:fg_back      = ' ".s:vmode."fg=".s:back   ."'"
exe "let s:fg_base03    = ' ".s:vmode."fg=".s:base03 ."'"
exe "let s:fg_base02    = ' ".s:vmode."fg=".s:base02 ."'"
exe "let s:fg_base01    = ' ".s:vmode."fg=".s:base01 ."'"
exe "let s:fg_base00    = ' ".s:vmode."fg=".s:base00 ."'"
exe "let s:fg_base0     = ' ".s:vmode."fg=".s:base0  ."'"
exe "let s:fg_base1     = ' ".s:vmode."fg=".s:base1  ."'"
exe "let s:fg_base2     = ' ".s:vmode."fg=".s:base2  ."'"
exe "let s:fg_base3     = ' ".s:vmode."fg=".s:base3  ."'"
exe "let s:fg_green     = ' ".s:vmode."fg=".s:green  ."'"
exe "let s:fg_yellow    = ' ".s:vmode."fg=".s:yellow ."'"
exe "let s:fg_orange    = ' ".s:vmode."fg=".s:orange ."'"
exe "let s:fg_red       = ' ".s:vmode."fg=".s:red    ."'"
exe "let s:fg_magenta   = ' ".s:vmode."fg=".s:magenta."'"
exe "let s:fg_violet    = ' ".s:vmode."fg=".s:violet ."'"
exe "let s:fg_blue      = ' ".s:vmode."fg=".s:blue   ."'"
exe "let s:fg_cyan      = ' ".s:vmode."fg=".s:cyan   ."'"

exe "let s:fmt_none     = ' ".s:vmode."=NONE".          " term=NONE".    "'"
exe "let s:fmt_bold     = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b."'"
exe "let s:fmt_bldi     = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b."'"
exe "let s:fmt_undr     = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u."'"
exe "let s:fmt_undb     = ' ".s:vmode."=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi     = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u."'"
exe "let s:fmt_uopt     = ' ".s:vmode."=NONE".s:ou.     " term=NONE".s:ou."'"
exe "let s:fmt_curl     = ' ".s:vmode."=NONE".s:c.      " term=NONE".s:c."'"
exe "let s:fmt_ital     = ' ".s:vmode."=NONE".s:i.      " term=NONE".s:i."'"
exe "let s:fmt_stnd     = ' ".s:vmode."=NONE".s:s.      " term=NONE".s:s."'"
exe "let s:fmt_revr     = ' ".s:vmode."=NONE".s:r.      " term=NONE".s:r."'"
exe "let s:fmt_revb     = ' ".s:vmode."=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"
" revbb (reverse bold for bright colors) is only set to actual bold in low 
" color terminals (t_co=8, such as OS X Terminal.app) and should only be used 
" with colors 8-15.
exe "let s:fmt_revbb    = ' ".s:vmode."=NONE".s:r.s:bb.   " term=NONE".s:r.s:bb."'"
exe "let s:fmt_revbbu   = ' ".s:vmode."=NONE".s:r.s:bb.s:u." term=NONE".s:r.s:bb.s:u."'"

if has("gui_running")
    exe "let s:sp_none      = ' guisp=".s:none   ."'"
    exe "let s:sp_back      = ' guisp=".s:back   ."'"
    exe "let s:sp_base03    = ' guisp=".s:base03 ."'"
    exe "let s:sp_base02    = ' guisp=".s:base02 ."'"
    exe "let s:sp_base01    = ' guisp=".s:base01 ."'"
    exe "let s:sp_base00    = ' guisp=".s:base00 ."'"
    exe "let s:sp_base0     = ' guisp=".s:base0  ."'"
    exe "let s:sp_base1     = ' guisp=".s:base1  ."'"
    exe "let s:sp_base2     = ' guisp=".s:base2  ."'"
    exe "let s:sp_base3     = ' guisp=".s:base3  ."'"
    exe "let s:sp_green     = ' guisp=".s:green  ."'"
    exe "let s:sp_yellow    = ' guisp=".s:yellow ."'"
    exe "let s:sp_orange    = ' guisp=".s:orange ."'"
    exe "let s:sp_red       = ' guisp=".s:red    ."'"
    exe "let s:sp_magenta   = ' guisp=".s:magenta."'"
    exe "let s:sp_violet    = ' guisp=".s:violet ."'"
    exe "let s:sp_blue      = ' guisp=".s:blue   ."'"
    exe "let s:sp_cyan      = ' guisp=".s:cyan   ."'"
else
    let s:sp_none      = ""
    let s:sp_back      = ""
    let s:sp_base03    = ""
    let s:sp_base02    = ""
    let s:sp_base01    = ""
    let s:sp_base00    = ""
    let s:sp_base0     = ""
    let s:sp_base1     = ""
    let s:sp_base2     = ""
    let s:sp_base3     = ""
    let s:sp_green     = ""
    let s:sp_yellow    = ""
    let s:sp_orange    = ""
    let s:sp_red       = ""
    let s:sp_magenta   = ""
    let s:sp_violet    = ""
    let s:sp_blue      = ""
    let s:sp_cyan      = ""
endif

"}}}
" Basic highlighting"{{{
" ---------------------------------------------------------------------
" note that link syntax to avoid duplicate configuration doesn't work with the
" exe compiled formats

exe "hi! None"           .s:fmt_none   .s:fg_none   .s:bg_none

exe "hi! Normal"         .s:fmt_none   .s:fg_base0  .s:bg_back

exe "hi! Comment"        .s:fmt_ital   .s:fg_base01 .s:bg_none
"       *Comment         any comment

exe "hi! Constant"       .s:fmt_none   .s:fg_cyan   .s:bg_none
"       *Constant        any constant
"        String          a string constant: "this is a string"
"        Character       a character constant: 'c', '\n'
"        Number          a number constant: 234, 0xff
"        Boolean         a boolean constant: TRUE, false
"        Float           a floating point constant: 2.3e10

exe "hi! Identifier"     .s:fmt_none   .s:fg_base0   .s:bg_none
"       *Identifier      any variable name
"        Function        function name (also: methods for classes)
"
exe "hi! Highlighted"    .s:fmt_none   .s:fg_blue    .s:bg_none

exe "hi! Statement"      .s:fmt_none   .s:fg_green  .s:bg_none
"       *Statement       any statement
"        Conditional     if, then, else, endif, switch, etc.
"        Repeat          for, do, while, etc.
"        Label           case, default, etc.
"        Operator        "sizeof", "+", "*", etc.
"        Keyword         any other keyword
"        Exception       try, catch, throw

exe "hi! PreProc"        .s:fmt_none   .s:fg_orange .s:bg_none
"       *PreProc         generic Preprocessor
"        Include         preprocessor #include
"        Define          preprocessor #define
"        Macro           same as Define
"        PreCondit       preprocessor #if, #else, #endif, etc.

exe "hi! Type"           .s:fmt_none   .s:fg_yellow .s:bg_none
"       *Type            int, long, char, etc.
"        StorageClass    static, register, volatile, etc.
"        Structure       struct, union, enum, etc.
"        Typedef         A typedef

exe "hi! Special"        .s:fmt_none   .s:fg_red    .s:bg_none
"       *Special         any special symbol
"        SpecialChar     special character in a constant
"        Tag             you can use CTRL-] on this
"        Delimiter       character that needs attention
"        SpecialComment  special things inside a comment
"        Debug           debugging statements

exe "hi! Underlined"     .s:fmt_none   .s:fg_violet .s:bg_none
"       *Underlined      text that stands out, HTML links

exe "hi! Ignore"         .s:fmt_none   .s:fg_none   .s:bg_none
"       *Ignore          left blank, hidden  |hl-Ignore|

exe "hi! Escape"         .s:fmt_none   .s:fg_red    .s:bg_none
"       *Escape          escape sequences

exe "hi! Error"          .s:fmt_bold   .s:fg_red    .s:bg_none
"       *Error           any erroneous construct

exe "hi! Todo"           .s:fmt_bold   .s:fg_magenta.s:bg_none
"       *Todo            anything that needs extra attention; mostly the
"                        keywords TODO FIXME and XXX
"
"}}}
" Extended highlighting "{{{
" ---------------------------------------------------------------------
if      (g:solarized_visibility=="high")
    exe "hi! SpecialKey" .s:fmt_revr   .s:fg_red    .s:bg_none
    exe "hi! NonText"    .s:fmt_bold   .s:fg_red    .s:bg_none
elseif  (g:solarized_visibility=="low")
    exe "hi! SpecialKey" .s:fmt_bold   .s:fg_base02 .s:bg_none
    exe "hi! NonText"    .s:fmt_bold   .s:fg_base02 .s:bg_none
else
    exe "hi! SpecialKey" .s:fmt_bold   .s:fg_base00 .s:bg_base02
    exe "hi! NonText"    .s:fmt_bold   .s:fg_base00 .s:bg_none
endif
exe "hi! StatusLine"     .s:fmt_none   .s:fg_base1  .s:bg_base02 .s:fmt_revbb
exe "hi! StatusLineNC"   .s:fmt_none   .s:fg_base00 .s:bg_base02 .s:fmt_revbb
exe "hi! Visual"         .s:fmt_none   .s:fg_base01 .s:bg_base03 .s:fmt_revbb
exe "hi! Directory"      .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! ErrorMsg"       .s:fmt_revr   .s:fg_red    .s:bg_none
exe "hi! IncSearch"      .s:fmt_stnd   .s:fg_orange .s:bg_none
exe "hi! Search"         .s:fmt_revr   .s:fg_yellow .s:bg_none
exe "hi! MoreMsg"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! ModeMsg"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! LineNr"         .s:fmt_none   .s:fg_base01 .s:bg_base02
exe "hi! Question"       .s:fmt_bold   .s:fg_cyan   .s:bg_none
if ( has("gui_running") || &t_Co > 8 )
    exe "hi! VertSplit"  .s:fmt_none   .s:fg_base00 .s:bg_base00
else
    exe "hi! VertSplit"  .s:fmt_revbb  .s:fg_base00 .s:bg_base02
endif
exe "hi! Title"          .s:fmt_bold   .s:fg_orange .s:bg_none
exe "hi! VisualNOS"      .s:fmt_stnd   .s:fg_none   .s:bg_base02 .s:fmt_revbb
exe "hi! WarningMsg"     .s:fmt_bold   .s:fg_red    .s:bg_none
exe "hi! WildMenu"       .s:fmt_none   .s:fg_base2  .s:bg_base02 .s:fmt_revbb
exe "hi! Folded"         .s:fmt_undb   .s:fg_base0  .s:bg_base02  .s:sp_base03
exe "hi! FoldColumn"     .s:fmt_none   .s:fg_base0  .s:bg_base02
if      (g:solarized_diffmode=="high")
exe "hi! DiffAdd"        .s:fmt_revr   .s:fg_green  .s:bg_none
exe "hi! DiffChange"     .s:fmt_revr   .s:fg_yellow .s:bg_none
exe "hi! DiffDelete"     .s:fmt_revr   .s:fg_red    .s:bg_none
exe "hi! DiffText"       .s:fmt_revr   .s:fg_blue   .s:bg_none
elseif  (g:solarized_diffmode=="low")
exe "hi! DiffAdd"        .s:fmt_undr   .s:fg_green  .s:bg_none   .s:sp_green
exe "hi! DiffChange"     .s:fmt_undr   .s:fg_yellow .s:bg_none   .s:sp_yellow
exe "hi! DiffDelete"     .s:fmt_bold   .s:fg_red    .s:bg_none
exe "hi! DiffText"       .s:fmt_undr   .s:fg_blue   .s:bg_none   .s:sp_blue
else " normal
    if has("gui_running")
exe "hi! DiffAdd"        .s:fmt_bold   .s:fg_green  .s:bg_base02 .s:sp_green
exe "hi! DiffChange"     .s:fmt_bold   .s:fg_yellow .s:bg_base02 .s:sp_yellow
exe "hi! DiffDelete"     .s:fmt_bold   .s:fg_red    .s:bg_base02
exe "hi! DiffText"       .s:fmt_bold   .s:fg_blue   .s:bg_base02 .s:sp_blue
    else
exe "hi! DiffAdd"        .s:fmt_none   .s:fg_green  .s:bg_base02 .s:sp_green
exe "hi! DiffChange"     .s:fmt_none   .s:fg_yellow .s:bg_base02 .s:sp_yellow
exe "hi! DiffDelete"     .s:fmt_none   .s:fg_red    .s:bg_base02
exe "hi! DiffText"       .s:fmt_none   .s:fg_blue   .s:bg_base02 .s:sp_blue
    endif
endif
exe "hi! SignColumn"     .s:fmt_none   .s:fg_base0  .s:bg_base02
exe "hi! Conceal"        .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! SpellBad"       .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_red
exe "hi! SpellCap"       .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_violet
exe "hi! SpellRare"      .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_cyan
exe "hi! SpellLocal"     .s:fmt_curl   .s:fg_none   .s:bg_none    .s:sp_yellow
exe "hi! Pmenu"          .s:fmt_none   .s:fg_base0  .s:bg_base02  .s:fmt_revbb
exe "hi! PmenuSel"       .s:fmt_none   .s:fg_base01 .s:bg_base2   .s:fmt_revbb
exe "hi! PmenuSbar"      .s:fmt_none   .s:fg_base2  .s:bg_base0   .s:fmt_revbb
exe "hi! PmenuThumb"     .s:fmt_none   .s:fg_base0  .s:bg_base03  .s:fmt_revbb
exe "hi! TabLine"        .s:fmt_undr   .s:fg_base0  .s:bg_base02  .s:sp_base0
exe "hi! TabLineFill"    .s:fmt_undr   .s:fg_base0  .s:bg_base02  .s:sp_base0
exe "hi! TabLineSel"     .s:fmt_undr   .s:fg_base01 .s:bg_base2   .s:sp_base0  .s:fmt_revbbu
exe "hi! CursorColumn"   .s:fmt_none   .s:fg_none   .s:bg_base02
exe "hi! CursorLine"     .s:fmt_uopt   .s:fg_none   .s:bg_base02  .s:sp_base1
exe "hi! ColorColumn"    .s:fmt_none   .s:fg_none   .s:bg_base02
exe "hi! Cursor"         .s:fmt_none   .s:fg_base03 .s:bg_base0
hi! link lCursor Cursor
exe "hi! MatchParen"     .s:fmt_bold   .s:fg_red    .s:bg_base01

"}}}
" vim syntax highlighting "{{{
" ---------------------------------------------------------------------
hi! link vimVar Identifier
hi! link vimFunc Function
hi! link vimUserFunc Function
hi! link vimUsrCmd Function
hi! link helpSpecial Special
hi! link vimOper Normal
hi! link vimParenSep vimOper
hi! link vimFTCmd Keyword
hi! link vimNotFunc Keyword
hi! link vimCommand Keyword
hi! link vimAutoEvent Type
hi! link vimOption Type
hi! link vimSet Normal
hi! link vimSetEqual vimSet
hi! link vimSetSep vimSet
hi! link vimHiGroup Highlighted
hi! link vimHiAttrib Constant
hi! link vimCmdSep vimOper
hi! link vimSep vimOper
hi! link vimGroupName Identifier
hi! link vimSynType Type
hi! link vimHiGroup Normal
hi! link vimMapModKey Escape
exe "hi! helpExample"       .s:fmt_none    .s:fg_base01 .s:bg_none
exe "hi! helpOption"        .s:fmt_none    .s:fg_cyan   .s:bg_none
exe "hi! helpNote"          .s:fmt_none    .s:fg_magenta.s:bg_none
exe "hi! helpVim"           .s:fmt_none    .s:fg_magenta.s:bg_none
exe "hi! helpHyperTextJump" .s:fmt_undr    .s:fg_blue   .s:bg_none
exe "hi! helpHyperTextEntry".s:fmt_none    .s:fg_green  .s:bg_none
"}}}
" diff highlighting "{{{
" ---------------------------------------------------------------------
hi! link diffAdded Statement
hi! link diffLine Highlighted
hi! link diffSubName diffLine
"}}}
" git & gitcommit highlighting "{{{
"git
"exe "hi! gitDateHeader"
"exe "hi! gitIdentityHeader"
"exe "hi! gitIdentityKeyword"
"exe "hi! gitNotesHeader"
"exe "hi! gitReflogHeader"
"exe "hi! gitKeyword"
"exe "hi! gitIdentity"
"exe "hi! gitEmailDelimiter"
"exe "hi! gitEmail"
"exe "hi! gitDate"
"exe "hi! gitMode"
"exe "hi! gitHashAbbrev"
"exe "hi! gitHash"
"exe "hi! gitReflogMiddle"
"exe "hi! gitReference"
"exe "hi! gitStage"
"exe "hi! gitType"
"exe "hi! gitDiffAdded"
"exe "hi! gitDiffRemoved"
"gitcommit
"exe "hi! gitcommitSummary"      
exe "hi! gitcommitComment"      .s:fmt_ital     .s:fg_base01    .s:bg_none
hi! link gitcommitUntracked gitcommitComment
hi! link gitcommitDiscarded gitcommitComment
hi! link gitcommitSelected  gitcommitComment
exe "hi! gitcommitUnmerged"     .s:fmt_bold     .s:fg_green     .s:bg_none
exe "hi! gitcommitOnBranch"     .s:fmt_bold     .s:fg_base01    .s:bg_none
exe "hi! gitcommitBranch"       .s:fmt_bold     .s:fg_magenta   .s:bg_none
hi! link gitcommitNoBranch gitcommitBranch
exe "hi! gitcommitDiscardedType".s:fmt_none     .s:fg_red       .s:bg_none
exe "hi! gitcommitSelectedType" .s:fmt_none     .s:fg_green     .s:bg_none
"exe "hi! gitcommitUnmergedType"
"exe "hi! gitcommitType"
"exe "hi! gitcommitNoChanges"
"exe "hi! gitcommitHeader"
exe "hi! gitcommitHeader"       .s:fmt_none     .s:fg_base01    .s:bg_none
exe "hi! gitcommitUntrackedFile".s:fmt_bold     .s:fg_cyan      .s:bg_none
exe "hi! gitcommitDiscardedFile".s:fmt_bold     .s:fg_red       .s:bg_none
exe "hi! gitcommitSelectedFile" .s:fmt_bold     .s:fg_green     .s:bg_none
exe "hi! gitcommitUnmergedFile" .s:fmt_bold     .s:fg_yellow    .s:bg_none
exe "hi! gitcommitFile"         .s:fmt_bold     .s:fg_base0     .s:bg_none
hi! link gitcommitDiscardedArrow gitcommitDiscardedFile
hi! link gitcommitSelectedArrow  gitcommitSelectedFile
hi! link gitcommitUnmergedArrow  gitcommitUnmergedFile
"exe "hi! gitcommitArrow"
"exe "hi! gitcommitOverflow"
"exe "hi! gitcommitBlank"
" }}}
" html/xml highlighting "{{{
" ---------------------------------------------------------------------
hi! link htmlArg Normal
hi! link htmlHead Normal
hi! link htmlTitle Normal
hi! link htmlH2 htmlTitle
hi! link htmlH3 htmlTitle
hi! link htmlH4 htmlTitle
hi! link htmlH5 htmlTitle
hi! link htmlH6 htmlTitle
hi! link htmlTagN Highlighted
hi! link htmlTagName Highlighted
hi! link htmlTag htmlTagN
hi! link htmlEndTag htmlTagN
hi! link htmlSpecialTagName Highlighted
hi! link xmlAttrib Normal
hi! link xmlTag Highlighted
hi! link xmlEndTag Highlighted
hi! link xmlTagN Normal
hi! link xmlTagName Highlighted
hi! link xmlProcessingDelim Highlighted
"}}}
" css highlighting "{{{
" ---------------------------------------------------------------------
hi! link cssPageMarginProp cssCommonAttr
hi! link cssTagName Keyword
hi! link cssIdentifier Identifier
hi! link cssAttrRegion Keyword
hi! link cssClassName cssIdentifier
hi! link cssClassNameDot cssClassName
hi! link cssPseudoClassId cssCommonAttr
hi! link cssPagePseudo cssCommonAttr
hi! link cssNoise Normal
hi! link cssAttrComma Normal
hi! link cssProp Normal
hi! link cssContentForPagedMediaProp Normal
hi! link cssLineboxProp Normal
hi! link cssMarqueeProp Normal
hi! link cssPagedMediaProp Normal
hi! link cssPrintProp Normal
hi! link cssRubyProp Normal
hi! link cssSpeechProp Normal
hi! link cssRenderProp Normal
hi! link cssAnimationProp Normal
hi! link cssBackgroundProp Normal
hi! link cssBorderProp Normal
hi! link cssBoxProp Normal
hi! link cssCascadeProp Normal
hi! link cssColorProp Normal
hi! link cssDimensionProp Normal
hi! link cssFlexibleBoxProp Normal
hi! link cssFontProp Normal
hi! link cssMultiColumnProp Normal
hi! link cssInteractProp Normal
hi! link cssGeneratedContentProp Normal
hi! link cssGridProp Normal
hi! link cssHyerlinkProp Normal
hi! link cssListProp Normal
hi! link cssPositioningProp Normal
hi! link cssTableProp Normal
hi! link cssTextProp Normal
hi! link cssTransformProp Normal
hi! link cssTransitionProp Normal
hi! link cssUIProp Normal
hi! link cssIEUIProp Normal
hi! link cssAuralProp Normal
hi! link cssMobileTextProp Normal
hi! link cssMediaProp Normal
hi! link cssPageProp Normal
hi! link cssFontDescriptorProp Normal
"}}}
" yaml highlighting "{{{
" ---------------------------------------------------------------------
hi! link yamlKeyValueDelimiter Normal
hi! link yamlBlockCollectionItemStart Normal
hi! link yamlPlainScalar Constant
"}}}
" cpp highlighting "{{{
" ---------------------------------------------------------------------
hi! link cppOperator Normal
"}}}
" cs highlighting "{{{
" ---------------------------------------------------------------------
hi! link csClassType Normal
hi! link csLogicSymbols Normal
hi! link csTypeOfStatement Normal
hi! link csIsType Normal
hi! link csOpSymbols Normal
hi! link csXmlTag xmlTag
"}}}
" rs highlighting "{{{
" ---------------------------------------------------------------------
hi! link rustAs Keyword
hi! link rustEnum Identifier
hi! link rustEnumVariant Identifier
hi! link rustTrait Identifier
hi! link rustLifetime StorageClass
hi! link rustDeriveTrait rustDerive
hi! link rustModPath Normal
hi! link rustModPathSep rustModPath
hi! link rustQuestionMark Keyword
hi! link rustOperator Normal
hi! link rustSelf Identifier
hi! link rustMacroVariable Identifier
hi! link rustInvalidBareKeyword Keyword
hi! link rustCommentLineDoc Comment
"}}}
" toml highlighting "{{{
" ---------------------------------------------------------------------
hi! link tomlTable PreProc
hi! link tomlTableArray tomlTable
"}}}
" cfg highlighting "{{{
" ---------------------------------------------------------------------
hi! link CfgSection PreProc
hi! link CfgOnOff Constant
"}}}
" perl highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! perlHereDoc"           .s:fg_base1  .s:bg_back   .s:fmt_none
hi! link perlFiledescRead Type
hi! link perlVarPlain Identifier
exe "hi! perlStatementFileDesc" .s:fg_cyan   .s:bg_back   .s:fmt_none
"}}}
" tex highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! texStatement"   . s:fg_cyan   .s:bg_back   .s:fmt_none
exe "hi! texMathZoneX"   . s:fg_yellow .s:bg_back   .s:fmt_none
exe "hi! texMathMatcher" . s:fg_yellow .s:bg_back   .s:fmt_none
exe "hi! texMathMatcher" . s:fg_yellow .s:bg_back   .s:fmt_none
exe "hi! texRefLabel"    . s:fg_yellow .s:bg_back   .s:fmt_none
"}}}
" ruby highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! rubyDefine"     . s:fg_base1  .s:bg_back   .s:fmt_bold
"rubyInclude
"rubySharpBang
"rubyAccess
"rubyPredefinedVariable
"rubyBoolean
"rubyClassVariable
"rubyBeginEnd
"rubyRepeatModifier
"hi! link rubyArrayDelimiter    Special  " [ , , ]
"rubyCurlyBlock  { , , }

"hi! link rubyClass             Keyword
"hi! link rubyModule            Keyword
"hi! link rubyKeyword           Keyword
"hi! link rubyOperator          Operator
"hi! link rubyIdentifier        Identifier
"hi! link rubyInstanceVariable  Identifier
"hi! link rubyGlobalVariable    Identifier
"hi! link rubyClassVariable     Identifier
"hi! link rubyConstant          Type
"}}}
" sh highlighting "{{{
" ---------------------------------------------------------------------
hi! link shWrapLineOperator Escape
hi! link shOption PreProc
hi! link shCommandSub None
hi! link shOperator Normal
hi! link shTestOpr shOperator
hi! link shQuote Constant
"}}}
" netrw highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! netrwDir"     .s:fmt_none   .s:fg_blue   .s:bg_none
exe "hi! netrwExe"     .s:fmt_none   .s:fg_green  .s:bg_none
exe "hi! netrwSymlink" .s:fmt_none   .s:fg_cyan   .s:bg_none
"}}}
" fugitive highlighting "{{{
" ---------------------------------------------------------------------
hi! link fugitiveSymbolicRef Highlighted
hi! link fugitiveHash Highlighted
"}}}
" json highlighting "{{{
" ---------------------------------------------------------------------
hi! link jsonFold Normal
hi! link jsonBraces Normal
hi! link jsonCommentError Comment
hi! link jsonKeyword Constant
hi! link jsonQuote Constant
"}}}
" cmake highlighting "{{{
" ---------------------------------------------------------------------
hi! link cmakeArguments Normal
hi! link cmakeCommand Keyword
hi! link cmakeGeneratorExpressions Keyword
hi! link cmakeProperty Normal
hi! link cmakeVariable Keyword
hi! link cmakeVariableValue Highlighted
hi! link cmakeKWadd_compile_options Normal
hi! link cmakeKWadd_custom_command Normal
hi! link cmakeKWadd_custom_target Normal
hi! link cmakeKWadd_definitions Normal
hi! link cmakeKWadd_dependencies Normal
hi! link cmakeKWadd_executable Normal
hi! link cmakeKWadd_library Normal
hi! link cmakeKWadd_subdirectory Normal
hi! link cmakeKWadd_test Normal
hi! link cmakeKWaux_source_directory Normal
hi! link cmakeKWbreak Normal
hi! link cmakeKWbuild_command Normal
hi! link cmakeKWcmake_host_system_information Normal
hi! link cmakeKWcmake_minimum_required Normal
hi! link cmakeKWcmake_policy Normal
hi! link cmakeKWconfigure_file Normal
hi! link cmakeKWcreate_test_sourcelist Normal
hi! link cmakeKWctest_coverage Normal
hi! link cmakeKWdefine_property Normal
hi! link cmakeKWelse Normal
hi! link cmakeKWelseif Normal
hi! link cmakeKWenable_language Normal
hi! link cmakeKWenable_testing Normal
hi! link cmakeKWendforeach Normal
hi! link cmakeKWendfunction Normal
hi! link cmakeKWendif Normal
hi! link cmakeKWendmacro Normal
hi! link cmakeKWendwhile Normal
hi! link cmakeKWexecute_process Normal
hi! link cmakeKWexport Normal
hi! link cmakeKWfile Normal
hi! link cmakeKWfind_file Normal
hi! link cmakeKWfind_library Normal
hi! link cmakeKWfind_package Normal
hi! link cmakeKWfind_path Normal
hi! link cmakeKWfind_program Normal
hi! link cmakeKWfltk_wrap_ui Normal
hi! link cmakeKWforeach Normal
hi! link cmakeKWfunction Normal
hi! link cmakeKWget_cmake_property Normal
hi! link cmakeKWget_directory_property Normal
hi! link cmakeKWget_filename_component Normal
hi! link cmakeKWget_property Normal
hi! link cmakeKWget_source_file_property Normal
hi! link cmakeKWget_target_property Normal
hi! link cmakeKWget_test_property Normal
hi! link cmakeKWif Normal
hi! link cmakeKWinclude Normal
hi! link cmakeKWinclude_directories Normal
hi! link cmakeKWinclude_external_msproject Normal
hi! link cmakeKWinclude_regular_expression Normal
hi! link cmakeKWinstall Normal
hi! link cmakeKWlink_directories Normal
hi! link cmakeKWlist Normal
hi! link cmakeKWload_cache Normal
hi! link cmakeKWload_command Normal
hi! link cmakeKWmacro Normal
hi! link cmakeKWmake_directory Normal
hi! link cmakeKWmark_as_advanced Normal
hi! link cmakeKWmath Normal
hi! link cmakeKWmessage Normal
hi! link cmakeKWoption Normal
hi! link cmakeKWproject Normal
hi! link cmakeKWqt_wrap_cpp Normal
hi! link cmakeKWqt_wrap_ui Normal
hi! link cmakeKWremove_definitions Normal
hi! link cmakeKWreturn Normal
hi! link cmakeKWseparate_arguments Normal
hi! link cmakeKWset Normal
hi! link cmakeKWset_directory_properties Normal
hi! link cmakeKWset_property Normal
hi! link cmakeKWset_source_files_properties Normal
hi! link cmakeKWset_target_properties Normal
hi! link cmakeKWset_tests_properties Normal
hi! link cmakeKWsite_name Normal
hi! link cmakeKWsource_group Normal
hi! link cmakeKWstring Normal
hi! link cmakeKWtarget_compile_definitions Normal
hi! link cmakeKWtarget_compile_options Normal
hi! link cmakeKWtarget_include_directories Normal
hi! link cmakeKWtarget_link_libraries Normal
hi! link cmakeKWtry_compile Normal
hi! link cmakeKWtry_run Normal
hi! link cmakeKWunset Normal
hi! link cmakeKWvariable_watch Normal
hi! link cmakeKWwhile Normal
hi! link cmakeKWwrite_file Normal
"}}}
" php highlighting "{{{
" ---------------------------------------------------------------------
hi! link phpVarSelector Normal
hi! link phpParent Normal
hi! link phpMemberSelector Normal
hi! link phpOperator Normal
hi! link phpDefine Keyword
hi! link phpStructure Keyword
hi! link phpDocTags Highlighted
hi! link phpRelation phpOperator
hi! link phpComparison phpOperator
"}}}
" javascript highlighting "{{{
" ---------------------------------------------------------------------
hi! link javaScriptIdentifier Keyword
hi! link javaScriptKeyword Keyword
hi! link javaScriptFunction Keyword
hi! link javaScriptNumber Constant
hi! link javaScriptReserved Type
hi! link javaScriptNull Constant
"}}}
" typescript highlighting "{{{
" ---------------------------------------------------------------------
hi! link typescriptDocNotation Highlighted
hi! link typescriptDocTags Highlighted
hi! link typescriptDocParamType Normal
hi! link typescriptModule Keyword
hi! link typescriptExport Keyword
hi! link typescriptKeyword Keyword
hi! link typescriptNewKeyword Keyword
hi! link typescriptVariable Keyword
hi! link typescriptEvent Normal
hi! link typescriptAnimationEvent typescriptEvent
hi! link typescriptCSSEvent typescriptEvent
hi! link typescriptDatabaseEvent typescriptEvent
hi! link typescriptDocumentEvent typescriptEvent
hi! link typescriptDOMMutationEvent typescriptEvent
hi! link typescriptDragEvent typescriptEvent
hi! link typescriptElementEvent typescriptEvent
hi! link typescriptFocusEvent typescriptEvent
hi! link typescriptFormEvent typescriptEvent
hi! link typescriptFrameEvent typescriptEvent
hi! link typescriptInputDeviceEvent typescriptEvent
hi! link typescriptMediaEvent typescriptEvent
hi! link typescriptMenuEvent typescriptEvent
hi! link typescriptNetworkEvent typescriptEvent
hi! link typescriptProgressEvent typescriptEvent
hi! link typescriptResourceEvent typescriptEvent
hi! link typescriptScriptEvent typescriptEvent
hi! link typescriptSensorEvent typescriptEvent
hi! link typescriptSessionHistoryEvent typescriptEvent
hi! link typescriptStorageEvent typescriptEvent
hi! link typescriptSVGEvent typescriptEvent
hi! link typescriptTabEvent typescriptEvent
hi! link typescriptTextEvent typescriptEvent
hi! link typescriptTouchEvent typescriptEvent
hi! link typescriptUpdateEvent typescriptEvent
hi! link typescriptValueChangeEvent typescriptEvent
hi! link typescriptViewEvent typescriptEvent
hi! link typescriptWebsocketEvent typescriptEvent
hi! link typescriptWindowEvent typescriptEvent
hi! link typescriptUncategorizedEvent typescriptEvent
hi! link typescriptServiceWorkerEvent typescriptEvent
hi! link typescriptPrototype Normal
hi! link typescriptIdentifier Normal
hi! link typescriptGlobal Normal
hi! link typescriptDocNamedParamType Normal
hi! link typescriptDocParamName Normal
hi! link typescriptGlobalMethod Normal
hi! link typescriptNodeGlobal Normal
hi! link typescriptBOM Normal
hi! link typescriptBOMWindowProp Normal
hi! link typescriptBOMWindowMethod Normal
hi! link typescriptBOMWindowCons Normal
hi! link typescriptXHRGlobal Normal
hi! link typescriptCryptoGlobal Normal
hi! link typescriptEncodingGlobal Normal
hi! link typescriptDOMEventCons Normal
hi! link typescriptArrowFunc Normal
hi! link typescriptDestructureVariable Normal
hi! link typescriptRef Normal
hi! link typescriptOptionalMark Normal
hi! link typescriptCall Normal
hi! link typescriptArrowFuncArg Normal
hi! link typescriptParamImpl Normal
hi! link typescriptFuncArg Normal
hi! link typescriptFuncComma Normal
hi! link typescriptNumberStaticProp Normal
hi! link typescriptNumberStaticMethod Normal
hi! link typescriptNumberMethod Normal
hi! link typescriptStringStaticMethod Normal
hi! link typescriptStringMethod Normal
hi! link typescriptArrayStaticMethod Normal
hi! link typescriptArrayMethod Normal
hi! link typescriptObjectStaticMethod Normal
hi! link typescriptObjectMethod Normal
hi! link typescriptSymbolStaticProp Normal
hi! link typescriptSymbolStaticMethod Normal
hi! link typescriptFunctionMethod Normal
hi! link typescriptMathStaticProp Normal
hi! link typescriptMathStaticMethod Normal
hi! link typescriptDateStaticMethod Normal
hi! link typescriptDateMethod Normal
hi! link typescriptJSONStaticMethod Normal
hi! link typescriptRegExpStaticProp Normal
hi! link typescriptRegExpProp Normal
hi! link typescriptRegExpMethod Normal
hi! link typescriptES6MapProp Normal
hi! link typescriptES6MapMethod Normal
hi! link typescriptES6SetProp Normal
hi! link typescriptES6SetMethod Normal
hi! link typescriptProxyAPI Normal
hi! link typescriptPromiseStaticMethod Normal
hi! link typescriptPromiseMethod Normal
hi! link typescriptReflectMethod Normal
hi! link typescriptIntlMethod Normal
hi! link typescriptBOMWindowEvent Normal
hi! link typescriptBOMNavigatorProp Normal
hi! link typescriptBOMNavigatorMethod Normal
hi! link typescriptServiceWorkerMethod Normal
hi! link typescriptBOMLocationProp Normal
hi! link typescriptBOMLocationMethod Normal
hi! link typescriptBOMHistoryProp Normal
hi! link typescriptBOMHistoryMethod Normal
hi! link typescriptConsoleMethod Normal
hi! link typescriptXHRProp Normal
hi! link typescriptXHRMethod Normal
hi! link typescriptURLStaticMethod Normal
hi! link typescriptFileMethod Normal
hi! link typescriptFileReaderProp Normal
hi! link typescriptFileReaderMethod Normal
hi! link typescriptFileListMethod Normal
hi! link typescriptBlobMethod Normal
hi! link typescriptURLUtilsProp Normal
hi! link typescriptSubtleCryptoMethod Normal
hi! link typescriptCryptoProp Normal
hi! link typescriptCryptoMethod Normal
hi! link typescriptHeadersMethod Normal
hi! link typescriptRequestProp Normal
hi! link typescriptRequestMethod Normal
hi! link typescriptResponseProp Normal
hi! link typescriptResponseMethod Normal
hi! link typescriptServiceWorkerProp Normal
hi! link typescriptCacheMethod Normal
hi! link typescriptEncodingProp Normal
hi! link typescriptEncodingMethod Normal
hi! link typescriptGeolocationMethod Normal
hi! link typescriptBOMNetworkProp Normal
hi! link typescriptPaymentMethod Normal
hi! link typescriptPaymentProp Normal
hi! link typescriptPaymentEvent Normal
hi! link typescriptPaymentResponseMethod Normal
hi! link typescriptPaymentResponseProp Normal
hi! link typescriptPaymentAddressProp Normal
hi! link typescriptPaymentShippingOptionProp Normal
hi! link typescriptDOMNodeProp Normal
hi! link typescriptDOMNodeMethod Normal
hi! link typescriptDOMNodeType Normal
hi! link typescriptDOMElemAttrs Normal
hi! link typescriptDOMElemFuncs Normal
hi! link typescriptDOMDocProp Normal
hi! link typescriptDOMDocMethod Normal
hi! link typescriptDOMEventTargetMethod Normal
hi! link typescriptDOMEventProp Normal
hi! link typescriptDOMEventMethod Normal
hi! link typescriptDOMStorage Normal
hi! link typescriptDOMStorageProp Normal
hi! link typescriptDOMStorageMethod Normal
hi! link typescriptDOMFormProp Normal
hi! link typescriptDOMFormMethod Normal
hi! link typescriptConstructor Normal
hi! link typescriptMethodAccessor Normal
hi! link typescriptAsyncFunc Normal
hi! link typescriptEndColons Normal
hi! link typescriptConstraint Normal
hi! link typescriptUnion Normal
hi! link typescriptTypeQuery Normal
hi! link typescriptAssertType Normal
hi! link typescriptUserDefinedType Normal
hi! link typescriptTupleLable Normal
"}}}
" python highlighting "{{{
" ---------------------------------------------------------------------
hi! link pythonExceptions Normal
hi! link pythonDecoratorName pythonDecorator
hi! link pythonBuiltin Normal
hi! link pythonNone Constant
hi! link pythonBoolean Constant
hi! link pythonDoctest PreProc
hi! link pythonDoctestValue PreProc
"}}}
" dosini highlighting "{{{
" ---------------------------------------------------------------------
hi! link dosiniLabel Normal
hi! link dosiniHeader PreProc
"}}}
" dosbatch highlighting "{{{
" ---------------------------------------------------------------------
hi! link dosbatchArgument PreProc
hi! link dosbatchImplicit Keyword
hi! link dosbatchAt Keyword
hi! link dosbatchVariable PreProc
hi! link dosbatchSwitch PreProc
hi! link dosbatchOperator Normal
hi! link dosbatchLabel Normal
"}}}
" go highlighting "{{{
" ---------------------------------------------------------------------
hi! link goConstants Constant
"}}}
" lua highlighting "{{{
" ---------------------------------------------------------------------
hi! link luaTable Normal
hi! link luaFunction Keyword
"}}}
" markdown highlighting "{{{
" ---------------------------------------------------------------------
exe "hi! markdownUrl"        .s:fmt_undr   .s:fg_blue   .s:bg_none
exe "hi! markdownItalic"     .s:fmt_ital   .s:fg_none   .s:bg_none
exe "hi! markdownBold"       .s:fmt_bold   .s:fg_none   .s:bg_none
exe "hi! markdownBoldItalic" .s:fmt_bldi   .s:fg_none   .s:bg_none
hi! link markdownAutomaticLink markdownUrl
hi! link markdownUrlDelimiter markdownAutomaticLink
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownH2Delimiter markdownH2
hi! link markdownH3Delimiter markdownH3
hi! link markdownH4Delimiter markdownH4
hi! link markdownH5Delimiter markdownH5
hi! link markdownH6Delimiter markdownH6
hi! link markdownLinkText Normal
hi! link markdownIdDeclaration Normal
hi! link markdownCode Comment
hi! link markdownCodeDelimiter markdownCode
hi! link markdownCodeBlock markdownCode
"}}}
" haskell syntax highlighting"{{{
" ---------------------------------------------------------------------
" For use with syntax/haskell.vim : Haskell Syntax File
" http://www.vim.org/scripts/script.php?script_id=3034
" See also Steffen Siering's github repository:
" http://github.com/urso/dotrc/blob/master/vim/syntax/haskell.vim
" ---------------------------------------------------------------------
"
" Treat True and False specially, see the plugin referenced above
let hs_highlight_boolean=1
" highlight delims, see the plugin referenced above
let hs_highlight_delimiters=1

exe "hi! cPreCondit". s:fg_orange.s:bg_none   .s:fmt_none

exe "hi! VarId"    . s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! ConId"    . s:fg_yellow .s:bg_none   .s:fmt_none
exe "hi! hsImport" . s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! hsString" . s:fg_base00 .s:bg_none   .s:fmt_none

exe "hi! hsStructure"        . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hs_hlFunctionName"  . s:fg_blue   .s:bg_none
exe "hi! hsStatement"        . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hsImportLabel"      . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hs_OpFunctionName"  . s:fg_yellow .s:bg_none   .s:fmt_none
exe "hi! hs_DeclareFunction" . s:fg_orange .s:bg_none   .s:fmt_none
exe "hi! hsVarSym"           . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hsType"             . s:fg_yellow .s:bg_none   .s:fmt_none
exe "hi! hsTypedef"          . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hsModuleName"       . s:fg_green  .s:bg_none   .s:fmt_undr
exe "hi! hsModuleStartLabel" . s:fg_magenta.s:bg_none   .s:fmt_none
hi! link hsImportParams      Delimiter
hi! link hsDelimTypeExport   Delimiter
hi! link hsModuleStartLabel  hsStructure
hi! link hsModuleWhereLabel  hsModuleStartLabel

" following is for the haskell-conceal plugin
" the first two items don't have an impact, but better safe
exe "hi! hsNiceOperator"     . s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! hsniceoperator"     . s:fg_cyan   .s:bg_none   .s:fmt_none

"}}}
" pandoc markdown syntax highlighting "{{{
" ---------------------------------------------------------------------

"PandocHiLink pandocNormalBlock
exe "hi! pandocTitleBlock"               .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocTitleBlockTitle"          .s:fg_blue   .s:bg_none   .s:fmt_bold
exe "hi! pandocTitleComment"             .s:fg_blue   .s:bg_none   .s:fmt_bold
exe "hi! pandocComment"                  .s:fg_base01 .s:bg_none   .s:fmt_ital
exe "hi! pandocVerbatimBlock"            .s:fg_yellow .s:bg_none   .s:fmt_none
hi! link pandocVerbatimBlockDeep         pandocVerbatimBlock
hi! link pandocCodeBlock                 pandocVerbatimBlock
hi! link pandocCodeBlockDelim            pandocVerbatimBlock
exe "hi! pandocBlockQuote"               .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader1"        .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader2"        .s:fg_cyan   .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader3"        .s:fg_yellow .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader4"        .s:fg_red    .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader5"        .s:fg_base0  .s:bg_none   .s:fmt_none
exe "hi! pandocBlockQuoteLeader6"        .s:fg_base01 .s:bg_none   .s:fmt_none
exe "hi! pandocListMarker"               .s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! pandocListReference"            .s:fg_magenta.s:bg_none   .s:fmt_undr

" Definitions
" ---------------------------------------------------------------------
let s:fg_pdef = s:fg_violet
exe "hi! pandocDefinitionBlock"              .s:fg_pdef  .s:bg_none  .s:fmt_none
exe "hi! pandocDefinitionTerm"               .s:fg_pdef  .s:bg_none  .s:fmt_stnd
exe "hi! pandocDefinitionIndctr"             .s:fg_pdef  .s:bg_none  .s:fmt_bold
exe "hi! pandocEmphasisDefinition"           .s:fg_pdef  .s:bg_none  .s:fmt_ital
exe "hi! pandocEmphasisNestedDefinition"     .s:fg_pdef  .s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasisDefinition"     .s:fg_pdef  .s:bg_none  .s:fmt_bold
exe "hi! pandocStrongEmphasisNestedDefinition"   .s:fg_pdef.s:bg_none.s:fmt_bldi
exe "hi! pandocStrongEmphasisEmphasisDefinition" .s:fg_pdef.s:bg_none.s:fmt_bldi
exe "hi! pandocStrikeoutDefinition"          .s:fg_pdef  .s:bg_none  .s:fmt_revr
exe "hi! pandocVerbatimInlineDefinition"     .s:fg_pdef  .s:bg_none  .s:fmt_none
exe "hi! pandocSuperscriptDefinition"        .s:fg_pdef  .s:bg_none  .s:fmt_none
exe "hi! pandocSubscriptDefinition"          .s:fg_pdef  .s:bg_none  .s:fmt_none

" Tables
" ---------------------------------------------------------------------
let s:fg_ptable = s:fg_blue
exe "hi! pandocTable"                        .s:fg_ptable.s:bg_none  .s:fmt_none
exe "hi! pandocTableStructure"               .s:fg_ptable.s:bg_none  .s:fmt_none
hi! link pandocTableStructureTop             pandocTableStructre
hi! link pandocTableStructureEnd             pandocTableStructre
exe "hi! pandocTableZebraLight"              .s:fg_ptable.s:bg_base03.s:fmt_none
exe "hi! pandocTableZebraDark"               .s:fg_ptable.s:bg_base02.s:fmt_none
exe "hi! pandocEmphasisTable"                .s:fg_ptable.s:bg_none  .s:fmt_ital
exe "hi! pandocEmphasisNestedTable"          .s:fg_ptable.s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasisTable"          .s:fg_ptable.s:bg_none  .s:fmt_bold
exe "hi! pandocStrongEmphasisNestedTable"    .s:fg_ptable.s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasisEmphasisTable"  .s:fg_ptable.s:bg_none  .s:fmt_bldi
exe "hi! pandocStrikeoutTable"               .s:fg_ptable.s:bg_none  .s:fmt_revr
exe "hi! pandocVerbatimInlineTable"          .s:fg_ptable.s:bg_none  .s:fmt_none
exe "hi! pandocSuperscriptTable"             .s:fg_ptable.s:bg_none  .s:fmt_none
exe "hi! pandocSubscriptTable"               .s:fg_ptable.s:bg_none  .s:fmt_none

" Headings
" ---------------------------------------------------------------------
let s:fg_phead = s:fg_orange
exe "hi! pandocHeading"                      .s:fg_phead .s:bg_none.s:fmt_bold
exe "hi! pandocHeadingMarker"                .s:fg_yellow.s:bg_none.s:fmt_bold
exe "hi! pandocEmphasisHeading"              .s:fg_phead .s:bg_none.s:fmt_bldi
exe "hi! pandocEmphasisNestedHeading"        .s:fg_phead .s:bg_none.s:fmt_bldi
exe "hi! pandocStrongEmphasisHeading"        .s:fg_phead .s:bg_none.s:fmt_bold
exe "hi! pandocStrongEmphasisNestedHeading"  .s:fg_phead .s:bg_none.s:fmt_bldi
exe "hi! pandocStrongEmphasisEmphasisHeading".s:fg_phead .s:bg_none.s:fmt_bldi
exe "hi! pandocStrikeoutHeading"             .s:fg_phead .s:bg_none.s:fmt_revr
exe "hi! pandocVerbatimInlineHeading"        .s:fg_phead .s:bg_none.s:fmt_bold
exe "hi! pandocSuperscriptHeading"           .s:fg_phead .s:bg_none.s:fmt_bold
exe "hi! pandocSubscriptHeading"             .s:fg_phead .s:bg_none.s:fmt_bold

" Links
" ---------------------------------------------------------------------
exe "hi! pandocLinkDelim"                .s:fg_base01 .s:bg_none   .s:fmt_none
exe "hi! pandocLinkLabel"                .s:fg_blue   .s:bg_none   .s:fmt_undr
exe "hi! pandocLinkText"                 .s:fg_blue   .s:bg_none   .s:fmt_undb
exe "hi! pandocLinkURL"                  .s:fg_base00 .s:bg_none   .s:fmt_undr
exe "hi! pandocLinkTitle"                .s:fg_base00 .s:bg_none   .s:fmt_undi
exe "hi! pandocLinkTitleDelim"           .s:fg_base01 .s:bg_none   .s:fmt_undi   .s:sp_base00
exe "hi! pandocLinkDefinition"           .s:fg_cyan   .s:bg_none   .s:fmt_undr   .s:sp_base00
exe "hi! pandocLinkDefinitionID"         .s:fg_blue   .s:bg_none   .s:fmt_bold
exe "hi! pandocImageCaption"             .s:fg_violet .s:bg_none   .s:fmt_undb
exe "hi! pandocFootnoteLink"             .s:fg_green  .s:bg_none   .s:fmt_undr
exe "hi! pandocFootnoteDefLink"          .s:fg_green  .s:bg_none   .s:fmt_bold
exe "hi! pandocFootnoteInline"           .s:fg_green  .s:bg_none   .s:fmt_undb
exe "hi! pandocFootnote"                 .s:fg_green  .s:bg_none   .s:fmt_none
exe "hi! pandocCitationDelim"            .s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! pandocCitation"                 .s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! pandocCitationID"               .s:fg_magenta.s:bg_none   .s:fmt_undr
exe "hi! pandocCitationRef"              .s:fg_magenta.s:bg_none   .s:fmt_none

" Main Styles
" ---------------------------------------------------------------------
exe "hi! pandocStyleDelim"               .s:fg_base01 .s:bg_none  .s:fmt_none
exe "hi! pandocEmphasis"                 .s:fg_base0  .s:bg_none  .s:fmt_ital
exe "hi! pandocEmphasisNested"           .s:fg_base0  .s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasis"           .s:fg_base0  .s:bg_none  .s:fmt_bold
exe "hi! pandocStrongEmphasisNested"     .s:fg_base0  .s:bg_none  .s:fmt_bldi
exe "hi! pandocStrongEmphasisEmphasis"   .s:fg_base0  .s:bg_none  .s:fmt_bldi
exe "hi! pandocStrikeout"                .s:fg_base01 .s:bg_none  .s:fmt_revr
exe "hi! pandocVerbatimInline"           .s:fg_yellow .s:bg_none  .s:fmt_none
exe "hi! pandocSuperscript"              .s:fg_violet .s:bg_none  .s:fmt_none
exe "hi! pandocSubscript"                .s:fg_violet .s:bg_none  .s:fmt_none

exe "hi! pandocRule"                     .s:fg_blue   .s:bg_none  .s:fmt_bold
exe "hi! pandocRuleLine"                 .s:fg_blue   .s:bg_none  .s:fmt_bold
exe "hi! pandocEscapePair"               .s:fg_red    .s:bg_none  .s:fmt_bold
exe "hi! pandocCitationRef"              .s:fg_magenta.s:bg_none   .s:fmt_none
exe "hi! pandocNonBreakingSpace"         . s:fg_red   .s:bg_none  .s:fmt_revr
hi! link pandocEscapedCharacter          pandocEscapePair
hi! link pandocLineBreak                 pandocEscapePair

" Embedded Code
" ---------------------------------------------------------------------
exe "hi! pandocMetadataDelim"            .s:fg_base01 .s:bg_none   .s:fmt_none
exe "hi! pandocMetadata"                 .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocMetadataKey"              .s:fg_blue   .s:bg_none   .s:fmt_none
exe "hi! pandocMetadata"                 .s:fg_blue   .s:bg_none   .s:fmt_bold
hi! link pandocMetadataTitle             pandocMetadata

"}}}
" nvim-treesitter highlighting "{{{
hi! link @boolean           Boolean
hi! link @character         Character
hi! link @character.special SpecialChar
hi! link @comment           Comment
hi! link @conditional       Conditional
hi! link @constant          NONE
hi! link @constant.builtin  NONE
hi! link @constant.macro    Define
hi! link @constructor       NONE
hi! link @debug             Debug
hi! link @define            Define
hi! link @exception         Exception
hi! link @field             Identifier
hi! link @float             Float
hi! link @function          NONE
hi! link @function.builtin  NONE
hi! link @function.macro    PreProc
hi! link @include           Include
hi! link @keyword           Keyword
hi! link @label             Label
hi! link @macro             Macro
hi! link @method            Function
hi! link @namespace         NONE
hi! link @number            Number
hi! link @operator          NONE
hi! link @parameter         Identifier
hi! link @preproc           PreProc
hi! link @property          Identifier
hi! link @punctuation       NONE
hi! link @punctuation.bracket NONE
hi! link @punctuation.special PreProc
hi! link @repeat            Repeat
hi! link @storageclass      StorageClass
hi! link @string            String
hi! link @string.escape     SpecialChar
hi! link @string.special    SpecialChar
hi! link @structure         Structure
hi! link @tag               Tag
hi! link @text.literal      Comment
hi! link @text.reference    Identifier
hi! link @text.title        Title
hi! link @text.todo         Todo
hi! link @text.underline    Underlined
hi! link @text.uri          Underlined
hi! link @type              NONE
hi! link @type.builtin      Type
hi! link @type.definition   Typedef
hi! link @type.qualifier    Type
hi! link @variable          NONE

" Bash.
hi! link @constant.bash     PreProc
hi! link @function.builtin.bash Keyword
hi! link @preproc.bash      Comment
hi! link @variable.bash     PreProc
hi! link @punctuation.special.bash Preproc

" C++.
hi! link @conditional.ternary.cpp NONE
hi! link @variable.builtin.cpp Keyword

" Python.
hi! link @punctuation.bracket.python Identifier
hi! link @punctuation.special.python Identifier

" Context.
exe "hi! TreesitterContext"  .s:fg_none   .s:bg_base02   .s:fmt_none
"}}}
" Utility autocommand "{{{
" ---------------------------------------------------------------------
" In cases where Solarized is initialized inside a terminal vim session and 
" then transferred to a gui session via the command `:gui`, the gui vim process 
" does not re-read the colorscheme (or .vimrc for that matter) so any `has_gui` 
" related code that sets gui specific values isn't executed.
"
" Currently, Solarized sets only the cterm or gui values for the colorscheme 
" depending on gui or terminal mode. It's possible that, if the following 
" autocommand method is deemed excessively poor form, that approach will be 
" used again and the autocommand below will be dropped.
"
" However it seems relatively benign in this case to include the autocommand 
" here. It fires only in cases where vim is transferring from terminal to gui 
" mode (detected with the script scope s:vmode variable). It also allows for 
" other potential terminal customizations that might make gui mode suboptimal.
"
autocmd GUIEnter * if (s:vmode != "gui") | exe "colorscheme " . g:colors_name | endif
"}}}
" Highlight Trailing Space {{{
" Experimental: Different highlight when on cursorline
function! s:SolarizedHiTrail()
    if g:solarized_hitrail==0
        hi! clear solarizedTrailingSpace
    else
        syn match solarizedTrailingSpace "\s*$"
        exe "hi! solarizedTrailingSpace " .s:fmt_undr .s:fg_red .s:bg_none .s:sp_red
    endif
endfunction  
augroup SolarizedHiTrail
    autocmd!
    if g:solarized_hitrail==1
        autocmd! Syntax * call s:SolarizedHiTrail()
        autocmd! ColorScheme * if g:colors_name == "solarized" | call s:SolarizedHiTrail() | else | augroup! s:SolarizedHiTrail | endif
    endif
augroup END
" }}}
" Menus "{{{
" ---------------------------------------------------------------------
" Turn off Solarized menu by including the following assignment in your .vimrc:
"
"    let g:solarized_menu=0

function! s:SolarizedOptions()
    new "new buffer
    setf vim "vim filetype
    let failed = append(0, s:defaults_list)
    let failed = append(0, s:colorscheme_list)
    let failed = append(0, s:options_list)
    let failed = append(0, s:lazycat_list)
    0 "jump back to the top
endfunction
if !exists(":SolarizedOptions")
    command SolarizedOptions :call s:SolarizedOptions()
endif

function! SolarizedMenu()
    if exists("g:loaded_solarized_menu")
        try
            silent! aunmenu Solarized
        endtry
    endif
    let g:loaded_solarized_menu = 1

    if g:colors_name == "solarized" && g:solarized_menu != 0

        amenu &Solarized.&Contrast.&Low\ Contrast        :let g:solarized_contrast="low"       \| colorscheme solarized<CR>
        amenu &Solarized.&Contrast.&Normal\ Contrast     :let g:solarized_contrast="normal"    \| colorscheme solarized<CR>
        amenu &Solarized.&Contrast.&High\ Contrast       :let g:solarized_contrast="high"      \| colorscheme solarized<CR>
        an    &Solarized.&Contrast.-sep-                 <Nop>
        amenu &Solarized.&Contrast.&Help:\ Contrast      :help 'solarized_contrast'<CR>

        amenu &Solarized.&Visibility.&Low\ Visibility    :let g:solarized_visibility="low"     \| colorscheme solarized<CR>
        amenu &Solarized.&Visibility.&Normal\ Visibility :let g:solarized_visibility="normal"  \| colorscheme solarized<CR>
        amenu &Solarized.&Visibility.&High\ Visibility   :let g:solarized_visibility="high"    \| colorscheme solarized<CR>
        an    &Solarized.&Visibility.-sep-                 <Nop>
        amenu &Solarized.&Visibility.&Help:\ Visibility    :help 'solarized_visibility'<CR>

        amenu &Solarized.&Background.&Toggle\ Background :ToggleBG<CR>
        amenu &Solarized.&Background.&Dark\ Background   :set background=dark  \| colorscheme solarized<CR>
        amenu &Solarized.&Background.&Light\ Background  :set background=light \| colorscheme solarized<CR>
        an    &Solarized.&Background.-sep-               <Nop>
        amenu &Solarized.&Background.&Help:\ ToggleBG     :help togglebg<CR>

        if g:solarized_bold==0 | let l:boldswitch="On" | else | let l:boldswitch="Off" | endif
        exe "amenu &Solarized.&Styling.&Turn\\ Bold\\ ".l:boldswitch." :let g:solarized_bold=(abs(g:solarized_bold-1)) \\| colorscheme solarized<CR>"
        if g:solarized_italic==0 | let l:italicswitch="On" | else | let l:italicswitch="Off" | endif
        exe "amenu &Solarized.&Styling.&Turn\\ Italic\\ ".l:italicswitch." :let g:solarized_italic=(abs(g:solarized_italic-1)) \\| colorscheme solarized<CR>"
        if g:solarized_underline==0 | let l:underlineswitch="On" | else | let l:underlineswitch="Off" | endif
        exe "amenu &Solarized.&Styling.&Turn\\ Underline\\ ".l:underlineswitch." :let g:solarized_underline=(abs(g:solarized_underline-1)) \\| colorscheme solarized<CR>"

        amenu &Solarized.&Diff\ Mode.&Low\ Diff\ Mode    :let g:solarized_diffmode="low"     \| colorscheme solarized<CR>
        amenu &Solarized.&Diff\ Mode.&Normal\ Diff\ Mode :let g:solarized_diffmode="normal"  \| colorscheme solarized<CR>
        amenu &Solarized.&Diff\ Mode.&High\ Diff\ Mode   :let g:solarized_diffmode="high"    \| colorscheme solarized<CR>

        if g:solarized_hitrail==0 | let l:hitrailswitch="On" | else | let l:hitrailswitch="Off" | endif
        exe "amenu &Solarized.&Experimental.&Turn\\ Highlight\\ Trailing\\ Spaces\\ ".l:hitrailswitch." :let g:solarized_hitrail=(abs(g:solarized_hitrail-1)) \\| colorscheme solarized<CR>"
        an    &Solarized.&Experimental.-sep-               <Nop>
        amenu &Solarized.&Experimental.&Help:\ HiTrail    :help 'solarized_hitrail'<CR>

        an    &Solarized.-sep1-                          <Nop>

        amenu &Solarized.&Autogenerate\ options          :SolarizedOptions<CR>

        an    &Solarized.-sep2-                          <Nop>

        amenu &Solarized.&Help.&Solarized\ Help          :help solarized<CR>
        amenu &Solarized.&Help.&Toggle\ Background\ Help :help togglebg<CR>
        amenu &Solarized.&Help.&Removing\ This\ Menu     :help solarized-menu<CR>

        an 9999.77 &Help.&Solarized\ Colorscheme         :help solarized<CR>
        an 9999.78 &Help.&Toggle\ Background             :help togglebg<CR>
        an 9999.79 &Help.-sep3-                          <Nop>

    endif
endfunction

autocmd ColorScheme * if g:colors_name != "solarized" | silent! aunmenu Solarized | else | call SolarizedMenu() | endif

"}}}
" License "{{{
" ---------------------------------------------------------------------
"
" Copyright (c) 2011 Ethan Schoonover
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
"
" vim:foldmethod=marker:foldlevel=0
"}}}
