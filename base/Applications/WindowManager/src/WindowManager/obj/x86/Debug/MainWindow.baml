   M S B A M L   `   `   `  ����H  DWindowManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:WindowManagerWindowManager  5   M   ?$clr-namespace:WindowManager.ControlsWindowManager.Controls  5   M   \ XHardcodet.Wpf.TaskbarNotification, Version=1.0.4.0, Culture=neutral, PublicKeyToken=null�Zclr-namespace:Hardcodet.Wpf.TaskbarNotification;assembly=Hardcodet.Wpf.TaskbarNotification!Hardcodet.Wpf.TaskbarNotification 5      I)clr-namespace:WindowManager.Core.SettingsWindowManager.Core.Settings  5          WindowManager.MainWindow   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      5WindowManagerclr-namespace:WindowManager     6M   @d2http://schemas.microsoft.com/expression/blend/2008     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      Z VWPFToolkit.Extended, Version=1.6.0.0, Culture=neutral, PublicKeyToken=3e4669d2f30244f44xctk)http://schemas.xceed.com/wpf/xaml/toolkit  5      3Controls$clr-namespace:WindowManager.Controls  6M   tTaskbarNotificationZclr-namespace:Hardcodet.Wpf.TaskbarNotification;assembly=Hardcodet.Wpf.TaskbarNotification  5      8Settings)clr-namespace:WindowManager.Core.Settings  5      -   5          � Title$  WindowManager��5   Q   $	��767��6g   $	��737��6t    � Icon$ /Assets/Logo.ico��6�    � 	Resources 5
       �� MergedDictionaries �� Source�� 5   
    5      �� 5      $ Themes/Generic.xaml?�6%   6D   %    5       J� CommandBindings 5      )  #System.Windows.Input.CommandBinding  5   
   -   5           Command$' !WindowManager:CustomCommands.Exit��5      6E     5   
   -   5        $- 'WindowManager:CustomCommands.ShowWindow��5      6K     5   
   -   5        $1 +WindowManager:CustomCommands.ExportSettings��5      6O     5   
   -   5        $1 +WindowManager:CustomCommands.ImportSettings��5      6O   .��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      .+�5   
   +  %System.Windows.Controls.Ribbon.Ribbon     ApplicationMenu 5       :  4System.Windows.Controls.Ribbon.RibbonApplicationMenu  5!      5  /System.Windows.Controls.Ribbon.RibbonMenuButton	   SmallImageSource	 5"      H� 5#      
 H� Drawing
 5$      � 5%   "    � ForegroundBrush
 ����� � GlyphRun 5&   &   	� 5'   *    	� 
IsSideways .   	� GlyphIndices$ 41 76 79 72C�5(   7    	� FontRenderingEmSize$ 12Q�6R    	� AdvanceWidths$* $5.859375 2.90625 2.90625 6.275390625P�5)       	� 
CaretStops 5'   3   Z�  	� 
ClusterMap 6I   Z�  	� GlyphOffsets 5(      Z�  	� DeviceFontName 6k   Z�  	� GlyphTypeface 5*   .   � 5+   2    � FontUri$" C:\WINDOWS\Fonts\SEGOEUI.TTF?�6@   5-   +   5/   #   51      .@�53      >  8System.Windows.Controls.Ribbon.RibbonApplicationMenuItem  $
��Exit��60    m� Command$' !WindowManager:CustomCommands.Exit��54   -   55      .@�57      .  (System.Windows.Controls.Ribbon.RibbonTab  $
��Home��6   .@�58      0  *System.Windows.Controls.Ribbon.RibbonGroup  $��Configuration��6   .@�59      1  +System.Windows.Controls.Ribbon.RibbonButton  -   5           LargeImageSource$ /Assets/Save.png��59   #      Label$
 Save��6G   6T     5:      -   5        $ /Assets/Undo.png��5:   #   $ Reset��6G   6U     5;      -   5        $ /Assets/Delete.png��5;   #   $ Default Configuration��6I   5<       5=        5>      $��Profile��6   .@�5?      �  5@      �� 5A      $
��Auto �6,   �� 5B      $
��Auto �6,    � ColumnDefinitions 5D      �� 5E      $
��Auto �6/   �� 5F      $
��Auto �6/   �� 5G      $
��Auto �6/   �� 5H      $
��Auto �6/   .+�5K      �� $��	HotKeys: ��6$   �� 5L      $��1��6$   $��Theme: ��61   �� 5N      -	   5         ��Name$ _hotKeysComboBox��5N   3   $��1��6#   5O      �� 5P      -
   5        $ _themeComboBox��5P   @   $��1��6#   $��1��63   5Q        5S      -   5        $��2��5S   '      SmallImageSource$ /Assets/Add.png��67   5T   "     5U      -   5        $��3��5U   '   $ /Assets/Delete.png��67   5V   "     5X      -   5        $��1��5X   '   $��2��64   $ /Assets/Add.png��6D   5Y   "     5Z      -   5        $��1��5Z   '   $��3��64   $ /Assets/Delete.png��6D   5[   "   5\      5^      5_        5`      $��About��6   .@�5a        $��About��6   .@�5b      �� .+�5c      �� $
