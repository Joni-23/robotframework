import { t, Selector } from 'testcafe';

class LoginPage {

    //Insert username
    static async InsertUserName(usr: string){
        await t.typeText('#user-name', usr);
    }

    //insert password
    static async InsertPassword(pwd: string){
        await t.typeText('#password', pwd);
    }

    //Click Login button
    static async ClickLoginButton(){
        await t.click('#login-button');
    }

    //Check if error message equals with parameter
    static async ValidateErrorMessage(expected: string) {
        const errorMessage = Selector("h3").withAttribute("data-test", "error");
        await t.expect(errorMessage.innerText).eql(expected);
    }

    //Log in user with given username and password
    static async LoginUser(usr: string, pwd: string){
       await this.InsertUserName(usr);
       await this.InsertPassword(pwd);
       await this.ClickLoginButton();
    }

    //Default Login function
    static async LoginDefaultUser(){
        await this.LoginUser('standard_user', 'secret_sauce');
    }
}

export { LoginPage }