;; تضبيط الخطوط
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font Propo" :size 13 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "IBM Plex Sans Arabic" :size 11)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font Propo" :size 10 :weight 'semi-bold)
      doom-symbol-font (font-spec :family "Symbols Nerd Font")
      )

;; (tooltip-mode -1) ;; إخفاء تلمحيات الماوس
(setq isearch-allow-scroll t) ;; السماح بالسكرول دون الخروج من عملية البحث الحالية
(add-hook 'prog-mode-hook #'display-line-numbers-mode) ;; تفعيل إظهار أرقام الأسطر تلقائيا في الملفات البرمجية
(global-anzu-mode +1)
(column-number-mode +1)
(delete-selection-mode +1)
(setq mouse-wheel-scroll-amount '(3))  ;; قم بالتمرير سطر واحد في كل مرة
(setq mouse-wheel-progressive-speed nil) ;; لا تمرر أسطر كثيرة عند تسريع التمرير
(setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(setq make-backup-files t) ;; احفظ بنسخ احتياطية للملفات التي يجري تحريرها
(setq backup-directory-alist (quote ((".*" . "~/.config/emacs.d/backup-files/")))) ;; ضع جميع هذه الملفات في هذا المسار

;; اختصارات مخصصة
(map! :n "C-n" #'treemacs)

;; Enable lsp-mode for C++ using clangd
(after! lsp-mode
  (setq lsp-clients-clangd-executable "clangd"))

;; Enable lsp for C/C++ files
(add-hook 'c++-mode-hook #'lsp)
(add-hook 'c-mode-hook #'lsp)

;; Decrease font size and padding for treemacs
(after! treemacs
  ;; Function to set up custom font size
  (defun my-treemacs-setup-font ()
    (face-remap-add-relative 'default :height 0.9)) ; Adjust the height value as needed
  (add-hook 'treemacs-mode-hook #'my-treemacs-setup-font)

  ;; Decrease padding in treemacs
  (setq treemacs-indentation 1  ; Default is 2
        treemacs-indentation-string " ") ; This can be any string, usually " "
  (map! :map treemacs-mode-map
        :n "C-n" #'treemacs))


;; Apply changes
(add-hook 'treemacs-mode-hook
          (lambda ()
            (setq-local line-spacing 0) ; Set line-spacing to 0
            (setq-local treemacs-indentation 1))) ; Adjust the indentation

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


