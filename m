From: Thomas Renninger <trenn@suse.de>
Subject: Re: acpi_cpufreq stepping issue on Pentium M 1.2GHz
Date: Tue, 20 May 2008 12:38:59 +0200
Message-ID: <1211279939.21269.403.camel@queen.suse.de>
References: <482DCF52.6030307@awtrey.com>
	<20080519000810.GA11313@codemonkey.org.uk>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20080519000810.GA11313@codemonkey.org.uk>
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
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk

On Sun, 2008-05-18 at 20:08 -0400, Dave Jones wrote:
> On Fri, May 16, 2008 at 02:15:46PM -0400, Anthony L. Awtrey wrote:
>  > Hi,
>  > 
>  > I've been trying to get the acpi_cpufreq working on my Panasonic 
>  > Toughbook CF-18 (Intel Pentium M 1.2GHz). It works just fine on my CF-19 
>  > (Intel Core Duo U2400) just fine.
>  > 
>  > When I am on wall power, the system runs at full speed (1.2GHz) and when 
>  > I pull it off wall power it steps to 600MHz and nothing I have tried 
>  > changes that. I need to be able to run full speed while on battery.
> 
> Some BIOSes take away P states when theres a transition in power source.
> Nothing much we can do about it.  Check if your BIOS has an option to
> let this be 'OS controlled', as opposed to 'automatic' or similar wording.

Your machine should get controlled via acpi-cpufreq and not
speedstep-centrino!

It could be that you hit a bug that might get fixed with a recent
commit:
commit e56a727b023d40d1adf660168883f30f2e6abe0a
Author: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Date:   Mon Apr 28 15:13:43 2008 -0400

    [CPUFREQ] Make acpi-cpufreq more robust against BIOS freq changes
behind our back.

You could possibly work around this issue with processor.ignore_ppc boot
parameter. But this should more be used as a debug variable as you then
override your BIOS configs.

This is another nice example why speedstep-centrino should vanish.
People start to hide and not report real bugs.

   Thomas
