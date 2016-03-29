;; geben won't connect because its "Already in debugging"  This might help.
;; from http://www.dave-cohen.com/node/1000010
(defun my-geben-release ()
  (interactive)
  (geben-stop)
  (dolist (session geben-sessions)
    (ignore-errors
      (geben-session-release session))))


;; Make geben always accept new connections when running Drupal tests for example.
(defun my-geben-accept-all ()
  (interactive)
  (setf (symbol-function 'geben-dbgp-session-accept-p) #'(lambda (x) t)))
