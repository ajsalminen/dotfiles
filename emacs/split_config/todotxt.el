(require 'todotxt)
(setq todotxt-file "~/Documents/todo/todo.txt" )
;;(global-set-key (kbd "C-x y") 'todotxt)
(setq log-file "~/.pomodoro_session")

(defun pymodoro-start ()
  "Write a command to start pymodoro for the todo.txt item
on the current line"
  (interactive)
  (let (todoItem)
    (setq todoItem (substring (thing-at-point 'line) 0 -1))
    (setq pymodoroCommand (json-encode `(:command start :timestamp ,(float-time) :taskname ,todoItem)))
 (write-region pymodoroCommand nil log-file nil)))
