From: Oliver Antwerpen <olli@giesskaennchen.de>
Subject: Re: static freq table support for Pentium M Dothan
Date: Tue, 17 Aug 2004 22:04:32 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <412280F0.8090900@giesskaennchen.de>
References: <E1Bwu3z-0007gV-4Q@mage.metaparadigm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <E1Bwu3z-0007gV-4Q@mage.metaparadigm.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Hi,

Michael Clark wrote:
> Hi All,
> 
> It adds Dothan frequency/voltage tables for processors 715, 725, 735,
> 745, 755 to support frequency scaling when ACPI is not enabled. It
> should apply to current BitKeeper (on top of centrino ACPI table support).

I applied the patch to 2.6.8.1-mm1 successfully.

> I personally need this patch as I don't use ACPI so can't use the
> experimental ACPI freq/voltage tables support as ACPI doesn't work well
> enough for me on my Thinkpad T42.

I was using the acpi since now. I'll now give speedstep-centrino a try 
and see, if the finer granulated frequencies affect my system.

> It currently lists the B0 steppings only, a line or 2 may need to be added
> for A1 steppings although in my googling I haven't seen any /proc/cpuinfo
> output for these, all i've seen are B0 steppings for which i've seen
> examples of 1.5GHz through 1.8GHz.

I am another example of B0 (using intel 735 1.7GHz/2MB)

I don't really know what to do. Do I have any advantages using 
speedstep-centrino instead of acpi?

Olli
