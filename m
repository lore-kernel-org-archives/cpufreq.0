From: Gary Hade <garyhade@us.ibm.com>
Subject: Re: [PATCH] speedstep-centrino should ignore upper performance
	control bits
Date: Wed, 8 Nov 2006 16:00:31 -0800
Message-ID: <20061109000031.GD28012@us.ibm.com>
References: <20061106233923.GA15063@us.ibm.com>
	<20061107021441.GA10457@isilmar.linta.de>
	<200611070209.39817.len.brown@intel.com>
	<20061107184902.GA11620@us.ibm.com>
	<20061108232119.GB28012@us.ibm.com>
	<20061108232955.GL3309@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061108232955.GL3309@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk, Dominik Brodowski <linux@dominikbrodowski.net>

On Wed, Nov 08, 2006 at 06:29:55PM -0500, Dave Jones wrote:
> On Wed, Nov 08, 2006 at 03:21:19PM -0800, Gary Hade wrote:
> 
>  > The above result was obtained with Woodcrest processors 
>  > installed in the system.  With Dempsey processors the 
>  > address space is ACPI_ADR_SPACE_SYSTEM_IO and the 2.6.19-rc4 
>  > version of acpi-cpufreq loads and functions correctly.
>  > 
>  > The patch I provided modifies the in-kernel copy of the ACPI 
>  > data which is the wrong thing to do.  I will post an improved 
>  > patch as soon as the Woodcrests are reinstalled and I am able 
>  > to test it.
> 
> Argh. I sat on the fence on this one until the dest settled,
> and now, as soon as I merge it, this happens. Bah!

Dave, I'm sorry.  I just discovered the problem. :(

> 
> Send an incremental against cpufreq.git so I don't have to
> reconstruct the whole git tree?  

Okay, I'll try to figure out how to do that.

> Or is the right change completely
> different, causing a complete revert of this?

The change will completely remove the lines of codes added 
by the first patch and revise other existing lines of code.

Gary

-- 
Gary Hade
IBM Linux Technology Center
503-578-4503  IBM T/L: 775-4503
garyhade@us.ibm.com
http://www.ibm.com/linux/ltc
