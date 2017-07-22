(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ))


;; Package setup, taken from
;; https://github.com/zane/dotemacs/blob/master/zane-packages.el#L62
(setq ash-packages
      '(
        ;;autopair
        ;;bang
        ;; qsimpleq-theme
        base16-theme
        expand-region
        fill-column-indicator
        ;;flex-autopair
        ;;flymake-cursor
        flyspell-lazy
        ;;ido-ubiquitous
        js2-mode
        ;;magit
        rainbow-delimiters
        rainbow-mode
        ;; smex
        ;;ergoemacs-mode
        php-mode
        drupal-mode
        ;; starter-kit
        ;; flymake-easy
        ;;flymake-jslint
        ;; flymake-phpcs
        hideshowvis
        keyfreq
	auto-complete
        eldoc
        php-eldoc
        php-extras
        php-auto-yasnippets
        yasnippet
        yaml-mode
        ;; flymake-yaml
	ag
        highlight-indentation
        expand-region
        ace-jump-mode
        helm
        helm-dash
        todotxt
        smartparens
        ;;ggtags
        helm-gtags
        ;;emacs-eclim
        jinja2-mode
        fasd
        jump-char
        geben
        f ;; a library
        jabber
        ansible
        epa
        ;; icicles
        dired+
        smart-mode-line
        wgrep
        wgrep-ag
        multiple-cursors
        scf-mode ;; shortens directory paths in some buffers
        flycheck
        howdoi
        help-fns+
        aggressive-indent
        color-identifiers-mode
        gtags ;; remove once https://github.com/arnested/drupal-mode/issues/67 is fixed.
        helm-recoll
        ;;hide-cmnt
        unbound
        ))
;; Needed by remove-if
(require 'cl)
(package-initialize)
;;; install missing packages
(let ((not-installed (remove-if 'package-installed-p ash-packages)))
  (if not-installed
      (if (y-or-n-p (format "there are %d packages to be installed. install them? "
                            (length not-installed)))
          (progn (package-refresh-contents)
                 (dolist (package not-installed)
                   (package-install package))))))
