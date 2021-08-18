;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  システム設定
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;------------------------------------------------
;;  日本語化
;; sudo apt-get install emacs-mozc
;;------------------------------------------------
(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(prefer-coding-system 'utf-8)

;;------------------------------------------------
;;  スタートアップ
;;------------------------------------------------
;; スタートアップメッセージを表示させない
(setq inhibit-startup-message t)

;; バックアップファイルを作成しない
(setq make-backup-files nil)

;;------------------------------------------------
;;  保存
;;------------------------------------------------
;; 終了時にオートセーブファイルを削除する
; (setq delete-auto-save-files t)

;;------------------------------------------------
;;  ウィンドウ
;;------------------------------------------------
;; 複数ウィンドウを禁止する
; (setq ns-pop-up-frames nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  表示
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; メニューバーを消す
; (menu-bar-mode -1)

;; ツールバーを消す
; (tool-bar-mode -1)

;; 列数を表示する
(column-number-mode t)

;; 行数を表示する
(global-linum-mode t)

;; ウィンドウを透明にする
;; アクティブウィンドウ／非アクティブウィンドウ(alphaの値で透明度を指定)
; (add-to-list 'default-frame-alist '(alpha . (0.85 0.85)))

;; カーソルの点滅をやめる
; (blink-cursor-mode 0)

;; カーソル行をハイライトする
;　(global-hl-line-mode t)

;; 対応する括弧を光らせる
(show-paren-mode 1)

;; ウィンドウ内に収まらない時だけ、括弧内も光らせる
; (setq show-paren-style 'mixed)
; (set-face-background 'show-paren-match-face "grey")
; (set-face-foreground 'show-paren-match-face "black")

;; スペース、タブなどを可視化する
; (global-whitespace-mode 1)

;; スクロールは１行ごとに
(setq scroll-conservatively 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  編集
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;------------------------------------------------
;;  改行コード
;;------------------------------------------------
;; 改行コードを表示する
(setq eol-mnimonic-dos "(CRLF)")
(setq eol-mnimonic-mac "(CR)")
(setq eol-mnimonic-unix "(LF)")

;;------------------------------------------------
;;  タブ幅
;;------------------------------------------------
;; タブにスペースを使用する
(setq-default tab-width 4 indent-tabs-mode nil)
;; C/C++
(add-hook 'c-mode-hook '(lambda () (setq c-basic-offset 4)))
(add-hook 'c++-mode-hook '(lambda () (setq c-basic-offset 4)))

(setq c-tab-always-indent nil)

;;------------------------------------------------
;;  編集機能
;;------------------------------------------------
;; 自動改行
(setq c-auto-newline t)

;; 欲張り削除
(setq c-hungry-delete-key t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  パッケージ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;------------------------------------------------
;;  パッケージマネージャ
;;------------------------------------------------
(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "https://melpa.org/packages/")
 )
(add-to-list
 'package-archives
 '("melpa-stable" . "https://stable.melpa.org/packages/")
 )
(add-to-list
 'package-archives
 '("marmalade" . "https://marmalade-repo.org/packages/")
 )
(add-to-list
 'package-archives
 '("org" . "https://orgmode.org/elpa/")
 )
(package-initialize)

;; *** ここからコメントアウトした ***
;; ;;------------------------------------------------
;; ;;  dired
;; ;;------------------------------------------------
;; (require 'dired-x)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; テーマ
;; ;; mkdir .emacs.d/themes
;; ;; cd .emacs.d/themes
;; ;; git clone https://github.com/sellout/emacs-color-theme-solarized.git
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ; (add-to-list
;; ;  'custom-theme-load-path
;; ;  "~/.emacs.d/themes/emacs-color-theme-solarized")
;; ; (load-theme 'solarized t)
;; ; (enable-theme 'solarized)
;; ; (set-frame-parameter nil 'background-mode 'dark)
;; ; (add-hook 'after-make-frame-functions
;; ;           (lambda (frame)
;; ;             (let ((mode (if (display-graphic-p frame) 'light 'dark)))
;; ;               (set-frame-parameter frame 'background-mode mode)
;; ;               (set-terminal-parameter frame 'background-mode mode))
;; ;             (enable-theme 'solarized)))

;;------------------------------------------------
;;  tabbar
;; M-x package-refresh-contents
;; M-x package-install tabbar
;;------------------------------------------------
(require 'tabbar)
(tabbar-mode 1)

;; タブ上でマウスホイール操作無効
(tabbar-mwheel-mode nil)

;; グループ化しない
(setq tabbar-buffer-groups-function nil)

;; 画像を使わないことで軽量化する
(setq tabbar-use-images nil)

;; キーに割り当てる
; (global-set-key (kbd "M-<right>") 'tabbar-forward-tab)
; (global-set-key (kbd "M-<left>") 'tabbar-backward-tab)
(global-set-key (kbd "<C-tab>") 'tabbar-forward-tab)
(global-set-key (kbd "<C-S-tab>") 'tabbar-backward-tab)

;; タブのセパレータの長さ
(setq tabbar-separator '(1.0))

;; (require 'anything-startup)
;; (define-key global-map (kbd "C-r") 'anything-imenu)


;;------------------------------------------------
;;  NeoTree
;;------------------------------------------------
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; ;;------------------------------------------------
;; ;;  TeX
;; ;;------------------------------------------------
;; ;; (require'tex-site)



;;------------------------------------------------
;;  cc-mode
;;------------------------------------------------
(setq c-default-style "linux"
      c-basic-offset 4)

;;------------------------------------------------
;;  yatex
;;------------------------------------------------
(require 'yatex)
;; auto-mode-alist への追加
(add-to-list 'auto-mode-alist '("\\.tex\\'" . yatex-mode))
(setq tex-command "uplatex")
(setq bibtex-command "pbibtex")
;; reftex-mode
(add-hook 'yatex-mode-hook
          #'(lambda ()
              (reftex-mode 1)
              (define-key reftex-mode-map
                (concat YaTeX-prefix ">") 'YaTeX-comment-region)
              (define-key reftex-mode-map
                (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)))

;;------------------------------------------------
;;  markdown-preview-mode
;;  M-x package-list-packages
;;  required:
;;    markdown-preview-mode
;;    websocket.el
;;    web-server.el
;;    uuidgen
;;------------------------------------------------
(autoload 'markdown-preview-mode "markdown-preview-mode.el" t)
(setq markdown-preview-stylesheets (list "github.css"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-term-color-vector
   [unspecific "#586e75" "#dc322f" "#859900" "#b58900" "#268BD2" "#d33682" "#00877C" "#002b36"])
 '(column-number-mode t)
 '(browse-url-browser-function (quote browse-url-default-browser))
 '(custom-enabled-themes (quote (misterioso)))
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "085b401decc10018d8ed2572f65c5ba96864486062c0a2391372223294f89460" default)))
 '(electric-pair-mode t)
 '(fci-rule-color "#F2F2F2")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-tail-colors
   (quote
    (("#F2F2F2" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#6DA8D2" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#F2F2F2" . 100))))
 '(neo-hidden-regexp-list
   (quote
    ("^\\." "\\.pyc$" "~$" "^#.*#$" "\\.elc$" "\\.o$" "\\.pdf$")))
 '(package-selected-packages
   (quote
    (uuidgen markdown-preview-mode yaml-mode yatex neotree tabbar)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ricty Diminished" :foundry "outline" :slant normal :weight normal :height 110 :width normal)))))
