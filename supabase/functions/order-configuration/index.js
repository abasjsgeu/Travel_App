"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g = Object.create((typeof Iterator === "function" ? Iterator : Object).prototype);
    return g.next = verb(0), g["throw"] = verb(1), g["return"] = verb(2), typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (g && (g = 0, op[0] && (_ = 0)), _) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
var supabase_js_2_48_1_1 = require("https://esm.sh/@supabase/supabase-js@2.48.1");
var google_auth_library_8_7_0_1 = require("https://cdn.skypack.dev/google-auth-library@8.7.0");
var serviceAccount = (await Promise.resolve().then(function () { return require("../service-account.json"); })).default;
var supabase = (0, supabase_js_2_48_1_1.createClient)(Deno.env.get("https://ictrjvtqluagfksjsrcr.supabase.co"), Deno.env.get("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImljdHJqdnRxbHVhZ2Zrc2pzcmNyIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczNzQ4NTA0MSwiZXhwIjoyMDUzMDYxMDQxfQ.lXVTawhTq6SzJjidKLLbVVJvI4Fwn_YxqddOp9jY7gw"));
Deno.serve(function (req) { return __awaiter(void 0, void 0, void 0, function () {
    var payload, data, fcmToken, accessToken, res, resData;
    return __generator(this, function (_a) {
        switch (_a.label) {
            case 0: return [4 /*yield*/, req.json()];
            case 1:
                payload = _a.sent();
                console.log(payload); // طباعة نص
                return [4 /*yield*/, supabase
                        .from("profiles")
                        .select("fcm_token, email")
                        .eq("id", payload.record.user_id)
                        .single()];
            case 2:
                data = (_a.sent()).data;
                fcmToken = data.fcm_token;
                return [4 /*yield*/, getAccessToken({
                        clientEmail: serviceAccount.client_email,
                        privateKey: serviceAccount.private_key,
                    })];
            case 3:
                accessToken = _a.sent();
                return [4 /*yield*/, fetch("https://fcm.googleapis.com/v1/projects/".concat(serviceAccount.project_id, "/messages:send"), {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json",
                            Authorization: "Bearer ".concat(accessToken),
                        },
                        body: JSON.stringify({
                            message: {
                                token: fcmToken,
                                notification: {
                                    title: "Hi! ".concat(data === null || data === void 0 ? void 0 : data.email),
                                    body: "أقوى لعروض من شركة" + "   " + payload.record.body,
                                },
                            },
                        }),
                    })];
            case 4:
                res = _a.sent();
                return [4 /*yield*/, res.json()];
            case 5:
                resData = _a.sent();
                if (res.status < 200 || res.status > 299) {
                    throw resData;
                }
                return [2 /*return*/, new Response(JSON.stringify(resData), {
                        headers: { "Content-Type": "application/json" },
                    })];
        }
    });
}); });
var getAccessToken = function (_a) {
    var clientEmail = _a.clientEmail, privateKey = _a.privateKey;
    return new Promise(function (resolve, reject) {
        var jwtClient = new google_auth_library_8_7_0_1.JWT({
            email: clientEmail,
            key: privateKey,
            scopes: ["https://www.googleapis.com/auth/firebase.messaging"],
        });
        // deno-lint-ignore no-explicit-any
        jwtClient.authorize(function (err, tokens) {
            if (err) {
                reject(err);
                return;
            }
            resolve(tokens.access_token);
        });
    });
};
//--------------
