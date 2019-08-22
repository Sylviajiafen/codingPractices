# codingPractices -1
## **Delegate**

設計了一個名為 SelectionView 的 class， 
- [x] 提供 Button，使用者可與 SelectionView 互動
- [x] 提供一個 indicatorView，當使用者點選某一 Button 時，indicatorView 會跟著移動到 Button 下方
- [x] ViewController 欲使用 SelectionView 時，僅須：

      * Create SelectionView 的 instance
      * ViewController confirm SelectionViewDataSource & SelectionViewDelegate
      * assign ViewController 到 SelectionView 的變數 delegate 與 dataSource 中
      
* **SelectionView DataSource 可以控制：**
  * Button 有幾個，預設為 3 個
  * Button 的文字，預設為 Red、Yellow、blue
  * Button 的文字顏色，預設為白色
  * Button 的文字字型與大小，預設為 ``UIFont.systemFont(ofSize: 18)``
  * indicatorView 的顏色，預設為藍色

* **SelectionView Delegate 可以控制：**
  * 判斷使用者點擊的 Button
  * 控制使用者可以點擊的 Button，Button 不能點擊時，indicatorView 也不會移動
      
![GITHUB](https://github.com/Sylviajiafen/codingPractices/blob/master/DelegatePractice.gif?raw=true)
