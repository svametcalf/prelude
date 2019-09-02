; Some combination of GNU TLS and Emacs fail to retrieve archive
; contents over https.
; https://www.reddit.com/r/emacs/comments/cdei4p/failed_to_download_gnu_archive_bad_request/etw48ux
; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34341
(if (and (version< emacs-version "26.3") (>= libgnutls-version 30600))
    (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))
