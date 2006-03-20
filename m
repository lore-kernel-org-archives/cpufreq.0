From: "Jan Beulich" <jbeulich@novell.com>
Subject: [PATCH] kernel crash in powernow-k8 after lost ticks detected
Date: Mon, 20 Mar 2006 14:43:52 +0100
Message-ID: <441EB1990200007800013DB9@emea1-mh.id2.novell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S964793AbWCTNoJ@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk
Cc: mark.langsdorf@amd.com, davej@redhat.com, Pavel Machek <pavel@suse.de>, linux-kernel@vger.kernel.org

Since powernowk8_cpu_init() gets called only for one of the two cores (the
other one is in the same policy set and hence cpufreq_add_dev() prevents the
call), calling other functions, namely powernowk8_get(), one CPUs that haven't
been initialized will yield a NULL from the respective powernow_data[] slot. In
the specific case, the problem occured after the system detected some lost
ticks and called cpufreq_get() for all CPUs.
While I can imagine more sophisticated fixes for this (it namely seems
questionable whether calling the init routines not on all CPUs, or, if that's
necessary, whether not properly setting up the data pointers for all affected
CPUs in powernow-k8 is okay), below simple change seems to address the
problem (the other hunk is to make a message more meaningful).

Signed-Off-By: Jan Beulich <jbeulich@novell.com>

Index: head-2006-03-13/drivers/cpufreq/cpufreq.c
===================================================================
--- head-2006-03-13.orig/drivers/cpufreq/cpufreq.c      2006-03-13 10:21:56.000000000 +0100
+++ head-2006-03-13/drivers/cpufreq/cpufreq.c   2006-03-15 08:59:42.000000000 +0100
@@ -689,7 +689,7 @@ static int cpufreq_add_dev (struct sys_d
               if (!cpu_online(j))
                       continue;

-               dprintk("CPU already managed, adding link\n");
+               dprintk("CPU %u already managed, adding link\n", j);
               cpufreq_cpu_get(cpu);
               cpu_sys_dev = get_cpu_sysdev(j);
               sysfs_create_link(&cpu_sys_dev->kobj, &policy->kobj,
@@ -921,7 +921,7 @@ unsigned int cpufreq_get(unsigned int cp

       mutex_lock(&policy->lock);

-       ret = cpufreq_driver->get(cpu);
+       ret = cpufreq_driver->get(policy->cpu);

       if (ret && policy->cur && !(cpufreq_driver->flags & CPUFREQ_CONST_LOOPS)) {
               /* verify no discrepancy between actual and saved value exists */
