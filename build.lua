-- Build script for tkz-euclide

module = "tkz-euclide"

tkzeuclidev = "3.06c"
tkzeuclided = "2020/04/06"
doctkzeuclv = tkzeuclidev -- Same as "3.06c"
doctkzeucld = tkzeuclided -- Same as "2020/04/06"

-- Setting variables for .zip file (CTAN)
textfiles  = {"README.md"}
ctanreadme = "README.md"
ctanpkg    = module
ctanzip    = ctanpkg.."-"..tkzeuclidev
packtdszip = false
flatten    = false
cleanfiles = {ctanzip..".curlopt", ctanzip..".zip"}

-- Creation of simplified structure for CTAN
local function make_ctan_tree()
  if direxists("code") then
    cleandir("code")
    cp("*.*", "latex", "code")
  else
    errorlevel = (mkdir("code") + cp("*.*", "latex", "code"))
    if errorlevel ~= 0 then
      error("** Error!!: Can't copy files from ./latex to ./code")
      return errorlevel
    end
  end
  if direxists("doc/examples") then
    cleandir("doc/examples")
    cp("*.*", "examples", "doc/examples")
  else
    errorlevel = (mkdir("doc/examples") + cp("*.*", "examples", "doc/examples"))
    if errorlevel ~= 0 then
      error("** Error!!: Can't copy files from ./examples to ./doc/examples")
      return errorlevel
    end
  end
  if direxists("doc/sourcedoc") then
    cleandir("doc/sourcedoc")
    cp("*.*", "doc/latex", "doc/sourcedoc")
    ren("doc/sourcedoc", "TKZdoc-euclide-main.tex", "TKZdoc-euclide.tex")
  else
    errorlevel = (mkdir("doc/sourcedoc") + cp("*.*", "doc/latex", "doc/sourcedoc")
                 + ren("doc/sourcedoc", "TKZdoc-euclide-main.tex", "TKZdoc-euclide.tex"))
    if errorlevel ~= 0 then
      error("** Error!!: Can't copy files from ./doc/latex to .doc/sourcedoc")
      return errorlevel
    end
  end
end

if options["target"] == "doc" or options["target"] == "ctan" or options["target"] == "install" then
  make_ctan_tree()
end

if options["target"] == "clean" then
  errorlevel = (cleandir("code") + cleandir("doc/sourcedoc") + cleandir("doc/examples"))
  lfs.rmdir("code")
  lfs.rmdir("doc/sourcedoc")
  lfs.rmdir("doc/examples")
end

-- Setting variables for package files
sourcefiledir = "code"
docfiledir    = "doc"
docfiles      = {
  "cheatsheet_euclide_1.pdf",
  "Euclidean_geometry.pdf",
  "cheatsheet_euclide_2.pdf",
  "sourcedoc/*.tex",
  "examples/*.*",
}
sourcefiles   = {"tkz-*.tex", "tkz-*.sty"}
installfiles  = {"tkz-*.*", "README.md"}

-- Setting file locations for local instalation (TDS)
tdslocations = {
  "doc/latex/tkz-euclide/cheatsheet_euclide_1.pdf",
  "doc/latex/tkz-euclide/Euclidean_geometry.pdf",
  "doc/latex/tkz-euclide/cheatsheet_euclide_2.pdf",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-*.tex",
  "doc/latex/tkz-euclide/examples/preamble-standalone.ltx",
  "doc/latex/tkz-euclide/examples/tkzEuclide*.tex",
  "tex/latex/tkz-euclide/tkz-*.*",
}

-- Update package date and version
tagfiles = {"./latex/tkz*.*", "README.md", "doc/latex/TKZdoc-euclide-main.tex"}

