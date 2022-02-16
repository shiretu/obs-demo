const addon=require('../../../builders/build/Release/my_module.node')

console.log(addon)
console.log(addon.version())

try {
    console.log("Call test_obs")
    addon.test_obs()

    console.log("Call test_obs again. Should fail")
    addon.test_obs()

    console.log("We should not be here")
} catch (error) {
    console.log(error)
}
