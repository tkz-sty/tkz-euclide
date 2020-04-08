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
sourcefiles  = {"tkz-*.*"}
installfiles = {"tkz-*.*"}

-- Setting file locations for local instalation (TDS)
tdslocations = {
  "doc/latex/tkz-euclide/cheatsheet_euclide_1.pdf",
  "doc/latex/tkz-euclide/Euclidean_geometry.pdf",
  "doc/latex/tkz-euclide/cheatsheet_euclide_2.pdf",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-angles.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-pointby.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-arcs.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-pointsSpc.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-base.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-points.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-circles.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-pointwith.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-compass.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-polygons.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-config.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-presentation.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-exemples.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-rapporteur.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-FAQ.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-rnd.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-installation.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-sectors.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-intersec.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-show.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-lines.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-tools.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-main.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-triangles.tex",
  "doc/latex/tkz-euclide/sourcedoc/TKZdoc-euclide-news.tex",
  "tex/latex/tkz-euclide/tkz-euclide.sty",
  "tex/latex/tkz-euclide/tkz-obj-eu-points-rnd.tex",
  "tex/latex/tkz-euclide/tkz-obj-eu-angles.tex",
  "tex/latex/tkz-euclide/tkz-obj-eu-points.tex",
  "tex/latex/tkz-euclide/tkz-obj-eu-arcs.tex",
  "tex/latex/tkz-euclide/tkz-obj-eu-points-with.tex",
  "tex/latex/tkz-euclide/tkz-obj-eu-circles.tex",
  "tex/latex/tkz-euclide/tkz-obj-eu-polygons.tex",
  "tex/latex/tkz-euclide/tkz-obj-eu-compass.tex",
  "tex/latex/tkz-euclide/tkz-obj-eu-protractor.tex",
  "tex/latex/tkz-euclide/tkz-obj-eu-draw-circles.tex",
  "tex/latex/tkz-euclide/tkz-tools-angles.tex",
  "tex/latex/tkz-euclide/tkz-obj-eu-lines.tex",
  "tex/latex/tkz-euclide/tkz-obj-eu-sectors.tex",
  "tex/latex/tkz-euclide/tkz-obj-eu-show.tex",
  "tex/latex/tkz-euclide/tkz-tools-math.tex",
  "tex/latex/tkz-euclide/tkz-obj-eu-draw-lines.tex",
  "tex/latex/tkz-euclide/tkz-obj-eu-draw-polygons.tex",
  "tex/latex/tkz-euclide/tkz-obj-eu-triangles.tex",
  "tex/latex/tkz-euclide/tkz-obj-eu-draw-triangles.tex",
  "tex/latex/tkz-euclide/tkz-tools-intersections.tex",
  "tex/latex/tkz-euclide/tkz-obj-eu-points-by.tex",
  "doc/latex/tkz-euclide/examples/preamble-standalone.ltx",
  "doc/latex/tkz-euclide/examples/tkzEuclide-1.0.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-10.1.10.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-10.1.11.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-10.1.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-10.1.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-10.1.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-10.1.4.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-10.1.5.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-10.1.6.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-10.1.7.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-10.1.8.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-10.1.9.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-10.2.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-11.2.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-11.3.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-11.4.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-11.4.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-11.5.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-11.5.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-11.6.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-12.1.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-12.1.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-12.1.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-12.1.4.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-12.1.5.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-12.2.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-12.2.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-12.2.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-12.2.4.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-12.2.5.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-13.1.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-13.1.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-13.1.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-13.1.4.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-13.1.5.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-13.1.6.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-1.3.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-13.2.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-1.3.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-1.3.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-1.4.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-14.1.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-14.1.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-14.1.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-14.2.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-14.2.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-14.3.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-14.3.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-14.4.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-14.5.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-14.5.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-14.5.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-14.5.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-1.5.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-15.1.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-15.1.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-15.1.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-15.2.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-15.2.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-15.2.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-15.2.4.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-15.2.5.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-16.0.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-16.0.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-16.0.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-16.0.4.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-16.0.5.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-16.0.6.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-16.0.7.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-16.0.8.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-1.6.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-17.10.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-17.10.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-17.1.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-17.1.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-17.1.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-17.3.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-17.3.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-17.3.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-17.4.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-17.5.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-17.6.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-17.7.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-17.7.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-17.8.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-17.8.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-17.9.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-18.1.10.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-18.1.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-18.1.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-18.1.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-18.1.4.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-18.1.5.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-18.1.6.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-18.1.7.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-18.1.8.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-18.1.9.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-19.1.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-19.2.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-19.2.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-19.2.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-19.2.4.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-19.3.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-19.4.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-19.5.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-19.6.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-20.1.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-20.2.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-20.2.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-20.2.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-20.2.4.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-20.2.6.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-20.2.7.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-20.2.8.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-20.2.9.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-20.3.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-20.3.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-20.3.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-20.3.4.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-20.3.5.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-21.1.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-21.1.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-21.1.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-21.2.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-21.2.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-21.3.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-21.4.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-21.4.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-21.4.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-21.4.4.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-22.2.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-22.3.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-22.4.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-22.4.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-22.5.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-22.6.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-22.6.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-23.1.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-23.1.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-23.1.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-23.1.4.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-23.1.5.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-23.2.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-23.2.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-23.3.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-24.1.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-24.2.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-24.3.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-24.4.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-24.5.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-24.6.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-24.7.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-24.8.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-25.1.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-25.1.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-25.2.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-25.4.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-25.5.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-25.5.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-26.1.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-26.1.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-26.2.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-26.3.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-27.1.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-27.1.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-27.1.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-27.1.4.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-27.2.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-27.2.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-28.1.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-29.1.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-29.2.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-30.1.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-30.1.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-30.1.4.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-30.1.5.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-30.2.10.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-30.2.11.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-30.2.12.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-30.2.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-30.2.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-30.2.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-30.2.4.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-30.2.5.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-30.2.6.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-30.2.7.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-30.2.8.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-30.2.9.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-31.1.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-31.1.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-31.1.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-31.2.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-31.2.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-31.3.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-31.3.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-31.4.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-32.2.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-32.3.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-32.4.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-4.0.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-4.1.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-4.1.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-4.1.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-4.1.4.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-4.1.5.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-4.2.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-4.2.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-4.2.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-4.4.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-4.5.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-5.1.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-5.2.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-5.2.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-5.3.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-6.1.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-6.1.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-6.1.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-6.1.4.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-6.1.5.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-6.1.6.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-6.1.7.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-6.1.8.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-6.1.9.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-7.0.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-7.0.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-7.0.4.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-8.1.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-8.2.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-9.2.0.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-9.2.1.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-9.2.2.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-9.2.3.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-9.2.4.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-9.2.5.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-9.2.6.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-9.2.7.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-9.2.8.tex",
  "doc/latex/tkz-euclide/examples/tkzEuclide-9.3.1.tex",
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

function docinit_hook()
  errorlevel = cp("*.TTF", "ornam4", typesetdir)
  if errorlevel ~= 0 then
    error("** Error!!: Can't copy .TTF from ./ornam4 to "..typesetdir)
    return errorlevel
  end
  return 0
end

local function type_manual()
  local file = jobname("doc/sourcedoc/TKZdoc-euclide.tex")
  errorlevel = (runcmd("lualatex --draftmode "..file..".tex", typesetdir, {"TEXINPUTS","LUAINPUTS"})
              + runcmd("makeindex "..file..".idx", typesetdir, {"TEXINPUTS","LUAINPUTS"})
              + runcmd("lualatex "..file..".tex", typesetdir, {"TEXINPUTS","LUAINPUTS"}))
  if errorlevel ~= 0 then
    error("Error!!: Typesetting "..file..".tex")
    return errorlevel
  end
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
