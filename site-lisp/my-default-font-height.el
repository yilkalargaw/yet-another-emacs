(defun my-increase-default-font-height ()
  (interactive)
  (let* ((default-face-height (face-attribute 'default :height)))
    (eval `(set-face-attribute 'default nil :height ,(+ default-face-height 5)))))


(defun my-decrease-default-font-height ()
  (interactive)
  (let* ((default-face-height (face-attribute 'default :height)))
    (eval `(set-face-attribute 'default nil :height ,(- default-face-height 5)))))


(defun my-set-to-default-font-height()
  (interactive)
  (set-face-attribute 'default nil :height 105))
