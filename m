From: dirk.brandewie@gmail.com
Subject: [PATCH 0/6] Add P state driver for Intel Core Processors
Date: Fri,  1 Feb 2013 10:45:34 -0800
Message-ID: <1359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer;
        bh=Gc519fv+tQ5YNHVcBZQIrZTj5KrRsdhmz+DxXCFA82U=;
        b=exACVX5DMQeYW2pVMztdaUdJhaJEjkO3jhKn0FGBcvUmIwWEDERIZYPtrV4FGM4yn1
         TkexxeXN7QH0wU3MOYi29hiwa2Iksr+yQsUJT9yWw20V4qUyfm1fSrUkqFESeu4EtZsm
         7az+8B5S3z0HtpUAgJ6eD6lW8g2aIX1OzPggAl3s6X/wckEqnAbtERb12qs+sAfsKLIM
         PbDCUY4TqdIAP88WQXjrZLRhbbl//SDol3e6707mShYr+/12prTzuX+is/bwTGfLElGR
         /f2rR18UHfJn6EyQZOvNnZbY/a7Y7j3KdmFY7mvNpt4ltv7/1GlkGKNibo0QPuER7JFx
         bGvA==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>

From: Dirk Brandewie <dirk.brandewie@gmail.com>

This driver implements a scaling driver with an internal governor for
Intel Core processors.  The driver follows the same model as the
Transmeta scaling driver (longrun.c) and implements the setpolicy()
instead of target().  Scaling drivers that implement setpolicy() are
assmuned to implement internal governors by the cpufreq core. All the
logic for selecting the current P state is contained within the driver
no external governor is used by the cpufreq core.

At the moment only Intel SandyBridge processors are supported. As
testing on SandyBridge+ processors is completed support will be added
to the driver.

New sysfs files for controlling P state selection have been added to
/sys/devices/system/cpu/intel_pstate/
      max_perf_pct: limits the maximum P state that will be requested by
      the driver stated as a percentage of the avail performance.
    
      min_perf_pct: limits the minimum P state that will be  requested by
      the driver stated as a percentage of the avail performance.
    
      no_turbo: limits the driver to selecting P states below the turbo
      frequency range.

The units for these for these files are purposely abstract and stated
in terms of available performance and not frequency.  In idea that
frequency can be set to a single frequency is a fiction for Intel Core
processors. Even if the scaling driver selects a single P state the
actual frequency the processor will run at is selected by the
processor itself.

Based on v3.8-rc5.
Patches 1-5:
     Fix issues related to scaling drivers that implement the
     setpolicy() interface instead of target() when CONFIG_SMP and
     CONFIG_HOTPLUG_CPU are set.

Patch 6:
     The driver and associated config glue.

Dirk Brandewie (6):
  cpufreq: Retrieve current frequency from scaling drivers with
    internal governors
  cpufreq: Only query drivers that implement cpufreq_driver.target()
  cpufreq: Do not track governor name for scaling drivers with internal
    governors.
  cpufreq_stats: Do not track policies without associated governors.
  cpufreq: balance out cpufreq_cpu_{get,put} for scaling drivers using
    setpolicy
  cpufreq/x86: Add P-state driver for sandy bridge.

 drivers/cpufreq/Kconfig.x86     |   18 +
 drivers/cpufreq/Makefile        |    1 +
 drivers/cpufreq/cpufreq.c       |   43 ++-
 drivers/cpufreq/cpufreq_stats.c |    4 +-
 drivers/cpufreq/intel_pstate.c  |  830 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 880 insertions(+), 16 deletions(-)
 create mode 100644 drivers/cpufreq/intel_pstate.c

-- 
1.7.7.6

