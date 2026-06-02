local system = require 'pandoc.system'

local doc_template = [[
\documentclass{standalone}
\usepackage{bookgraphics} % Local package with my own macro definitions used in tikz diagrams
\begin{document}
%s
\end{document}
]]

local function tex2image(src, filetype, outfile)
    local f = io.open('tex-temp.tex', 'w')
    f:write(doc_template:format(src))
    f:close()
    local _, _, status = os.execute('lualatex -pdflua -auxdir=textmp -interaction=nonstopmode -halt-on-error -shell-escape tex-temp.tex')
    if status ~= 0 then
      os.exit(1)
    end
    if filetype == 'pdf' then
        os.rename('tex-temp.pdf', outfile)
     else
        os.execute('pdf2svg tex-temp.pdf ' .. outfile)
    end
end

extension_for = {
  html = 'svg',
  html4 = 'svg',
  html5 = 'svg',
  latex = 'pdf',
  beamer = 'pdf' }

local function file_exists(name)
  local f = io.open(name, 'r')
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

function RawBlock(el)
  if el.format == 'latex' and
    (el.text:match("^\\begin%{tikz") or el.text:match("^%$")) then
    local filetype = extension_for[FORMAT] or 'svg'
    local fbasename = pandoc.sha1(el.text) .. '.' .. filetype
    if not pandoc.mediabag.lookup(fbasename) then
      local outname = "tex-temp." .. filetype
      tex2image(el.text, filetype, outname)
      local mt, contents = pandoc.mediabag.fetch(outname)
      pandoc.mediabag.insert(fbasename, mt, contents)
    end
    return pandoc.Para({pandoc.Image({}, fbasename)})
  else
   return el
  end
end