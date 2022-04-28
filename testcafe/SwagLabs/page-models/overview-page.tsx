import { t, Selector } from 'testcafe';

class OverviewPage {

    //Check if Item is found given parameter
    static async ValidateItemTitle(expected: string){
        const itemExists = Selector('.inventory_item_name').withText(expected).exists;
        await t.expect(itemExists).ok();
    }

    //Click Finish button
    static async ClickFinish(){
        await t.click('#finish');
    }
}

export { OverviewPage }