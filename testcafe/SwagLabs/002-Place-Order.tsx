import { Selector } from 'testcafe';

import { LoginPage } from './page-models/login-page';
import { InventoryPage, ITEM_ELEM } from './page-models/inventory-page';
import { CartPage } from './page-models/cart-page';
import { CheckoutPage } from './page-models/checkout-page';
import { OverviewPage } from './page-models/overview-page';
import { CompletePage } from './page-models/complete-page';

fixture `SWAGLabs - User Login`
  .page `https://www.saucedemo.com/`;


test('Place order', async t => {
    const product = "Sauce Labs Backpack";
    
    await LoginPage.LoginUser("standard_user", "secret_sauce");
    await t.expect(Selector("#inventory_container").exists).ok;

    await InventoryPage.ClickElementByTitle(product, ITEM_ELEM.CART)
    await InventoryPage.ValidateCartText("1");
    await InventoryPage.ClickCartIcon();

    await CartPage.ValidateItemTitle(product);
    await CartPage.ValidateItemCount(1);
    await CartPage.ClickCheckout();

    await CheckoutPage.SetFirstName("FirstName");
    await CheckoutPage.SetLastName("LastName");
    await CheckoutPage.SetPostalCode("00000");
    await CheckoutPage.ClickContinue();

    await OverviewPage.ValidateItemTitle(product);
    await OverviewPage.ClickFinish();

    await CompletePage.ClickBackHome();

    await InventoryPage.ValidateCartText("");
});

