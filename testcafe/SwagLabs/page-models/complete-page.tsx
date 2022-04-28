import { t, Selector } from 'testcafe';

class CompletePage {

    //Click Back Home Button
    static async ClickBackHome(){
        await t.click('#back-to-products');
    }
}

export { CompletePage }