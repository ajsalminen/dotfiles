(require 'helm-config)
(require 'helm-dash)
(helm-mode 1)
(require 'helm-fasd)
(eval-when-compile (require 'helm-recoll nil t))


(helm-recoll-create-source "all" "~/.recoll")
