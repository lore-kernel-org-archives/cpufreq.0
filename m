From: Fengguang Wu <fengguang.wu@intel.com>
Subject: 48ed83b84da: scaling_governor write error
Date: Fri, 17 Oct 2014 10:25:47 +0800
Message-ID: <20141017022547.GA8005@wfg-t540p.sh.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="rwEMma7ioTxnRzrJ"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, lkp@01.org, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Viresh,

FYI, our test script is broken by a commit from you:

https://git.linaro.org/people/vireshk/linux cpufreq/governor-fixes
commit 48ed83b84da331d010c5bd10b9d2f72d5308bddd ("cpufreq: Track governor-state to disallow invalid state requests")


ee46f1592843a04d  48ed83b84da331d010c5bd10b9 
----------------  -------------------------- 
       fail:runs  %reproduction    fail:runs
           |             |             |
           :5          100%           5:5     TOTAL stderr./lkp/lkp/src/setup/cpufreq_governor:line#:echo:write_error:Invalid_argument

The error messages are:

 /lkp/wfg/src/setup/cpufreq_governor: line 9: echo: write error: Device or resource busy
 /lkp/wfg/src/setup/cpufreq_governor: line 9: echo: write error: Device or resource busy
 /lkp/wfg/src/setup/cpufreq_governor: line 9: echo: write error: Device or resource busy

where the cpufreq_governor script is
 
        #!/bin/bash

        scaling_governor=$1
        [[ $scaling_governor ]] || exit 0

        for file in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
        do
                note "echo $scaling_governor > $file"
==>             echo $scaling_governor > $file
        done

Thanks,
Fengguang

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=reproduce

echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo performance > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo performance > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo performance > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor

--rwEMma7ioTxnRzrJ--
