;;禁用工具栏
(tool-bar-mode -1)
;;禁用菜单栏，F10 开启关闭菜单
(menu-bar-mode -1)
;;禁用滚动栏，用鼠标滚轮代替
(scroll-bar-mode -1)
;;语法加亮
(global-font-lock-mode t)
;;高亮显示区域选择
(transient-mark-mode t)
;括号高亮
(show-paren-mode t)
;;使用 y or n 提问
(fset 'yes-or-no-p 'y-or-n-p)
;;显示时间 (好像没多大用处)
;(display-time)
; emacs server
(server-start)
;; font
(set-frame-font "Ubuntu Mono-13")
(set-fontset-font (frame-parameter nil 'font)
                  'han "DejaVu Sans YuanTi Mono"
)
(setq
 ;;禁用启动画面
 inhibit-startup-message t
 ;;设定行距
 default-line-spacing 0
 ;;页宽 
 default-fill-column 90
 ;;缺省模式 text-mode
 default-major-mode 'text-mode
 ;;设置删除纪录
 kill-ring-max 200
 ;;以空行结束
 require-final-newline t 
 ;;页面平滑滚动， scroll-margin 5 靠近屏幕边沿3行时开始滚动，可以很好的看到上下文。
 scroll-margin 5
 scroll-conservatively 10000
 ;;括号不来回弹跳
 show-paren-style 'parentheses
 ;;粘贴于光标处，而不是鼠标指针处
 mouse-yank-at-point t

 ;; 回显区
 ;;不要闪屏报警
 visible-bell nil
 ;;锁定行高
 resize-mini-windows nil
 ;;递归 minibuffer
 enable-recursive-minibuffers t
 ;; 当使用 M-x COMMAND 后，过 1 秒钟显示该 COMMAND 绑定的键。
 suggest-key-bindings 1

 ;; 状态栏
 ;;时间格式
; display-time-24hr-format t
; display-time-day-and-date t
; display-time-interval 10
 ;;显示列号
 column-number-mode t
 ;;标题栏显示 %f 缓冲区完整路径 %p 页面百分数 %l 行号
 frame-title-format "%f"
 ;; 编辑器设定
 ;;不生成临时文件(3x)
 ;;(setq-default make-backup-files nil)
 ;;只渲染当前屏幕语法高亮，加快显示速度
 font-lock-maximum-decoration t
 ;;使用X剪贴板
 x-select-enable-clipboard t 
 ;;;;;;;; 使用空格缩进 ;;;;;;;;
 ;; indent-tabs-mode  t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
 indent-tabs-mode nil
 tab-always-indent nil
 tab-width 4
 ;; title
 frame-title-format "emacs : %b"

 user-full-name "tusooa"
 user-mail-address "tusooa@gmail.com"
 browse-url-generic-program "/usr/bin/firefox"
 browse-url-browser-function 'browse-url-generic
)
(mapc '(lambda (x) (add-to-list 'auto-mode-alist x))
      '(
        ("~/.fvwm/\\(config\\|f\\..+\\)" . fvwm-mode)
        ("\\.fvwm\\'" . fvwm-mode)
;        ("/home/tusooa/\\(应用\\|Apps\\)/\\(源码\\|Source-Code\\)/GitHub/tusooa/Apps/Config/\\.fvwm\\+c.+" . fvwm-mode)
        ;("\\.\\(perl\\|pl\\|pm\\)\\'" . cperl-mode)
        ("~/\\.config/Scripts/" . conf-unix-mode)
        ("/home/tusooa/GitHub/Apps/Config/Scripts/" . conf-unix-mode)
        ("/home/tusooa/GitHub/Apps/DefaultConfig/" . conf-unix-mode)
        ("\\.Xresource" . conf-xdefaults-mode)
        ("PKGBUILD" . shell-script-mode)
        ("CMakeLists\\.txt\\'" . cmake-mode)
        ("\\.cmake\\'" . cmake-mode)
        ("\\.php\\'" . php-mode)
        ("\\.inc\\'" . php-mode)
        ("\\.sawfish" . lisp-mode)
        ("\\.rep\\'" . lisp-mode)
        ("\\.zsh\\'" . shell-script-mode)
        ("\\..*rc\\'" . conf-space-mode)
      )
) ;/mapc
;(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
;(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
;(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))
