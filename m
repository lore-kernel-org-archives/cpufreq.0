From: Len Brown <len.brown@intel.com>
Subject: Re: ACPI / CPUFREQ.
Date: 03 Aug 2004 11:41:28 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1091547688.3473.4.camel@dhcppc4>
References: <20040803151010.GQ12724@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040803151010.GQ12724@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: "cpufreq@www.linux.org.uk" <cpufreq@www.linux.org.uk>

On Tue, 2004-08-03 at 11:10, Dave Jones wrote:
> At his ACPI talk at OLS, Len mentioned that it would be beneficial
> to have ACPI and CPUFREQ working together a little better.
> 
> Len, care to kick off some thoughts on what pieces you had in mind ?
> 
> The biggest problem is probably ACPI thinking the CPU should be at a
> certain P-state whilst the user has forced it to another with cpufreq.

I think there are 2 major issues.

1. confusion about best driver to use
   this, of course, should be automatic
   and should not depend on if the drivers
   are built-in or modules.

2. no coordination between P-states
   and T-states.  ACPI currently kicks
   in throttling upon high temperature conditions,
   but it doesn't make sense to use throttling
   unless we're already in the most power-conserving
   P-state available.

-Len
