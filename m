From: Radu Rendec <radu.rendec@mindbit.ro>
Subject: sysfs support for scaling_cur_freq in intel_pstate
Date: Tue, 06 Aug 2013 00:37:43 +0300
Message-ID: <1375738663.6273.56.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

Hi!

After a recent kernel upgrade on my laptop I noticed that my cpu
frequency desktop applet wasn't working anymore. I quickly tracked down
the problem to the fact that the new scaling driver was intel_pstate,
and it didn't expose scaling_cur_freq in sysfs.

On the other hand, cpuinfo_cur_freq is available, but it's only readable
by root. Apparently there are good reasons for keeping it like this. I
found an older post about this here:
http://comments.gmane.org/gmane.linux.kernel.cpufreq/7005

However, looking at the code in intel_pstate.c, it seems that
intel_pstate_get() (which is the implementation for cpuinfo_cur_freq in
sysfs) simply extracts a value out of a larger structure. This seems
really harmless and very far away from the reasons why cpuinfo_cur_freq
was kept readable by root only.

Looking at cpufreq_add_dev_interface() in cpufreq.c, it seems that one
needs to define the "target" field in struct cpufreq_driver in order to
have scaling_cur_freq exposed in sysfs.

I think setting "target" to intel_pstate_get() in the definition of
intel_pstate_driver would fix my problem, since scaling_cur_freq in
sysfs is world readable. Is there any reason for not doing this?

If you reply, please cc my personal address - I'm not subscribed to the
list.

Thanks,

Radu Rendec


