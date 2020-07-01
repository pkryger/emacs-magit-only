;; setup default dir to load file -> this will force package to use it
(setq user-init-file (or load-file-name (buffer-file-name))
      user-emacs-directory (file-name-directory user-init-file))

;; setup package
(require 'package)
(let ((melpa (cons "melpa" "http://melpa.org/packages/")))
  (unless (member melpa package-archives)
    (add-to-list 'package-archives melpa)))

(package-initialize)

;; make sure everything is installed
(let ((packages '(magit))
      (has-refreshed nil))

  (defun update-package (p has-refreshed)
    (unless (package-installed-p p)
      (unless has-refreshed
        (message "Refreshing package database...")
        (package-refresh-contents)
        (setq has-refreshed t)
        (message "Done."))
      (package-install p)))

  (dolist (pkg packages)
      (update-package pkg has-refreshed)))

;; start magit here
(magit-status)
(delete-other-windows)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
