(TeX-add-style-hook
 "slides"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("babel" "english") ("inputenc" "utf8x")))
   (TeX-run-style-hooks
    "latex2e"
    "beamer"
    "beamer10"
    "babel"
    "inputenc"
    "color"))
 :latex)

