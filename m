From: Antti P Miettinen <amiettinen@nvidia.com>
Subject: [PATCH 0/6] RFC: CPU frequency min/max as PM QoS params
Date: Fri,  6 Jan 2012 12:03:48 +0200
Message-ID: <1325844234-478-1-git-send-email-amiettinen@nvidia.com>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com
Cc: cpufreq@vger.kernel.org

I guess I should have sent this to you too. Only sent to linux-pm.

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

	--Antti

Alex Frid (1):
  PM QoS: Simplify PM QoS expansion/merge

Antti P Miettinen (5):
  PM QoS: Add CPU frequency min/max as PM QoS params
  cpufreq: Export user_policy min/max
  cpufreq: Preserve sysfs min/max request
  cpufreq: Enforce PM QoS min/max limits
  input: CPU frequency booster

 drivers/cpufreq/cpufreq.c     |   57 +++++++++++++-
 drivers/input/Kconfig         |    9 ++
 drivers/input/Makefile        |    1 +
 drivers/input/input-cfboost.c |  174 +++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_qos.h        |   19 ++++-
 kernel/power/qos.c            |   55 ++++++++++----
 6 files changed, 293 insertions(+), 22 deletions(-)
 create mode 100644 drivers/input/input-cfboost.c

-- 
1.7.4.1

