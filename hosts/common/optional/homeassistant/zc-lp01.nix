{ config, lib, pkgs, ... }:

let
  zigbee2mqttFile = pkgs.writeText "ZC-LP01.js" ''
    const fz = require('zigbee-herdsman-converters/converters/fromZigbee');
const tz = require('zigbee-herdsman-converters/converters/toZigbee');
const exposes = require('zigbee-herdsman-converters/lib/exposes');
const reporting = require('zigbee-herdsman-converters/lib/reporting');
const tuya = require('zigbee-herdsman-converters/lib/tuya');
const modernExtend = require('zigbee-herdsman-converters/lib/modernExtend');
const e = exposes.presets;
const ea = exposes.access;

const definition = {
    zigbeeModel: [
        '5rta89nj' // Tubular motors
    ],
    fingerprint: [
// Curtain motors:
        {modelID: 'TS0601', manufacturerName: '_TZ3210_5rta89nj'},
    ],
    model: 'ZC-LP01',
    vendor: 'Moes',
    description: 'window pusher',
    fromZigbee: [tuya.fz.datapoints],
    toZigbee: [tuya.tz.datapoints],
    onEvent: tuya.onEventSetTime,
    configure: tuya.configureMagicPacket,
    exposes: [
        e.battery(),
        e.cover_position('position', 'state', ea.STATE_SET,['OPEN', 'CLOSE', 'STOP']).withDescription('Window Control'),
        e.enum('alarm_mode', ea.STATE_SET, ['True', 'False']),
        e.binary('charge_state', ea.STATE, 'charging', 'discharging'),
        e.enum('manual_mode', ea.STATE_SET, ['True', 'False']),
        e.binary('fault', ea.STATE, ['Motor Fault', 'Clear']).withDescription('Fault'),
        e.numeric('countdown', ea.STATE_SET).withValueMin(10).withValueMax(90).withDescription('Mortor timeout').withUnit('s'),
        e.enum('motor_direction', ea.STATE_SET, ['left', 'right']).withDescription('Install Side Type'),
        e.enum('mode', ea.STATE_SET, ['True', 'False']).withDescription('Slow_stop'),
        e.numeric('current', ea.STATE).withValueMin(0).withValueMax(99999).withDescription('Solar Energy Current'),
        e.enum('window_detection', ea.STATE, ['Opened', 'Closed', 'Pending']).withDescription('Window Detection'),
        
    ],
    meta: {
        // All datapoints go in here
        tuyaSendCommand: 0x04,
        tuyaDatapoints: [
            [4, 'battery', tuya.valueConverter.raw],
            [102, 'state', tuya.valueConverterBasic.lookup({'OPEN': tuya.enum(0), 'CLOSE': tuya.enum(1), 'STOP': tuya.enum(2)})],
            [103, 'alarm_mode', tuya.valueConverterBasic.lookup({'True': tuya.enum(0), 'False': tuya.enum(1),})],
            [104, 'position', tuya.valueConverter.coverPosition],
            [104, 'position', tuya.valueConverter.raw],
            [105, 'charge_state', tuya.valueConverter.trueFalse1],
            [106, 'manual_mode', tuya.valueConverterBasic.lookup({'True': tuya.enum(0), 'False': tuya.enum(1),})],
            [107, 'fault', tuya.valueConverter.trueFalse1],
            [108, 'countdown', tuya.valueConverter.raw],
            [109, 'motor_direction', tuya.valueConverterBasic.lookup({'left': tuya.enum(0), 'right': tuya.enum(1)})],
            [110, 'mode', tuya.valueConverterBasic.lookup({'True': tuya.enum(1), 'False': tuya.enum(0)})],
            [111, 'current', tuya.valueConverter.divideBy1000],
            [114, 'window_detection', tuya.valueConverterBasic.lookup({Open: 0, Close: 1, Stop: 2})],
            ],
    },
    extend: [
        // A preferred new way of extending functionality.
    ],
};

module.exports = definition;
  '';
in
{
  system.activationScripts = {
    z2mconfig.text = ''
    cp ${zigbee2mqttFile} /var/lib/zigbee2mqtt/ZC-LP01.js
    '';
  };
}
