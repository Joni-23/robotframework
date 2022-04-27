import { platform } from 'os';
import { Selector } from 'testcafe';
import { PraticeForm, GENDER, HOBBIES} from '../page-models/pratice-form-page';

fixture `DemoQA - Pratice Form`
  .page `https://demoqa.com/automation-practice-form`;


test('Double Click Button', async t => {
        const fName = "First Name";
        
        PraticeForm.SetFirstName("FirstName");
        PraticeForm.SetLastName("LastName");
        PraticeForm.SetEmail("Someemail@email.com");
        PraticeForm.SetGender(GENDER.Other);
        PraticeForm.SetMobile("0000000000");
        PraticeForm.SetSubjects("Dont know");
        PraticeForm.SetHobbies(HOBBIES.Sport);
        PraticeForm.SetHobbies(HOBBIES.Reading);
        PraticeForm.SetCurrentAddress("Address 404, Fantasyland");
        PraticeForm.ClickSubmit();

        PraticeForm.ValidateForm("Student Name", "FirstName LastName");
        PraticeForm.ValidateForm("Studen Email", "someemail@email.com");
        PraticeForm.ValidateForm("Gender", "Other");
        PraticeForm.ValidateForm("Mobile", "0000000000");
        PraticeForm.ValidateForm("Date of Birth", "27 April,2022");
        PraticeForm.ValidateForm("Subjects", "Dont know");
        PraticeForm.ValidateForm("Hobbies", "Sports, Reading");
        PraticeForm.ValidateForm("Address", "Address 404, Fantasyland");
});

