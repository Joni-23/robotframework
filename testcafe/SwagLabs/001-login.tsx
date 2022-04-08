import { Selector } from 'testcafe';
import { LoginPage } from './page-models/login-page';

fixture `SWAGLabs - User Login`
  .page `https://www.saucedemo.com/`;


test('Login With Valid User', async t => {
    await LoginPage.LoginUser("standard_user", "secret_sauce");
    await t.expect(Selector("#inventory_container").exists).ok;
});

test('Login With Valid Locked User', async t => {
    await LoginPage.LoginUser("locked_out_user", "secret_sauce");
    await LoginPage.ValidateErrorMessage("Epic sadface: Sorry, this user has been locked out.");
});

test('Login Without Username', async t => {
    await LoginPage.InsertPassword("secret_sauce");
    await LoginPage.ClickLoginButton();

    await LoginPage.ValidateErrorMessage("Epic sadface: Username is required");
});

test('Login Without Password', async t => {
    await LoginPage.InsertUserName("standart_user");
    await LoginPage.ClickLoginButton();
    
    await LoginPage.ValidateErrorMessage("Epic sadface: Password is required");
});