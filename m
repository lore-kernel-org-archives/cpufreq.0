From: Gary Hade <garyhade@us.ibm.com>
Subject: Re: [PATCH] speedstep-centrino should ignore upper performance
	control bits
Date: Wed, 8 Nov 2006 15:21:19 -0800
Message-ID: <20061108232119.GB28012@us.ibm.com>
References: <20061106233923.GA15063@us.ibm.com>
	<20061107021441.GA10457@isilmar.linta.de>
	<200611070209.39817.len.brown@intel.com>
	<20061107184902.GA11620@us.ibm.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061107184902.GA11620@us.ibm.com>
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
Content-Transfer-Encoding: 7bit
To: Gary Hade <garyhade@us.ibm.com>
Cc: cpufreq@lists.linux.org.uk, davej@redhat.com, Dominik Brodowski <linux@dominikbrodowski.net>

On Tue, Nov 07, 2006 at 10:49:02AM -0800, Gary Hade wrote:
> On Tue, Nov 07, 2006 at 02:09:39AM -0500, Len Brown wrote:
> > On Monday 06 November 2006 21:14, Dominik Brodowski wrote:
> > > On Mon, Nov 06, 2006 at 03:39:23PM -0800, Gary Hade wrote:
> > > > 
> > > > On some systems such as the IBM x3650 there are bits set in the 
> > > > upper half of the control values provided by the _PSS object.  
> > > > These bits are only relevant for cpufreq drivers that use IO ports 
> > > > which are not currently supported by the speedstep-centrino driver.  
> > > ... and probably never will.
> > > 
> > > > The current MSR oriented code assumes that upper bits are not set 
> > > > and thus fails to work correctly when they are.  e.g. the control 
> > > > and status value equality check fails even though the ACPI spec 
> > > > allows the inequality.
> > 
> > > How does the acpi-cpufreq driver work with it?
> > 
> > acpu-cpufreq.c in Linus' tree is still IO only.
> 
> True.  On the x3650 this version of acpi-cpufreq fails to load 
> with a "No such device" error after debug message complaints
> about lack of ACPI_ADR_SPACE_FIXED_HARDWARE address space support.
>                ...
>   cpufreq-core: adding CPU 0
>   acpi-cpufreq: acpi_cpufreq_cpu_init
>   acpi-cpufreq: Unsupported address space [127, 127]
>   cpufreq-core: initialization failed
>                ...

The above result was obtained with Woodcrest processors 
installed in the system.  With Dempsey processors the 
address space is ACPI_ADR_SPACE_SYSTEM_IO and the 2.6.19-rc4 
version of acpi-cpufreq loads and functions correctly.

The patch I provided modifies the in-kernel copy of the ACPI 
data which is the wrong thing to do.  I will post an improved 
patch as soon as the Woodcrests are reinstalled and I am able 
to test it.

Thanks,
Gary

-- 
Gary Hade
IBM Linux Technology Center
503-578-4503  IBM T/L: 775-4503
garyhade@us.ibm.com
http://www.ibm.com/linux/ltc
