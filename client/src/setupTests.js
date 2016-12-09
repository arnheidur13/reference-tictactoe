import inject from "common/framework/inject";

window.console.log=window.console.log;

window.iit = function(testName, tf){
    console.log("Ignoring test <" + testName + ">")
}; // Use to ignore tests

window.inject = inject;