��Bold"�6$   �� 5d      $�WindowManager��6   5e      �� 5f      �� 5g      $�Created by:��6    �� 5h      $� ��6    �� 5i      $
��Bold"�6   $�	Meziantou��6&   5j      �� 5k      �� 5l      -   5        $��http://www.meziantou.net?�5l      .�6i   http://www.meziantou.net5n      5o      5p      5q      5r      5s      3	  -Hardcodet.Wpf.TaskbarNotification.TaskbarIcon	  5v   
   -   5         	 Name$ _taskBarIcon��5w   &    	  
IconSource$ /Assets/Logo.ico��5v   *    	  ToolTipText$ Window Manager��6H     	  DoubleClickCommand$-  'WindowManager:CustomCommands.ShowWindow��5w   <   ! 	  TrayToolTip! 5x      _� 5y      .��5z      �� $��Window Manager��6    5{      " � ContextMenu" 5}      �� 5~      .@�5      m� -   5        $
��Open��5      6-   m� 5�      -   5        $��Close��5�      6.   5�      5�      � 5�   
   $��1��6   .+�5�      �� ._�5�      � -   5        # �Name$# _settingsGrid��5�       5�      $ �� 
TargetType% �� Property& �� Value%
  Xceed.Wpf.Toolkit.IntegerUpDown��%  '��       '�� M     '
  �     �� 5�      "$ ��6    .�5�      �� % � ��$& 3,3,3,3q�67   5�      �� 5�      "$ ��6    .�5�      �� % � ��$& 3,3,3,3q�67   5�      �� 5�      "$ 
 6    .�5�      �� % � ��$& 3,3,3,3q�67   5�      5�      .+�5�      �� $��Stretch=�6!   $��Stretch=�6D   $
