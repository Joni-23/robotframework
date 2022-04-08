import { t, Selector } from 'testcafe';

class LoginPage {
    static url = 'https://www.saucedemo.com/';

    static async InsertUserName(usr: string){
        await t.typeText('#user-name', usr);
    }

    static async InsertPassword(pwd: string){
        await t.typeText('#password', pwd);
    }

    static async ClickLoginButton(){
        await t.click('#login-button');
    }

    static async ValidateErrorMessage(expected: string) {
        const errorMessage = Selector("h3").withAttribute("data-test", "error");
        await t.expect(errorMessage.innerText).eql(expected);
    }

    static async LoginUser(usr: string, pwd: string){
       await this.InsertUserName(usr);
       await this.InsertPassword(pwd);
       await this.ClickLoginButton();
    }

    static async LoginDefaultUser(){
        await this.LoginUser('standard_user', 'secret_sauce');
    }
}

export { LoginPage }