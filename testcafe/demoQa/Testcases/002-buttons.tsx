import { Selector } from 'testcafe';

fixture `DemoQA - Buttons`
  .page `https://demoqa.com/buttons`;


test('Double Click Button', async t => {
        const btnId = "#doubleClickBtn";
        const msgId = "#doubleClickMessage";

        await t
                .click(btnId)
                .expect(Selector(msgId).exists).notOk()

                .rightClick(btnId)
                .expect(Selector(msgId).exists).notOk()
                
                .doubleClick(btnId)
                .expect(Selector(msgId).exists).ok();
});

test('Right Click Button', async t => {
        const btnId = "#rightClickBtn";
        const msgId = "#rightClickMessage";

        await t
                .click(btnId)
                .expect(Selector(msgId).exists).notOk()

                .doubleClick(btnId)
                .expect(Selector(msgId).exists).notOk()

                .rightClick(btnId)
                .expect(Selector(msgId).exists).ok();
});

test('Click Button', async t => {
        const btnId = "#dynamicClick";
        const msgId = "#dynamicClickMessage";

        await t
                .rightClick(btnId)
                .expect(Selector(msgId).exists).notOk()
                
                .doubleClick(btnId)
                .expect(Selector(msgId).exists).notOk()

                .click(btnId)
                .expect(Selector(msgId).exists).ok();
});