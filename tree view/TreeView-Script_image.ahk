ImageListID := IL_Create(10)  ; Create an ImageList with initial capacity for 10 icons.
Loop 10  ; Load the ImageList with some standard system icons.
    IL_Add(ImageListID, "shell32.dll", A_Index)
Gui, Add, TreeView, ImageList%ImageListID%
TV_Add("Name of Item", 0, "Icon4")  ; Add an item to the TreeView and give it a folder icon.
Gui Show