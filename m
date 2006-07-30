From: bert hubert <bert.hubert@netherlabs.nl>
Subject: Re: 2.6.17 -> 2.6.18 regression: cpufreq broken since 2.6.18-rc1 on	pentium4
Date: Sun, 30 Jul 2006 21:19:32 +0200
Message-ID: <20060730191932.GA31309@outpost.ds9a.nl>
References: <20060730120844.GA18293@outpost.ds9a.nl> <20060730160738.GB13377@irc.pl> <20060730165137.GA26511@outpost.ds9a.nl> <44CCF556.2060505@linux.intel.com> <20060730184443.GA30067@outpost.ds9a.nl> <20060730190133.GD18757@redhat.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932445AbWG3TTx@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060730190133.GD18757@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>, linux-kernel@vger.kernel.org, zwane@arm.linux.org.uk, venkatesh.pallipadi@intel.com, tony@atomide.com, akpm@osdl.org, cpufreq@lists.linux.org.uk, len.brown@intel.com

On Sun, Jul 30, 2006 at 03:01:33PM -0400, Dave Jones wrote:

> Normally, if the necessary BIOS bits aren't there, then acpi-cpufreq will
> fail to register.  For some reason it sounds like it believes that everything
> went ok.  I wonder if something changed in acpi recently that caused this
> change in behaviour ? Len ?

As far as I can see, acpi_cpufreq does not pass on any errors it sees during
init:

static int __init acpi_cpufreq_init (void)
{
        int                     result = 0;

        dprintk("acpi_cpufreq_init\n");

        result = acpi_cpufreq_early_init_acpi();
...

And from acpi_cpufreq_early_init_acpi():

static int acpi_cpufreq_early_init_acpi(void)
{
        struct acpi_processor_performance       *data;
        unsigned int                            i, j;

        dprintk("acpi_cpufreq_early_init\n");

	( some memory allocations, does not look at acpi or bios )
	
        /* Do initialization in ACPI core */
        acpi_processor_preregister_performance(acpi_perf_data);
        return 0;
}

Note how any error from acpi_processor_preregister_performance is ignored.

Ghetto patch which "fixes" the problem for me:

--- ./arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c~orig  2006-07-30 21:14:43.000000000 +0200
+++ ./arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c       2006-07-30 21:11:34.000000000 +0200
@@ -384,8 +384,7 @@
        }

        /* Do initialization in ACPI core */
-       acpi_processor_preregister_performance(acpi_perf_data);
-       return 0;
+       return acpi_processor_preregister_performance(acpi_perf_data);
 }


But tonight I have no speedstep laptop available to check if this does not
kill acpi_cpufreq when it can work.

Thanks for the hint, dave!

-- 
http://www.PowerDNS.com      Open source, database driven DNS Software 
http://netherlabs.nl              Open and Closed source services
