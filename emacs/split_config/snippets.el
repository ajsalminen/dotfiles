
(require 'yasnippet) ;; not yasnippet-bundle
;; Let's have snippets in the auto-complete dropdown
(add-to-list 'ac-sources 'ac-source-yasnippet)
(add-to-list 'yas-snippet-dirs (expand-file-name "~/opt/yasnippet-snippets/") t)
(add-to-list 'yas-snippet-dirs (expand-file-name "~/opt/yasnippet-drupal/") t)

(yas-global-mode 1)

;; php-auto-yasnippets hack
;; GRIPE Should I get this working, it probably doesn't belong here.
(defun insert-func-and-auto-yasnippet ()
  "Insert the selected function name then insert its auto-snippet."
  (ac-expand)
  ;; DEBUG Do we need to handle classes? For the moment, I don't think it's
  ;; necessary.
  (yas/create-php-snippet nil))

(ac-define-source php-auto-yasnippets
  ;; DEBUG not sure what 'depends' does - it's used in the
  ;; yasnippet ac source, though, so I just mirrored it
  ;; blindly.
  '((depends yasnippet)
    (depends php-auto-yasnippets)
    ;; DEBUG This will need to change - people will want to
    ;; customize their list of PHP callables, since the
    ;; auto-complete dictionary is not very up-to-date (and
    ;; also contains keywords, which we don't want).
    (candidates . ac-buffer-dictionary)
    (action . insert-func-and-auto-yasnippet)
    ;; Since these trigger yasnippet, I think it makes sense
    ;; to use the yasnippet face.
    (candidate-face . ac-yasnippet-candidate-face)
    (selection-face . ac-yasnippet-selection-face)
    ;; For 'PHP', and to distinguish from regular yasnippet
    ;; funcations.
    (symbol . "p")))

;; php-auto-yasnippet hack ends.
(setq ad-redefinition-action 'accept)

(defadvice php-extras-autocomplete-setup (after give-yasnippet-highest-priority activate)
  (setq ac-sources (delq 'ac-source-yasnippet ac-sources))
  (add-to-list 'ac-sources 'ac-source-yasnippet)
  (add-to-list 'ac-sources 'ac-source-php-auto-yasnippets))
