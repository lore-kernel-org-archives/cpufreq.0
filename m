From: Thomas Renninger <mail@renninger.de>
Subject: Re: ondemand governor and passive cooling broken?
Date: Sun, 21 Aug 2005 06:48:44 +0200
Message-ID: <430807AC.50309@renninger.de>
References: <42F10A23.6020107@renninger.de>
	<20050816094856.GA9985@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20050816094856.GA9985@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk

Hi,

This makes ondemand governor aware of thermal limits.
The policy was buffered and new policy values never reached the governor.

I just used the cpufreq_get_policy call every time the load is checked,
maybe the new policy should be made available via notifier as it is done
for the cur_freq in the userspace governor?
If this sounds reasonable I can come up with a bigger patch on Monday.

However, thermal cooling still does not always work right:

  - Sometimes the limit is not decreased correctly in polling frequency time
    (I saw it at max for more than 20 secs, polling freq 5 secs, passive tp exceeded).
    Strange enough, that seems to happen only in rare cases.
  - I also saw the limit stuck at lowest frequency even after getting back in
    normal temperature zones.
  - And once you entered passive cooling you always see the "cooling: passive"
    flag set in /proc/acpi/thermal_zone/*/cooling_mode


    Thomas


--- drivers/cpufreq/cpufreq_ondemand.c.orig     2005-08-20 19:26:18.000000000 -0600
+++ drivers/cpufreq/cpufreq_ondemand.c  2005-08-20 19:28:04.000000000 -0600
@@ -254,6 +254,10 @@
        if (!this_dbs_info->enable)
                return;

+       int ret = cpufreq_get_policy(this_dbs_info->cur_policy, cpu);
+       if (ret)
+               return;
+
        policy = this_dbs_info->cur_policy;
        /*
         * Every sampling_rate, we check, if current idle time is less
