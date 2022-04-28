import { t, Selector } from 'testcafe';

class CheckoutPage {

    //Set First Name field
    static async SetFirstName(fname: string){
        const fNameField = Selector('#first-name');
        await t.typeText(fNameField, fname);
    }
    
    //Set Last Name field
    static async SetLastName(lname: string){
        const lNameField = Selector('#last-name');
        await t.typeText(lNameField, lname);
    }

    //Set Postal Code field
    static async SetPostalCode(postCode: string){
        const postCodeField = Selector('#postal-code');
        await t.typeText(postCodeField, postCode);
    }

    //Click Cancel button
    static async ClickCancel(){
        await t.click('#cancel');
    }

    //Click Continue button
    static async ClickContinue(){
        await t.click('#continue');
    }
    
}

export { CheckoutPage }