import { t, Selector } from 'testcafe';

//Enum fields for selecting item elements
enum ITEM_ELEM {
    HEAD = ".inventory_item",
    TITLE = ".inventory_item_name",
    DESC = ".inventory_item_desc",
    PRICE = ".inventory_item_price",
    CART = ".btn"
}

class InventoryPage {

    //Private function to get Item element based elem parameter
    private static GetItemElement(name: string, elem: ITEM_ELEM){
        const item = Selector(ITEM_ELEM.TITLE).withText(name);
        const head = item.parent(ITEM_ELEM.HEAD);
        return head.find(elem);
    }

    //Private function to get Cart Icon
    private static GetCartIcon(){
        return Selector('.shopping_cart_link');
    }

    //Click element field based given title and element
    static async ClickElementByTitle(name: string, elem: ITEM_ELEM){
        await t.click(this.GetItemElement(name, elem));
    }

    //Click Cart Icon
    static async ClickCartIcon(){
        const cart = this.GetCartIcon();
        await t.click(cart);
    }

    //Check if Cart Icon text match with parameter
    static async ValidateCartText(expected: string){
        const count = this.GetCartIcon();
        await t.expect(count.innerText).eql(expected);
    }


}

export { InventoryPage, ITEM_ELEM }