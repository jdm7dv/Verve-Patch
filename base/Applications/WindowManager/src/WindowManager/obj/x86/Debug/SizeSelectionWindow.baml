   M S B A M L   `   `   `  ����H  DWindowManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:WindowManagerWindowManager  5   @   '    !WindowManager.SizeSelectionWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     65   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   5WindowManagerclr-namespace:WindowManager     6@   -   5          � Title$  SizeSelectionWindow��5   	   $	��300��6%   $	��300��62    � 
ResizeMode$ NoResize=�6>    � ShowInTaskbar .   � Topmost .  � WindowStyle$
 None=�5   	   ���	#A4FFFFFF � AllowsTransparency .  � 	Resources 5         foregroundBrush �� Color  selectionBorderBrush  selectionFillBrush  ScreenTemplate ��Name	 �� CornerRadius
 �� Triggers �� Value �� Binding �� Path �� 
TargetName �� Value �� Property��%�  &	        &	      &	 B     &	 e     �� 5   
   $ Black��62   �� 5   
   $ 	#AF0000FF��67   �� 5   
   $ 	#A00089FF��65   �� 5
   
   .R�5      �� $ border��6   $��2q�6%   #���   6@   $	 2��6w   $��5q�5      $��Stretch=�6+   $��Stretch=�6Z   
 5      �� 5      $
 True��6B    6   �� $ 
IsSelected�.a�5      �� $ border��63   # �   6G    � ��5      5      5      .��5      � .+�5   
   �� $��Stretch=�6   $��Stretch=�6<   #��[ 6X   ��6�   �� *ScreenItems+��5      �� 5      .R�5      A�  A� Rows 6"   �� *DataContext.NbRows+ �� RelativeSource ��  �� AncestorType$ ItemsControlL� A� Columns 5   "   �� *DataContext.NbColumns+ �� $ ItemsControlL�5      5      �� 5    
   -   5         ��Name$ canvas��5       
������ .+�5"      �� -   5         ��Name$ 	rectangle��5"      $��2��6+   #���  6?   #���  5#       �� Left$	 -10��6>   5$      5%      5'      