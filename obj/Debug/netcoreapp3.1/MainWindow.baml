   M S B A M L   `   `   `  ����M  IEasySave_Interface, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:EasySave_InterfaceEasySave_Interface  5   	   #    EasySave_Interface.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35H 9http://schemas.microsoft.com/winfx/2006/xaml/presentation      5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   2local clr-namespace:EasySave_Interface     5   	     � 
ResizeMode$  NoResize=�5   	    � Title$ EasySave��5	   	   $	��450��6   $	��930��6'   .��5
      �  J� RenderTransformOrigin$ 0.512,0.495&�6   .+�5   
   �� $
��Left=�6   $	��235��6/   $��740,-41,0,0q�6<   
���   �$	��Top=�6`   $	��279��6x   �� 5   
   
�������
�������$��1q�6A   �� 5   
   $
��Left=�6   $	��221��6/   $��169,-27,0,0q�6<   
���   �$	��Top=�6`   $	��571��6x   �� 5   
   $
��Left=�6   $	��478��6/   $��-13,-27,0,0q�6<   
���   �$	��Top=�6`   $	��182��6x   �� 5   
   $
��Left=�6   $	��285��6/   $��169,194,0,0q�6<   
���   �$	��Top=�6`   $	��761��6x   �� 5   
   -   5         ��Name$ 
sourcePath��5      $
��Left=�6&   $��
183,89,0,0q�6A    �� TextWrapping$
 Wrap=�6U   $	��Top=�6i   $	��185��6�   $��20��6�   �� 5   
   -   5        $ destinationPath��5      $
��Left=�6+   $��183,150,0,0q�6F   $
 Wrap=�6[   $	��Top=�6o   $	��185��6�   $��20��6�   �� 5   
   -   5         ��Name$
 quit��5      $
��Quit��6   $
��Left=�6.   $��840,388,0,0q�6I   $	��Top=�6^   $��56��6v   $��20��6�   ���	#FFEF9696$ 0.521,-0.178&�6�   �� 5   
   -   5         ��Name$ 
SourcePath��5      $��Source Path ��6(   $
��Left=�6<   $��
183,61,0,0q�6W   $	��Top=�6k   $	��200��6�   $��20��6�   $
��Bold"�6�   �� 5   
   -   5        $ DestPath��5      $��	Dest Path��6&   $
��Left=�67   $��183,125,0,0q�6R   $	��Top=�6g   $	��200��6   $��20��6�   $
��Bold"�6�   �� 5    
   -   5         ��Name$ status��5       $��183,217,0,0q�6"   $
��Left=�67   $	��Top=�6R   $	��166��6j   $	��240��6w   �� 5!   
   -   5        $ launch��5!      $��Launch Backup��6!   $��Right=�69   $��0,149,218,0q�6U   $	��Top=�6j   $	��140��6�   ���	#FF9EFA9C6�   �� 5"   
   $��407,89,218,303q�6    �� Orientation$ 
Horizontal=�6-   .+�5#      	� -   5        	 	�Name$	 complete��5#      $��Complete��6,   $��20��6?   $��85��6K   
 d� 	IsChecked$

 TrueY�6V   5$      �� 5%   
   $1��+pack://application:,,,/Images/easysave2.png��6   $��116,-30,495,333q�6E   �� 5&   
   -	   5        $ 
pathFolder��5&      $	��...��6%   $
��Left=�63   $��20��6N   $��
368,89,0,0q�6Z   $	��Top=�6n   $��24��6�   6�   �� 5'   
   -
   5        $ pathFolder2��5'      $	��...��6&   $
��Left=�64   $��20��6O   $��368,150,0,0q�6[   $	��Top=�6p   $��24��6�   6�   �� 5(   
   -   5        $ GoToParametre��5(      $��Go to parametre��6(   $��710,388,110,0q�6C   $��20��6p   $	��Top=�6|   ���	#FFDFDFDF6�   &   System.Windows.Controls.DataGrid  5*   
   -   5          Name$ Backups��5*         AutoGenerateColumns$ False��6<   $��442,217,0,0q�6X   $
��Left=�6m   $	��Top=�6�   $	��166��6�   $	��454��6�   ��6$   ��    Columns 5+      0  *System.Windows.Controls.DataGridTextColumn  5,      ,  &System.Windows.Controls.DataGridColumn   Header$
 Name��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ 70 6L   1  +System.Windows.Controls.DataGridBoundColumn   Binding 63   �� *name+6L   4  .System.Windows.Controls.DataGridTemplateColumn  5.      $
 Play��6)   $ 50 67      CellTemplate 5/      �� 50      .R�51      �� $ btnPlay��6%   -   5        $
��Play��51   6   {�6[   �� *paused+52      54        56      $ Pause��6)   $ 50 68    57      �� 58      .R�59      �� $ btnPause��6%   -   5        $��Pause��59   7   {�6^   �� *	running+5:      5<        5>      $
 Stop��6)   $ 50 67    5?      �� 5@      .R�5A      �� $ btnStop��6%   -   5        $
��Stop��5A   6   {�6[   �� *	stopped+5B      5C      5E        5G      $ Progress Bar��6)   $ * 6?    5H      �� 5I      .R�5J      �  �Name$ 	totalFile��6*    � Value 6=   �� *progression+5K      5M      5P      �� 5R   
   -   5        $ SocketStatus��5R      $
��Left=�6*   $��35��6E   $��765,135,0,0q�6Q   $
��Wrap=�6f   $	��Top=�6z   $	��115��6�    �� TextAlignment$ Center=�6�   $
��Bold"�6�   $��20(�6�   
���   ��� 6�    � Language$ fr-fr�6�   $� ��6�   6	  5b      5c      