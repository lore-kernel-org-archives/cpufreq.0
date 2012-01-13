From: Antti P Miettinen <amiettinen@nvidia.com>
Subject: [PATCH v2 0/8] RFC: CPU frequency min/max as PM QoS params
Date: Fri, 13 Jan 2012 14:59:11 +0200
Message-ID: <1326459559-5436-1-git-send-email-amiettinen@nvidia.com>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com, cpufreq@vger.kernel.org, pavel@ucw.cz, rjw@sisk.pl, len.brown@intel.com, linux-pm@vger.kernel.org
Cc: mgross@linux.intel.com

The inspiration for this patch series is the N9 CPU frequency boost
upon input events:

http://www.spinics.net/lists/cpufreq/msg00667.html

and the related changes in git://codeaurora.org/kernel/msm.git tree.
Those patches modify the ondemand cpufreq governor. This patch series
adds minimum and maximum CPU frequency as PM QoS parameters and
modifies the cpufreq core to enforce the PM QoS limits. There is also
an example module for boosting the frequency upon input events.

I've been testing these changes against Ubuntu 3.2 kernel on a Dell
E6420 with the ACPI cpufreq driver. The patches are against
linux-next/master, compile tested against it.

V2:
* split min and max to separate commits
* handle PM QoS min above max as max
* handle PM QoS max below min as min

	--Antti

Alex Frid (1):
  PM QoS: Simplify PM QoS expansion/merge

Antti P Miettinen (7):
  PM QoS: Add CPU frequency minimum as PM QoS param
  cpufreq: Export user_policy min/max
  cpufreq: Preserve sysfs min/max request
  cpufreq: Enforce PM QoS minimum limit
  input: CPU frequency booster
  PM QoS: Add CPU frequency maximum as PM QoS param
  cpufreq: Enforce PM QoS maximum frequency

 drivers/cpufreq/cpufreq.c     |   59 +++++++++++++-
 drivers/input/Kconfig         |    9 ++
 drivers/input/Makefile        |    1 +
 drivers/input/input-cfboost.c |  174 +++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_qos.h        |   19 ++++-
 kernel/power/qos.c            |   55 ++++++++++----
 6 files changed, 295 insertions(+), 22 deletions(-)
 create mode 100644 drivers/input/input-cfboost.c

-- 
1.7.4.1

