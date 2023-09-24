# [Hammerspoon](https://www.hammerspoon.org/)  
0.9.100  

Hammerspoon config file location: `~/.hammerspoon`. `LoadConfigurationFiles` will softly link `~/.hammerspoon` to `Hammerspoon/.harmmerspoon`.

## Modifier keys
|           |  Key           |
| --------- | -------------- |
| <kbd>⇧</kbd> | Shift       |
| <kbd>⌃</kbd> | Control   	 |
| <kbd>⌥</kbd> | Option      |
| <kbd>⌘</kbd> | Command   	 |

&#x21E7; &#x2303; &#x2387; &#x2318;  

<kbd>hyper</kbd> is equal to <kbd>⌃</kbd><kbd>⌥</kbd><kbd>⌘</kbd>  
<kbd>hyperShift</kbd> is equal to <kbd>⌥</kbd><kbd>⇧</kbd>  
<kbd>hyperCtrl</kbd> is equal to <kbd>⌥</kbd><kbd>^</kbd>  
<kbd>hyperAlt</kbd> is equal to <kbd>⌥</kbd><kbd>⌃</kbd><kbd>⇧</kbd>  

## Features

### Window Management

#### Split Screen Actions

* <kbd>hyper</kbd> + <kbd>←</kbd> Left half
* <kbd>hyper</kbd> + <kbd>→</kbd> Right half
* <kbd>hyper</kbd> + <kbd>↑</kbd> Top half
* <kbd>hyper</kbd> + <kbd>↓</kbd> Bottom half

#### Quarter Screen Actions

* <kbd>hyper</kbd> + <kbd>←</kbd> Left top quarter
* <kbd>hyper</kbd> + <kbd>→</kbd> Right bottom quarter
* <kbd>hyper</kbd> + <kbd>↑</kbd> Right top quarter
* <kbd>hyper</kbd> + <kbd>↓</kbd> Left bottom quarter

#### Multiple Monitor

##### Move Cursor

* <kbd>hyperShift</kbd> + <kbd>←</kbd> Move cursor to next monitor
* <kbd>hyperShift</kbd> + <kbd>→</kbd> Move cursor to previous monitor

##### Move Windows

* <kbd>hyperShift</kbd> + <kbd>←</kbd> Move active window to previous monitor
* <kbd>hyperShift</kbd> + <kbd>→</kbd> Move active window to next monitor
* <kbd>hyperShift</kbd> + <kbd>1</kbd> Move active window to monitor 1 and maximize the window
* <kbd>hyperShift</kbd> + <kbd>2</kbd> Move active window to monitor 2 and maximize the window

#### Other

* <kbd>hyper</kbd> + <kbd>F</kbd> Full Screen
* <kbd>hyper</kbd> + <kbd>M</kbd> Maximize Window
* <kbd>hyper</kbd> + <kbd>C</kbd> Window Center

* <kbd>hyperShift</kbd> + <kbd>H</kbd>  Switch active window(Equal to Alt + Tab)
* <kbd>hyperShift</kbd> + <kbd>/</kbd>  Display a keyboard hint for switching focus to each window

### System Tools

* <kbd>hyper</kbd> + <kbd>L</kbd> Lock Screen

### Launch Application

* <kbd>hyper</kbd> + <kbd>X</kbd> `Xcodes`
* <kbd>hyper</kbd> + <kbd>B</kbd> `Google Chrome`
* <kbd>hyper</kbd> + <kbd>T</kbd> `iTerm`
* <kbd>hyper</kbd> + <kbd>D</kbd> `Finder`
* <kbd>hyper</kbd> + <kbd>Y</kbd> `Activity Monitor`
* <kbd>hyper</kbd> + <kbd>P</kbd> `System Preferences`