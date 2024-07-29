import UAParser from "ua-parser-js";

const uagent = new UAParser().getResult();
const userAgent = uagent.ua;
const browser = JSON.stringify(uagent.browser);
const cpu = uagent.cpu.architecture;
const device = JSON.stringify(uagent.device);
const engine = JSON.stringify(uagent.engine);
const platform = JSON.stringify(uagent.os);
const language = navigator.languages[0];
const timeZone = Intl.DateTimeFormat().resolvedOptions().timeZone;
export { browser, cpu, device, engine, platform, language, timeZone };
export default userAgent;
