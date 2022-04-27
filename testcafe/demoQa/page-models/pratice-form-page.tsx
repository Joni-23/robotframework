import { t, Selector } from 'testcafe';

enum GENDER {
    Male = "Male",
    Female = "Female",
    Other = "Other"
}

enum HOBBIES {
    Sport = "1",
    Reading = "2",
    Music = "3"
}

class PraticeForm {
    
    static async SetFirstName(fname: string){
        await t.typeText('#firstName', fname);
    }

    static async SetLastName(lname: string){
        await t.typeText('#lastName', lname);
    }

    static async SetEmail(email: string){
        await t.typeText('#userEmail', email);
    }

    static async SetGender(gender: GENDER){
        const elem = Selector('input').withAttribute('value', gender);
        await t.click(elem);
    }

    static async SetMobile(mobile: string){
        await t.typeText('#userNumber', mobile);
    }

    static async SetDateOfBirth(dob: Date){
        
    }

    static async SetSubjects(subject: string){
        await t.typeText('#subjectsInput', subject);
    }

    static async SetHobbies(hobby: HOBBIES){
        const id = '#hobbies-checkbox-' + hobby;
        await t.click(id);
    }

    static async SetCurrentAddress(address: string){
        await t.typeText('#currentAddress', address);
    }

    static async ClickSubmit(){
        await t.click('#submit');
    }

    static async ValidateForm(field: string, value: string){
        const elem = Selector('td').withExactText(field).nextSibling(0);
        await t.expect(elem.innerText).eql(value);
    }
}

export { PraticeForm, GENDER, HOBBIES }