trigger CaseTrigger on Case (before update, before insert) {
    new CaseTriggerHandler().run();
}