��Auto=�5�      $
��Auto=�6I   .@�5�      �� $��General��6"   .��5�      �  5�   "   �� 5�   &   $
��Auto �64   �� 5�   &   $
��Auto �64   �� 5�   &   $
��Auto �64   �� 5�   &   $
��Auto �64   .+�5�   "   �� $��Start when Windows starts��6+   ' d� 	IsChecked' 5�      �� *StartWithWindows+( �� Mode$( TwoWay=��� 5�   "   $��Minimize to tray bar��6+   $��1��5�   P   ' 6   �� *MinimizeToTrayBar+$( TwoWay=�6P   �� 5�   "   $��2��6+   $7��1Override hot key registered by other applications��68   ' 5�      �� *OverrideExistingHotKeys+$( TwoWay=�5�      5�      �� 5�      $��HotKeys��6"   .��5�      �� $
��Auto=�6+   $
��Auto=�6N   .��5�   "   �  5�   &   �� 5�   *   $
��Auto �6;   �� 5�   *   $��* �6;    5�   &   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   �� 5�   *   $
��Auto �68   .+�5�   &   �� $��0��60   $��
Top Left: ��6=   *   $WindowManager.Controls.HotKeyControl  5�   &   $��0��6=   $��1��6J   )   HotKey) 5�   )   �� *HotKeys.TopLeftHotKey+$( TwoWay=��� 5�   &   $��1��60   $��Top: ��6=     5�   &   $��1��6=   $��1��6J   ) 5�   )   �� *HotKeys.TopHotKey+$( TwoWay=��� 5�   &   $��2��60   $��Top Right: ��6=     5�   &   $��2��6=   $��1��6J   ) 5�   )   �� *HotKeys.TopRightHotKey+$( TwoWay=��� 5�   &   $��3��60   $��Center Left: ��6=     5�   &   $��3��6=   $��1��6J   ) 5�   )   �� *HotKeys.LeftHotKey+$( TwoWay=��� 5�   &   $��4��60   $��Center: ��6=     5�   &   $��4��6=   $��1��6J   ) 5�   )   �� *HotKeys.CenterHotKey+$( TwoWay=��� 5�   &   $��5��60   $��Center Right: ��6=     5�   &   $��5��6=   $��1��6J   ) 5�   )   �� *HotKeys.RightHotKey+$( TwoWay=��� 5�   &   $��6��60   $��Bottom Left: ��6=     5�   &   $��6��6=   $��1��6J   ) 5�   )   �� *HotKeys.BottomLeftHotKey+$( TwoWay=��� 5�   &   $��7��60   $��Bottom: ��6=     5�   &   $��7��6=   $��1��6J   ) 5�   )   �� *HotKeys.BottomHotKey+$( TwoWay=��� 5�   &   $��8��60   $��Bottom Right: ��6=     5�   &   $��8��6=   $��1��6J   ) 5�   )   �� *HotKeys.BottomRightHotKey+$( TwoWay=��� 5�   &   $��9��60   $��Horizontal Center: ��6=     5�   &   $��9��6=   $��1��6J   ) 5�   )   �� * HotKeys.HorizontalCenterHotKey+$( TwoWay=��� 5�   &   $��10��60   $��Vertical Center: ��6>     5�   &   $��10��6=   $��1��6K   ) 5�   )   �� *HotKeys.VerticalCenterHotKey+$( TwoWay=��� 5�   &   $��11��60   $��Full Screen: ��6>     5�   &   $��11��6=   $��1��6K   ) 5�   )   �� *HotKeys.FullScreenHotKey+$( TwoWay=��� 5�   &   $��12��60   $��Switch Screen: ��6>     5�   &   $��12��6=   $��1��6K   ) 5   )   �� *HotKeys.SwitchScreenHotKey+$( TwoWay=��� 5  &   $��13��60   $��Display Position Window: ��6>     5  &   $��13��6=   $��1��6K   ) 5  )   �� *'%HotKeys.ShowSizeSelectionWindowHotKey+$( TwoWay=��� 5  &   $��14��60   $��
Top Most: ��6>     5  &   $��14��6=   $��1��6K   ) 5  )   �� *HotKeys.TopMostHotKey+$( TwoWay=��� 5
  &   $��15��60   $��Bottom Most: ��6>     5  &   $��15��6=   $��1��6K   ) 5  )   �� *HotKeys.BottomMostHotKey+$( TwoWay=��� 5  &   $��16��60   $��Extend Left: ��6>     5  &   $��16��6=   $��1��6K   ) 5  )   �� *HotKeys.ExtendLeftHotKey+$( TwoWay=��� 5  &   $��17��60   $��Extend Right: ��6>     5  &   $��17��6=   $��1��6K   ) 5  )   �� *HotKeys.ExtendRightHotKey+$( TwoWay=��� 5  &   $��18��60   $��Extend Top: ��6>     5  &   $��18��6=   $��1��6K   ) 5  )   �� *HotKeys.ExtendTopHotKey+$( TwoWay=��� 5  &   $��19��60   $��Extend Bottom: ��6>     5  &   $��19��6=   $��1��6K   ) 5  )   �� *HotKeys.ExtendBottomHotKey+$( TwoWay=��� 5  &   $��20��60   $��Reduce Left: ��6>     5  &   $��20��6=   $��1��6K   ) 5   )   �� *HotKeys.ReduceLeftHotKey+$( TwoWay=��� 5"  &   $��21��60   $��Reduce Right: ��6>     5#  &   $��21��6=   $��1��6K   ) 5$  )   �� *HotKeys.ReduceRightHotKey+$( TwoWay=��� 5&  &   $��22��60   $��Reduce Top: ��6>     5'  &   $��22��6=   $��1��6K   ) 5(  )   �� *HotKeys.ReduceTopHotKey+$( TwoWay=��� 5*  &   $��23��60   $��Reduce Bottom: ��6>     5+  &   $��23��6=   $��1��6K   ) 5,  )   �� *HotKeys.ReduceBottomHotKey+$( TwoWay=�5.  #   5/     50     �� 51     $��Theme��6"   .��52     �  53  "   �� 54  &   $
��Auto �67   �� 55  &   $��* �67    57  "   �� 58  &   $
��Auto �64   �� 59  &   $
��Auto �64   �� 5:  &   $
��Auto �64   �� 5;  &   $
��Auto �64   �� 5<  &   $
��Auto �64   �� 5=  &   $
��Auto �64   �� 5>  &   $
��Auto �64   .+�5A  "   �� $��2��6+   $/��)Show size selection window in full screen��6?   ' 5B     �� *Theme.SwitchWindowFullScreen+$( TwoWay=��� 5D  "   $��1��6,   $��Background Color: ��69   #  Xceed.Wpf.Toolkit.ColorPicker  5E  "   $��1��63   $��1��6@   *   DisplayColorAndName* . +   ShowAvailableColors+ .  ,   ShowStandardColors, .     ColorPickerStyle1#���   5F  Z   $
��Left=�5G  `   -   SelectedColor- 6#   �� *Theme.BackgroundColor+$( TwoWay=�6`   �� 5I  "   $��2��6,   $��Foreground Color: ��69     5J  "   $��2��63   $��1��6@   * . + .  , .  #���   5K  Z   $
��Left=�5L  `   - 6#   �� *Theme.ForegroundColor+$( TwoWay=�6`   �� 5N  "   $��3��6,   $��Selection Border Color: ��69     5O  "   $��3��63   $��1��6@   * . + .  , .  #���   5P  Z   $
��Left=�5Q  e   - 6#   �� *Theme.SelectionBorderColor+$( TwoWay=�6e   �� 5S  "   $��4��6,   $��Selection Fill Color: ��69     5T  "   $��4��63   $��1��6@   * . + .  , .  #���   5U  Z   $
��Left=�5V  c   - 6#   �� *Theme.SelectionFillColor+$( TwoWay=�6c   �� 5X  "   $��5��6,   $��Rows: ��69   
  5Y  "   $��5��65   $��1��6B   �  �Xceed.Wpf.Toolkit.NumericUpDown`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]].   Minimum$. 0X�6R   /   Maximum$/ 20X�6^   $
��Left=�5Z  [   �  �Xceed.Wpf.Toolkit.Primitives.UpDownBase`1[[System.Nullable`1[[System.Int32, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]], mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]0   Value0 6%   �� *Theme.NbItemsPerColumn+$( TwoWay=�6[   �� 5[  "   $��6��6,   $��	Columns: ��69   
  5\  "   $��6��65   $��1��6B   $. 0X�6R   $/ 20X�6^   $
��Left=�5]  X   0 6%   �� *Theme.NbItemsPerRow+$( TwoWay=�6X   5_     5`     5a     5b     5c     5e     5f     5g     