function update_tag(file, content, tagname, tagdate)
  if string.match(file, "%.tex$") then
    content = string.gsub(content,
                          "\\fileversion{.-}",
                          "\\fileversion{"..tkzeuclidev.."}")
    content = string.gsub(content,
                          "\\filedate{.-}",
                          "\\filedate{"..tkzeuclided.."}")
    content = string.gsub(content,
                          "\\typeout{%d%d%d%d%/%d%d%/%d%d %d+.%d+%a* %s*(.-)}",
                          "\\typeout{"..tkzeuclided.." "..tkzeuclidev.." %1}")
    content = string.gsub(content,
                          "\\gdef\\tkzversionofpack{.-}",
                          "\\gdef\\tkzversionofpack{"..tkzeuclidev.."}")
    content = string.gsub(content,
                          "\\gdef\\tkzdateofpack{.-}",
                          "\\gdef\\tkzdateofpack{"..tkzeuclided.."}")
    content = string.gsub(content,
                          "\\gdef\\tkzversionofdoc{.-}",
                          "\\gdef\\tkzversionofdoc{"..doctkzeuclv.."}")
    content = string.gsub(content,
                          "\\gdef\\tkzdateofdoc{.-}",
                          "\\gdef\\tkzdateofdoc{"..doctkzeucld.."}")
  end
  if string.match(file, "%.sty$") then
    content = string.gsub(content,
                          "\\fileversion{.-}",
                          "\\fileversion{"..tkzeuclidev.."}")
    content = string.gsub(content,
                          "\\filedate{.-}",
                          "\\filedate{"..tkzeuclided.."}")
    content = string.gsub(content,
                          "\\typeout{%d%d%d%d%/%d%d%/%d%d %d+.%d+%a* %s*(.-)}",
                          "\\typeout{"..tkzeuclided.." "..tkzeuclidev.." %1}")
    content = string.gsub(content,
                          "\\ProvidesPackage{(.-)}%[%d%d%d%d%/%d%d%/%d%d %d+.%d+%a* %s*(.-)%]",
                          "\\ProvidesPackage{%1}["..tkzeuclided.." "..tkzeuclidev.." %2]")
  end
  if string.match(file, "README.md$") then
    content = string.gsub(content,
                          "Release %d+.%d+%a* %d%d%d%d%/%d%d%/%d%d",
                          "Release "..tkzeuclidev.." "..tkzeuclided)
  end
  return content
end

-- Typesetting package documentation
typesetfiles = {"TKZdoc-euclide.tex"}

local function type_manual()
  local file = jobname("doc/sourcedoc/TKZdoc-euclide.tex")
  errorlevel = (runcmd("lualatex --draftmode "..file..".tex", typesetdir, {"TEXINPUTS","LUAINPUTS"})
              + runcmd("makeindex "..file..".idx", typesetdir, {"TEXINPUTS","LUAINPUTS"})
              + runcmd("lualatex "..file..".tex", typesetdir, {"TEXINPUTS","LUAINPUTS"}))
  if errorlevel ~= 0 then
    error("Error!!: Typesetting "..file..".tex")
    return errorlevel
  end
  ren("doc/sourcedoc", "TKZdoc-euclide.tex", "TKZdoc-euclide-main.tex")
  return 0
end

specialtypesetting = { }
specialtypesetting["TKZdoc-euclide.tex"] = {func = type_manual}

-- Load personal data
local ok, mydata = pcall(require, "Alaindata.lua")
if not ok then
  mydata = {email="XXX", uploader="YYY"}
end

-- CTAN upload config
uploadconfig = {
  author      = "Alain Matthes",
  uploader    = mydata.uploader,
  email       = mydata.email,
  pkg         = ctanpkg,
  version     = tkzeuclidev,
  license     = "lppl1.3c",
  summary     = "Tools for drawing Euclidean geometry",
  description = [[The tkz-euclide package is a set of files designed to give math teachers and students easy access to the programming of Euclidean geometry with TikZ]],
  topic       = { "Graphics use", "Maths" },
  ctanPath    = "/macros/latex/contrib/tkz/"..ctanpkg,
  repository  = "https://github.com/tkz-sty/"..ctanpkg,
  bugtracker  = "https://github.com/tkz-sty/"..ctanpkg.."/issues",
  support     = "https://github.com/tkz-sty/"..ctanpkg.."/issues",
  announcement_file="ctan.ann",
  note_file   = "ctan.note",
  update      = true,
}

