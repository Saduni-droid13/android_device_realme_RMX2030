/*
 * Copyright (C) 2020 LineageOS Project
 * Copyright (C) 2020 Harshit Jain
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <vector>
#include <string>
#include <fstream>

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include <android-base/properties.h>
#include <android-base/logging.h>

#include "vendor_init.h"

struct r5x_props
{
    std::string build_description;
    std::string build_fingerprint;
    std::string device_build;
    std::string product_device;
};

std::vector<std::string> ro_props_default_source_order = {
    "",
    "odm.",
    "product.",
    "system.",
    "vendor.",
};

// bool hasNFC()
// {
//     // Check NFC
//     std::ifstream infile("/proc/touchpanel/NFC_CHECK");
//     std::string check;
//     bool ret = false;
//     getline(infile, check);
//     if (!check.compare("SUPPORTED"))
//         ret = true;
//     return ret;
// }

void property_override(char const prop[], char const value[], bool add = true)
{
    prop_info *pi;
    pi = (prop_info *)__system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else if (add)
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

void setRMX(unsigned int variant)
{
    r5x_props prop[3] = {};

    std::string build_desc = "coral-user 11 RP1A.201105.002-6869500-release-keys";
    std::string build_fp = "google/coral/coral:11/RP1A.201105.002/6869500:user/release-keys";

    //RMX1911
    prop[0] = {
        build_fp,
        build_desc,
        "RMX1911",
        "RMX1911EX",
    };

    //RMX1927
    prop[1] = {
        build_fp,
        build_desc,
        "RMX1927",
        "RMX1927EX",
    };

    //RMX1993
    prop[2] = {
        build_fp,
        build_desc,
        "RMX2030",
        "RMX2030EX",
    };

    const auto set_ro_build_prop = [](const std::string &source,
                                      const std::string &prop, const std::string &value) {
        auto prop_name = "ro." + source + "build." + prop;
        property_override(prop_name.c_str(), value.c_str(), false);
    };

    const auto set_ro_product_prop = [](const std::string &source,
                                        const std::string &prop, const std::string &value) {
        auto prop_name = "ro.product." + source + prop;
        property_override(prop_name.c_str(), value.c_str(), false);
    };

    property_override("ro.build.description", prop[variant].build_fingerprint.c_str());
    property_override("ro.build.product", prop[variant].product_device.c_str());
    for (const auto &source : ro_props_default_source_order)
    {
        set_ro_build_prop(source, "fingerprint", prop[variant].build_description.c_str());
        set_ro_product_prop(source, "device", prop[variant].product_device.c_str());
        set_ro_product_prop(source, "model", prop[variant].device_build.c_str());
    }
}

void vendor_load_properties()
{
    std::ifstream infile("/proc/oppoVersion/prjVersion");
    std::string prjVersion;
    getline(infile, prjVersion);

    if (prjVersion == "19743")
    {
        setRMX(2); //RMX2030
    }
    else if (prjVersion == "19632")
    {
        setRMX(1); //RMX1927
    }
    else
    {
        setRMX(0); //RMX1911
    }
}