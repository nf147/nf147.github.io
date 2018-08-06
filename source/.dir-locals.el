((nil
  (org-html-head-include-default-style . nil)
  (org-html-htmlize-output-type . css)
  (org-html-head . "<link rel='stylesheet' href='/asset/common.css' />
<script src='https://cdn.bootcss.com/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
<script src='/asset/common.js'></script>\n")
  (org-publish-project-alist
   ("_notes"
    :base-directory "./"
    :base-extension "org"
    :exclude "^\\(\\.\\|x\\.\\).*"
    :publishing-directory "../"
    :publishing-function org-html-publish-to-html
    :recursive t
    :headline-levels 3
    :with-toc 3
    :html-preamble t
    :auto-sitemap t
    :author "某某人"
    :sitemap-filename "sitemap.org")
   ("_assets"
    :base-directory "./"
    :base-extension "css\\|js\\|png\\|jpe?g\\|gif\\|svg\\|pdf\\|zip\\|html\\|txt"
    :exclude "^\\(\\.\\|x\\.\\).*"
    :publishing-directory "../"
    :publishing-function org-publish-attachment
    :recursive t)
   ("nnn" :components
    ("_assets" "_notes")))))
