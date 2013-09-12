From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 0/5] cpufreq: Last minute fixes for 3.12
Date: Thu, 12 Sep 2013 10:55:43 +0530
Message-ID: <cover.1378963070.git.viresh.kumar@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl, swarren@wwwdotorg.org, srivatsa.bhat@linux.vnet.ibm.com
Cc: linaro-kernel@lists.linaro.org, patches@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>

Hi Rafael/Srivatsa,

These are some last minute fixes for 3.12. I have found them while looking at
the code to fix the latest suspend/resume crashes we see (Reported by Stephen)..

I believe at some place these are behind those crashes, otherwise people with a
single cluster or single policy couldn't have faced it.. Like Stephen as he was
working on Tegra.

I thought you will wait for my conversation with Srivatsa to get over before
actually applying his patches, but saw that just happened :)

No issues, we can talk a bit more about the problems for now and then you can
get whatever patches are required for 3.12-rc2

First three of the patchset are minor cleanups (you may or may not take them for
3.12), but last two are some real fixes.. I haven't faced any issue without them
but simply found them in code review.

@Stephen: Probably you can try my branch: cpufreq-suspend-fix, which has these
patches without Srivatsa's patches (though some bits of those will also be
required I believe for multicluster systems)..

--
viresh

Viresh Kumar (5):
  cpufreq: Remove extra blank line
  cpufreq: don't break string in print statements
  cpufreq: remove __cpufreq_remove_dev()
  cpufreq: don't update policy->cpu while removing while removing other
    CPUs
  cpufreq: use correct values of cpus in __cpufreq_remove_dev_finish()

 drivers/cpufreq/cpufreq.c | 50 +++++++++++++++++++----------------------------
 1 file changed, 20 insertions(+), 30 deletions(-)

-- 
1.7.12.rc2.18.g61b472e

