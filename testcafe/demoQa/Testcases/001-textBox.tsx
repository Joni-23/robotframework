import { Selector } from 'testcafe';

fixture `DemoQA - Text Box`
  .page `https://demoqa.com/text-box`;


test('Correctly Filled Form', async t => {
    const name = "Robot Test Cafe";
    const email = "testcafe@testcafe.com";
    const curAdd = "TestCafe 100, Robotland";
    const perAdd = "Address not found 404";
    
    await t
            .typeText("#userName", name)
            .typeText("#userEmail", email)
            .typeText("#currentAddress", curAdd)
            .typeText("#permanentAddress", perAdd)
            .click('#submit');
    
    await t
            .expect(Selector("#output").find("#name").innerText).contains(name)
            .expect(Selector("#output").find("#email").innerText).contains(email)
            .expect(Selector("#output").find("#currentAddress").innerText).contains(curAdd)
            .expect(Selector("#output").find("#permanentAddress").innerText).contains(perAdd)
});

test('Fill with incorrect email', async t => {
    const name = "Robot Test Cafe";
    const email = "email";
    const curAdd = "TestCafe 100, Robotland";
    const perAdd = "Address not found 404";
    
    await t
            .expect(Selector("#userEmail").hasClass("field-error")).notOk()
            .typeText("#userName", name)
            .typeText("#userEmail", email)
            .typeText("#currentAddress", curAdd)
            .typeText("#permanentAddress", perAdd)
            .click('#submit');
    
    await t
            .expect(Selector("#userEmail").hasClass("field-error")).ok()
            .expect(Selector("#output").childNodeCount).lte(1, "Validate that information is not found")
});