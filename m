From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: BUG in bleeding edge c560f3d
Date: Tue, 05 Feb 2013 01:09:35 +0100
Message-ID: <3463348.tWNCISaOfi@vostro.rjw.lan>
References: <511033EA.7090604@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <511033EA.7090604@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: cpufreq@vger.kernel.org

On Monday, February 04, 2013 02:19:22 PM Dirk Brandewie wrote:
> Hi All,
> 
> There is a bug in the bleeding-edge branch. Using the ondemand governor
> and acpi_cpufreq scaling driver the system hangs while trying to reboot or
> trying to offline a cpu manually.  The last call where I have tracing turned
> on is __cpufreq_governor(data, CPUFREQ_GOV_STOP);
> 
> [   38.138236] __cpufreq_remove_dev: cpufreq: __cpufreq_remove_dev: 
> unregistering CPU 1
> [   38.146663] __cpufreq_governor: cpufreq: __cpufreq_governor for CPU 0, event 2
> [   71.562262] ata3.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x6 frozen
> 
> 
> It looks like the breakage comes from the removal of the sysfs files in the
> incorrect order.  While rebasing my patches onto bleeding edge I found this
> problem as well.  I have a couple of hack patches that workaround the issue
> when using my driver if anyone would like to see them.

There have been a few fixes since c560f3d, they are in linux-pm.git/linux-next
now.  Can you please test that tree and see if the problem is still there?

Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
