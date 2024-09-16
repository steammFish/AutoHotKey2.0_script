; AutoHotkey v2 脚本

; 打开 Windows Terminal (pwsh)
#t::  ; Win + T
{
    Run("wt")  ; 启动 Windows Terminal
}

; 关闭当前活动窗口
^!w::  ; Ctrl + Alt + W
{
    WinClose("A")  ; 关闭当前活动窗口
}

; 打开 VSCode
^!v::  ; Ctrl + Alt + V
{
    Run("C:\Users\libra\AppData\Local\Programs\Microsoft VS Code\Code.exe")  ; 启动 VSCode
}

; 打开默认浏览器
^!b::  ; Ctrl + Alt + B
{
    Run("http://www.google.com")  ; 启动默认浏览器并打开 Google
}

; 打开启动目录
^!s::  ; Ctrl + Alt + S
{
    Run("explorer shell:startup")  ; 打开启动目录
}

; 鼠标事件
^!o::  ; Ctrl + Alt + O
{

    ; 定义一个点集（x坐标、y坐标、延迟delay）
    points := [
        {x: 100, y: 0, delay: 30},
        {x: 71, y: 71, delay: 40},
        {x: 0, y: 100, delay: 50},
        {x: -71, y: 71, delay: 60},
        {x: -100, y: 0, delay: 70},
        {x: -71, y: -71, delay: 60},
        {x: 0, y: -100, delay: 50},
        {x: 71, y: -71, delay: 40}
    ]

    ; 操作有两个
    DrawPolygon(points) ; 连接点集中的每个点用鼠标绘制一个图形
    ; ClickPoints(points)   ; 点击点集中的每个点
}


DrawPolygon(points)
{
    MouseGetPos(&startX, &startY)  ; 获取当前鼠标位置
    MouseClick("left", startX + points[1].x, startY + points[1].y, 1, 0, "D")  ; 按下左键

    ; 遍历从第二个点开始到最后一个点
    for index, point in points
    {
        if (index > 1)  ; 跳过第一个点，开始从第二个点绘制
        {
            MouseMove(startX + point.x, startY + point.y, 0)  ; 移动到指定点
            Sleep(point.delay)  ; 等待一段时间，以确保鼠标移动完毕
        }
    }

    MouseClick("left", startX + points[1].x, startY + points[1].y, 1, 0, "U")  ; 释放左键
}

ClickPoints(points)
{
    startX := 500
    startY := 500

    for point in points
    {
        MouseClick("left", startX + point.x, startY + point.y,1,0)
        Sleep(point.delay)
    }
}
