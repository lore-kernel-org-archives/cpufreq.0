From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 0/2] CPUFreq core fixes for v3.10-rc2
Date: Tue, 30 Apr 2013 20:02:16 +0530
Message-ID: <cover.1367332148.git.viresh.kumar@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl
Cc: linaro-kernel@lists.linaro.org, patches@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, charles.garcia-tobin@arm.com, arvind.chauhan@arm.com, Viresh Kumar <viresh.kumar@linaro.org>

I just saw your pull request and so these should go in rc2 now.

These are fixes for cpufreq core and common governor part. They mostly impact
systems which have set have_governor_per_policy to true. i.e. big LITTLE cpufreq
driver.

Viresh Kumar (2):
  cpufreq: governors: Fix CPUFREQ_GOV_POLICY_{INIT|EXIT} notifiers
  cpufreq: Issue CPUFREQ_GOV_POLICY_EXIT notifier before dropping
    policy refcount

 drivers/cpufreq/cpufreq.c          |  6 +++---
 drivers/cpufreq/cpufreq_governor.c | 11 +++++++----
 drivers/cpufreq/cpufreq_governor.h |  1 +
 3 files changed, 11 insertions(+), 7 deletions(-)

-- 
1.7.12.rc2.18.g61b472e

