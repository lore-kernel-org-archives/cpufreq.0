From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: next-20130206 cpufreq - WARN in sysfs_add_one
Date: Thu, 7 Feb 2013 13:11:52 +0530
Message-ID: <CAOh2x=mjTX3hM0uxJh9qk=9OUWqZaAjAV57r2H4AgH+ZjY+eCg@mail.gmail.com>
References: <9180.1360172675@turing-police.cc.vt.edu>
	<17233164.aBDzy1OViI@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=Jrjry0NCDh74ayymLMpKryAsbDjU3//YOwAdkAQaN1I=;
        b=0hXv40M3Ajs+SGEtteXqMTVwZcAfmO7yj03QNp5CTncm+X2VoY7rVAHHxi1SVDoWBO
         GmCaHfHqbU/Pb7qsDvw6XB/8KqGxRNt73vPKXanIjrygfxovQSJa9vnE2opCJxTFgxIX
         uiEMR3Ax/4pQWdJUQLWzZGP7+PS8xcYxn2mOoN/v+VVfyu3WDdNPrXTbzg3dvb3F1jeP
         sQEjVUnrbfL9ujqyFOGbSK7NvQP+g+PbAc68vzYuXeR9/4ZqxullzUGw+eqrZXBiGBBl
         Xafdo3cilZWMuwz6Axh6jT3hqw7UFVnnU+BoEvgryWI74YxA9EXYvffyxU5JiLEZn0Yq
         T30g==
In-Reply-To: <17233164.aBDzy1OViI@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Valdis Kletnieks <Valdis.Kletnieks@vt.edu>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

On Thu, Feb 7, 2013 at 2:54 AM, Rafael J. Wysocki <rjw@sisk.pl> wrote:
> On Wednesday, February 06, 2013 12:44:35 PM Valdis Kletnieks wrote:
>> Seen in dmesg.  next-20130128 was OK. Haven't done a bisect, but can
>> do so if the offender isn't obvious...
>
> I suppose this is 73bf0fc "cpufreq: Don't remove sysfs link for policy->cpu".

Not really. :)

Hi Valdis,

First of all i want to confirm something about your system. I am sure it is a
multi-policy system (or multi cluster system). i.e. there are more than one
clock line for different cpus ? And so multiple struct policy exist
simultaneously.

Because this crash can only come on those.

Anyway, i have tested and pushed a fix here:

http://git.linaro.org/gitweb?p=people/vireshk/linux.git;a=shortlog;h=refs/heads/for-valdis

Please test it.

For others, the patch is:

commit 007dda326f1b1415846671d7fcfbd520f4f16151
Author: Viresh Kumar <viresh.kumar@linaro.org>
Date:   Thu Feb 7 12:51:27 2013 +0530

    cpufreq: governors: Fix WARN_ON() for multi-policy platforms

    On multi-policy systems there is a single instance of governor for both the
    policies (if same governor is chosen for both policies). With the
code update
    from following patches:

    8eeed09 cpufreq: governors: Get rid of dbs_data->enable field
    b394058 cpufreq: governors: Reset tunables only for
cpufreq_unregister_governor()

    We are creating/removing sysfs directory of governor for for every call to
    GOV_START and STOP. This would fail for multi-policy system as there is a
    per-policy call to START/STOP.

    This patch reuses the governor->initialized variable to detect
total users of
    governor.

    Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/cpufreq.c          |  6 ++++--
 drivers/cpufreq/cpufreq_governor.c | 32 +++++++++++++++++++-------------
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index ccc598a..3b941a1 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1567,8 +1567,10 @@ static int __cpufreq_governor(struct
cpufreq_policy *policy,
                                                policy->cpu, event);
        ret = policy->governor->governor(policy, event);

-       if (!policy->governor->initialized && (event == CPUFREQ_GOV_START))
-               policy->governor->initialized = 1;
+       if (event == CPUFREQ_GOV_START)
+               policy->governor->initialized++;
+       else if (event == CPUFREQ_GOV_STOP)
+               policy->governor->initialized--;

        /* we keep one module reference alive for
                        each CPU governed by this CPU */
diff --git a/drivers/cpufreq/cpufreq_governor.c
b/drivers/cpufreq/cpufreq_governor.c
index e4a306c..5a76086 100644
--- a/drivers/cpufreq/cpufreq_governor.c
+++ b/drivers/cpufreq/cpufreq_governor.c
@@ -247,11 +247,13 @@ int cpufreq_governor_dbs(struct dbs_data *dbs_data,
                                             dbs_data->gov_dbs_timer);
                }

-               rc = sysfs_create_group(cpufreq_global_kobject,
-                               dbs_data->attr_group);
-               if (rc) {
-                       mutex_unlock(&dbs_data->mutex);
-                       return rc;
+               if (!policy->governor->initialized) {
+                       rc = sysfs_create_group(cpufreq_global_kobject,
+                                       dbs_data->attr_group);
+                       if (rc) {
+                               mutex_unlock(&dbs_data->mutex);
+                               return rc;
+                       }
                }

                /*
@@ -262,13 +264,15 @@ int cpufreq_governor_dbs(struct dbs_data *dbs_data,
                        cs_dbs_info->down_skip = 0;
                        cs_dbs_info->enable = 1;
                        cs_dbs_info->requested_freq = policy->cur;
-                       cpufreq_register_notifier(cs_ops->notifier_block,
-                                       CPUFREQ_TRANSITION_NOTIFIER);

-                       if (!policy->governor->initialized)
+                       if (!policy->governor->initialized) {
+
cpufreq_register_notifier(cs_ops->notifier_block,
+                                               CPUFREQ_TRANSITION_NOTIFIER);
+
                                dbs_data->min_sampling_rate =
                                        MIN_SAMPLING_RATE_RATIO *
                                        jiffies_to_usecs(10);
+                       }
                } else {
                        od_dbs_info->rate_mult = 1;
                        od_dbs_info->sample_type = OD_NORMAL_SAMPLE;
@@ -311,11 +315,13 @@ unlock:
                mutex_lock(&dbs_data->mutex);
                mutex_destroy(&cpu_cdbs->timer_mutex);

-               sysfs_remove_group(cpufreq_global_kobject,
-                               dbs_data->attr_group);
-               if (dbs_data->governor == GOV_CONSERVATIVE)
-                       cpufreq_unregister_notifier(cs_ops->notifier_block,
-                                       CPUFREQ_TRANSITION_NOTIFIER);
+               if (policy->governor->initialized == 1) {
+                       sysfs_remove_group(cpufreq_global_kobject,
+                                       dbs_data->attr_group);
+                       if (dbs_data->governor == GOV_CONSERVATIVE)
+
cpufreq_unregister_notifier(cs_ops->notifier_block,
+                                               CPUFREQ_TRANSITION_NOTIFIER);
+               }
                mutex_unlock(&dbs_data->mutex);

                break;
