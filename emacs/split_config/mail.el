(setq mime-view-mailcap-files '("~/.mailcap"))
(setq mime-play-find-every-situations nil)
;; (setq process-connection-type nil)

(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(setq wl-folder-hierarchy-access-folders '("^%"))
(setq mime-edit-split-message nil) ;; Required because mail.kirjastot.fi does not allow message/partial.
(setq mime-play-delete-file-immediately nil)

;; Threading doesn't bump up threads with new replies so use sequential.
(setq wl-summary-default-view 'sequence)

(setq mime-view-multipart/alternative-show-all-children t)