-- Print lines in 80 characters
local function os_message(text)
  local mymax = 77 - string.len(text) - string.len("done")
  local msg = text.." "..string.rep(".", mymax).." done"
  return print(msg)
end

-- Create check_marked_tags() function
local function check_marked_tags()
  local f = assert(io.open("latex/tkz-euclide.sty", "r"))
  marked_tags = f:read("*all")
  f:close()
  local m_pkgd, m_pkgv = string.match(marked_tags, "\\typeout{(%d%d%d%d%/%d%d%/%d%d) (%d+.%d+%a*) .-")
  if tkzeuclidev == m_pkgv and tkzeuclided == m_pkgd then
    os_message("** Checking version and date: OK")
  else
    print("** Warning: tkz-euclide.sty is marked with version "..m_pkgv.." and date "..m_pkgd)
    print("** Warning: build.lua is marked with version "..tkzeuclidev.." and date "..tkzeuclided)
    print("** Check version and date in build.lua then run l3build tag")
  end
end

-- Config tag_hook
function tag_hook(tagname)
  check_marked_tags()
end

-- Add "tagged" target to l3build CLI
if options["target"] == "tagged" then
  check_marked_tags()
  os.exit()
end

-- GitHub release version
local function os_capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
    s = string.gsub(s, '^%s+', '')
    s = string.gsub(s, '%s+$', '')
    s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

local gitbranch = os_capture("git symbolic-ref --short HEAD")
local gitstatus = os_capture("git status --porcelain")
local tagongit  = os_capture('git for-each-ref refs/tags --sort=-taggerdate --format="%(refname:short)" --count=1')
local gitpush   = os_capture("git log --branches --not --remotes")

if options["target"] == "release" then
  if gitbranch == "master" then
    os_message("** Checking git branch '"..gitbranch.."': OK")
  else
    error("** Error!!: You must be on the 'master' branch")
  end
  if gitstatus == "" then
    os_message("** Checking status of the files: OK")
  else
    error("** Error!!: Files have been edited, please commit all changes")
  end
  if gitpush == "" then
    os_message("** Checking pending commits: OK")
  else
    error("** Error!!: There are pending commits, please run git push")
  end
  check_marked_tags()

  local pkgversion = "v"..tkzeuclidev
  local pkgdate = tkzeuclided
  os_message("** Checking last tag marked in GitHub "..tagongit..": OK")
  errorlevel = os.execute("git tag -a "..pkgversion.." -m 'Release "..pkgversion.." "..pkgdate.."'")
  if errorlevel ~= 0 then
    error("** Error!!: tag "..tagongit.." already exists, run git tag -d "..pkgversion.." && git push --delete origin "..pkgversion)
    return errorlevel
  else
    os_message("** Running: git tag -a "..pkgversion.." -m 'Release "..pkgversion.." "..pkgdate.."'")
  end
  os_message("** Running: git push --tags --quiet")
  os.execute("git push --tags --quiet")
  if fileexists(ctanzip..".zip") then
    os_message("** Checking "..ctanzip..".zip file to send to CTAN: OK")
  else
    os_message("** Creating "..ctanzip..".zip file to send to CTAN")
    os.execute("l3build ctan > "..os_null)
  end
  os_message("** Running: l3build upload -F ctan.ann --debug")
  os.execute("l3build upload -F ctan.ann --debug >"..os_null)
  print("** Now check "..ctanzip..".curlopt file and add changes to ctan.ann")
  print("** If everything is OK run (manually): l3build upload -F ctan.ann")
  os.exit(0)
end
