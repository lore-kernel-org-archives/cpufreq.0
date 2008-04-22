From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: WARNING: at drivers/base/sys.c:183 sysdev_driver_register+0x75/0x12e()
Date: Tue, 22 Apr 2008 11:51:21 -0500
Message-ID: <6453C3CB8E2B3646B0D020C112613273093908@sausexmb4.amd.com>
References: <Pine.LNX.4.64.0804221609130.12972@jikos.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <Pine.LNX.4.64.0804221609130.12972@jikos.suse.cz>
Sender: linux-acpi-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jiri Kosina <jkosina@suse.cz>, davej@codemonkey.org.uk, lenb@kernel.org
Cc: linux-acpi@vger.kernel.org, Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

> From: cpufreq-bounces@lists.linux.org.uk 
> [mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Jiri Kosina
> Sent: Tuesday, April 22, 2008 9:12 AM
> To: davej@codemonkey.org.uk; lenb@kernel.org
> 
> Hi,
> 
> I am getting the acpi-cpufreq-drivercore warning below when booting 
> current git (807501475)
> 
> powernow-k8: Found 1 AMD Athlon(tm) 64 Processor 3000+ 
> processors (1 cpu 
> cores) (version 2.20.00)
> powernow-k8: BIOS error - no PSB or ACPI _PSS objects
> sysdev: class cpu: driver (ffffffff8057fd10) has already been 
> registered to a class, something is wrong, but will forge on!
> 
Why is the acpi-cpufreq driver trying to
instantiate on an AMD processor?  It shouldn't
do that.

PowerNow! failed to load because the BIOS wasn't 
set up correctly.  But the acpi-cpufreq driver
shouldn't have loaded at all.

-Mark Langsdorf
Operating System Research Center
AMD

