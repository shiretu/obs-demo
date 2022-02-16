#include <napi.h>
#include <obs.h>

Napi::String callback_version(const Napi::CallbackInfo& info) { return Napi::String::New(info.Env(), "0.0.1"); }
void callback_test_obs(const Napi::CallbackInfo& info) {
	if (!obs_startup("en-US", nullptr, nullptr))
		Napi::Error::New(info.Env(), "obs_startup() failed");
}

Napi::Object PlugApi(Napi::Env env, Napi::Object exports) {
	exports.Set(Napi::String::New(env, "version"), Napi::Function::New(env, callback_version));
	exports.Set(Napi::String::New(env, "test_obs"), Napi::Function::New(env, callback_test_obs));
	return exports;
}

NODE_API_MODULE(my_module, PlugApi)
