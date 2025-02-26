const {KEBConfig, KEBClient, provisionSKR}= require('../../kyma-environment-broker');
const {GardenerClient, GardenerConfig} = require('../../gardener');
const {DirectorClient, DirectorConfig} = require('../../compass');
const {addScenarioInCompass, assignRuntimeToScenario} = require('../../compass');
const {KCPWrapper, KCPConfig} = require('../../kcp/client');
const {BTPOperatorCreds} = require('../../smctl/helpers');

const keb = new KEBClient(KEBConfig.fromEnv());
const gardener = new GardenerClient(GardenerConfig.fromEnv());
const director = new DirectorClient(DirectorConfig.fromEnv());
const kcp = new KCPWrapper(KCPConfig.fromEnv());

async function provisionSKRInstance(options, timeout) {
  try {
    const btpOperatorCreds = BTPOperatorCreds.fromEnv();

    console.log(`\nInstanceID ${options.instanceID}`,
        `Runtime ${options.runtimeName}`, `Application ${options.appName}`, `Suffix ${options.suffix}`);

    const skr = await provisionSKR(keb,
        kcp, gardener,
        options.instanceID,
        options.runtimeName,
        null,
        btpOperatorCreds,
        options.customParams,
        timeout);
    const shoot = skr.shoot;

    await addScenarioInCompass(director, options.scenarioName);
    await assignRuntimeToScenario(director, shoot.compassID, options.scenarioName);
    return shoot;
  } catch (e) {
    throw new Error(`Provisioning failed: ${e.toString()}`);
  } finally {
    const runtimeStatus = await kcp.getRuntimeStatusOperations(options.instanceID);
    console.log(`\nRuntime status after provisioning: ${runtimeStatus}`);
    await kcp.reconcileInformationLog(runtimeStatus);
  }
}


module.exports = {
  keb,
  kcp,
  director,
  gardener,
  provisionSKRInstance,
};

