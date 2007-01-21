From: Romain =?iso-8859-1?Q?Li=E9vin?= <roms@lievin.net>
Subject: RE: Frequency can't switch on a dual Turion 64
Date: Sun, 21 Jan 2007 16:45:27 +0100 (CET)
Message-ID: <1050.10.10.10.3.1169394327.squirrel@www.lievin.net>
References: <43212.193.48.146.2.1168602995.squirrel@www.lievin.net>    
	<1449F58C868D8D4E9C72945771150BDFD964C6@SAUSEXMB1.amd.com>    
	<1052.10.10.10.3.1169375336.squirrel@www.lievin.net>   
	<1169379997.14625.29.camel@sublime.site>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1169379997.14625.29.camel@sublime.site>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: trenn@suse.de
Cc: davej@codemonkey.org.uk, Romain =?iso-8859-1?Q?Li=E9vin?= <roms@lievin.net>, cpufreq@lists.linux.org.uk

Hi,

> In older kernels powernow-k8 could be unloaded, not sure whether this is
still the case. Switch to performance (or userspace?) governor and try
to unload all related modules, e.g. freq_tables,
> maybe it still works.

I'm already using performance governator and powernow-k8 is the single
module I have.

> I expect the limitation comes from ACPI _PPC func, so you should add
ACPI_DEBUG to your debug kernel and a printk into:
> drivers/acpi/processor_perflib.c:acpi_processor_ppc_notifier()
> to be sure.

I have added printk: the function is called at module insertion.

> Can you open a bugzilla.kernel.org bug and attach acpidump and add me to
CC, pls.

I will do it.

> This sounds related to:
> https://bugzilla.novell.com/show_bug.cgi?id=231107

Yes, it does.

> You should also make sure your kernel includes this one, recently posted
here by Bruno Ducrot:
> http://marc.theaimsgroup.com/?l=linux-acpi&m=116412804022222&w=2

It is (2.6.19.2 which is the latest one).

>
>      Thomas
>
>

Romain.
-- 
email:	<roms@lievin.net>
web:	<http://www.lievin.net>
"Linux, y'a moins bien mais c'est plus cher !"
