From: Timo <timo@iera.de>
Subject: Slow CPU
Date: Wed, 24 Aug 2011 15:25:13 +0200
Message-ID: <1314192313.2937.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

Hi,

when I use the battery with my notebook, Im unable to set a cpu
frequency and the cpu is stuck at 800 Mhz. Using the performance
governor doesnt change anything. How can I set a higher frequency?

This is the output
root@portable:~# LC_ALL=C cpufreq-info 
cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: powernow-k8
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 109 us.
  hardware limits: 800 MHz - 2.00 GHz
  available frequency steps: 2.00 GHz, 1.80 GHz, 1.60 GHz, 800 MHz
  available cpufreq governors: userspace, conservative, powersave,
ondemand, performance
  current policy: frequency should be within 800 MHz and 800 MHz.
                  The governor "userspace" may decide which speed to use
                  within this range.
  current CPU frequency is 800 MHz (asserted by call to hardware).


Thanks a lot,

Timo


