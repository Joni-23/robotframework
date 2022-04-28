import { t, Selector } from 'testcafe';

class CartPage {

    //Check if item is found given string
    static async ValidateItemTitle(expected: string){
        const itemExists = Selector('.inventory_item_name').withText(expected).exists;
        await t.expect(itemExists).ok();
    }
    
    //Check if cart page row count match with given number
    static async ValidateItemCount(expected: number){
        const items = Selector('.cart_item');
        await t.expect(items.count).eql(expected);
    }

    //Click Continue Shopping button
    static async ClickContinueShopping(){
        await t.click('#continue-shopping');
    }

    //Click Checkout button
    static async ClickCheckout(){
        await t.click('#checkout');
    }


}

export { CartPage }