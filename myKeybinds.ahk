; AutoHotkey v2 脚本

; 快捷键：Win + T 打开 Windows Terminal (PowerShell)
#t::
{
    Run("wt")  ; 启动 Windows Terminal (PowerShell)
}

; 快捷键：Ctrl + Alt + W 关闭当前活动窗口
^!w:: 
{
    WinClose("A")  ; 关闭当前活动窗口，"A" 代表当前窗口
}

; 快捷键：Ctrl + Alt + V 打开 Visual Studio Code
^!v:: 
{
    Run("C:\Users\libra\AppData\Local\Programs\Microsoft VS Code\Code.exe")  ; 启动 VSCode
}

; 快捷键：Ctrl + Alt + B 打开默认浏览器并导航到 Google
^!b::
{
    Run("http://www.google.com")  ; 启动默认浏览器并打开 Google
}

; 快捷键：Ctrl + Alt + S 打开启动目录
^!s::
{
    Run("explorer shell:startup")  ; 打开 Windows 启动目录
}

; 快捷键：Ctrl + Alt + O 鼠标绘制图形或点击点集
^!o::
{
    ; 定义点集，每个点包含 x 坐标、y 坐标和延迟时间（单位：毫秒）
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

    ; 执行鼠标绘制多边形操作
    DrawPolygon(points)  ; 连接点集中的每个点，用鼠标绘制一个多边形
    ; ClickPoints(points) ; 可替代操作：点击点集中的每个点
}

; 函数：根据给定的点集用鼠标绘制一个多边形
DrawPolygon(points)
{
    ; 获取当前鼠标的初始位置
    MouseGetPos(&startX, &startY)  

    ; 移动到第一个点并按下鼠标左键
    MouseClick("left", startX + points[1].x, startY + points[1].y, 1, 0, "D")  

    ; 遍历点集，从第二个点开始绘制
    for index, point in points
    {
        if (index > 1)  ; 跳过第一个点，开始绘制第二个点到最后一个点
        {
            MouseMove(startX + point.x, startY + point.y, 0)  ; 移动到指定点
            Sleep(point.delay)  ; 延迟以确保鼠标移动的平滑
        }
    }

    ; 返回到第一个点并释放鼠标左键，完成绘制
    MouseClick("left", startX + points[1].x, startY + points[1].y, 1, 0, "U")  
}

; 函数：在给定的点集位置进行点击操作
ClickPoints(points)
{
    ; 设置基准坐标（500, 500）
    startX := 500
    startY := 500

    ; 遍历点集并执行鼠标点击操作
    for point in points
    {
        MouseClick("left", startX + point.x, startY + point.y, 1, 0)  ; 点击点集中的每个点
        Sleep(point.delay)  ; 延迟，确保点击动作可见
    }
}
