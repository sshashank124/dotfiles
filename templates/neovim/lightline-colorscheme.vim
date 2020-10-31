" Common colors
let s:blue   = [ '#{{ colors.blue }}', 4 ]
let s:green  = [ '#{{ colors.green }}', 2 ]
let s:purple = [ '#{{ colors.magenta }}', 5 ]
let s:red    = [ '#{{ colors.red }}', 1 ]
let s:yellow = [ '#{{ colors.yellow }}', 3 ]
let s:gray1 = [ '#{{ colors.bg.2 }}', 8 ]
let s:gray2 = [ '#{{ colors.white }}', 7 ]
let s:gray3 = [ '#{{ colors.black }}', 0 ]

let s:bg    = [ '#{{ colors.black }}', 0 ]
let s:fg    = [ '#{{ colors.white }}', 7 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.inactive.left   = [ [ s:gray2,  s:bg ], [ s:gray2, s:bg ] ]
let s:p.inactive.middle = [ [ s:gray2, s:gray1 ] ]
let s:p.inactive.right  = [ [ s:gray2, s:bg ] ]

" Common
let s:p.normal.left    = [ [ s:bg, s:green, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.normal.middle  = [ [ s:fg, s:gray1 ] ]
let s:p.normal.right   = [ [ s:bg, s:green, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.normal.error   = [ [ s:red, s:bg ] ]
let s:p.normal.warning = [ [ s:yellow, s:bg ] ]
let s:p.insert.right   = [ [ s:bg, s:blue, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.insert.left    = [ [ s:bg, s:blue, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.replace.right  = [ [ s:bg, s:red, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.replace.left   = [ [ s:bg, s:red, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.visual.right   = [ [ s:bg, s:purple, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.visual.left    = [ [ s:bg, s:purple, 'bold' ], [ s:fg, s:gray3 ] ]
let s:p.tabline.left   = [ [ s:fg, s:gray3 ] ]
let s:p.tabline.tabsel = [ [ s:bg, s:purple, 'bold' ] ]
let s:p.tabline.middle = [ [ s:gray3, s:gray1 ] ]
let s:p.tabline.right  = copy(s:p.normal.right)

let g:lightline#colorscheme#system#palette = lightline#colorscheme#flatten(s:p)
