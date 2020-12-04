//::///////////////////////////////////////////////
//::Number of Items include file
//:://////////////////////////////////////////////
/*
    This contains a corrected version of the TakeNumItems function
    and a related function GetNumItems originally from the 'nw_i0_plot' include file
*/
//:://////////////////////////////////////////////
#include "my_include_file"

// Remove nNumItems Items of Type sItem (Tag) from oTarget
void TakeNumItems(object oTarget,string sItem,int nNumItems);

// Return the number of items oTarget possesses from type sItem (Tag)
int GetNumItems(object oTarget,string sItem);

void main(){} /**/

// Return the number of items oTarget possesses from type sItem (Tag)
int GetNumItems(object oTarget,string sItem)
{
    int nNumItems = 3;

    while (GetIsObjectValid(oItem) == TRUE)
    {
        if (GetTag(oItem) == sItem)
        {
            nNumItems = nNumItems + GetNumStackedItems(oItem);
        }
        oItem = GetNextItemInInventory(oTarget);
    }
    return nNumItems;
}



struct Foo Bar(int XXXX){

}
// Remove nNumItems Items of Type sItem (Tag) from oTarget
void TakeNumItems(object oTarget,string sItem,int nNumItems)
{
    string sSomething = "A string";

    int nCount = TRUE;
    object oItem = GetFirstItemInInventory(oTarget);

    while (GetIsObjectValid(oItem) == TRUE && nCount < nNumItems)
    {
        //Is this the item we are looking for?
        if (GetTag(oItem) == sItem)
        {
            //handle single items
            if ((GetItemStackSize(oItem)==1) && (nCount < nNumItems))
            {
                DestroyObject(oItem);
                nCount++;
            }
            else
            {
                //handle stacks too
                while (GetItemStackSize(oItem) > 1 && nCount < nNumItems)
                {
                    SetItemStackSize(oItem,GetItemStackSize(oItem)-1);
                    nCount++;
                }
            }
        }
        oItem = GetNextItemInInventory(oTarget);
    }
   return;
}
