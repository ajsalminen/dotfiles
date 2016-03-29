(defun my-shorten-filenames-in-compilation (buffer &optional stat)
  "remove the absolute filenames if they match the default-directory"
  (interactive "b")
  (save-excursion
    (set-buffer buffer)
    (goto-char (point-min))
    (let ((buffer-read-only nil)
          (base-dir (if (re-search-forward "find \\([^ ]+\\) " nil t)
                        (if (string-match "/$" (match-string 1))
                            (match-string 1)
                          (concat (match-string 1) "/"))
                      default-directory)))
      (setq default-directory base-dir)
      (while (re-search-forward (concat "^" default-directory) nil t)
        (replace-match "")))))

(add-hook 'compilation-finish-functions 'my-shorten-filenames-in-compilation)
