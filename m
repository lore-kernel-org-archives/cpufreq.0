From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] Remove deprecated speedstep-centrino driver
Date: Fri, 16 May 2008 11:35:11 -0700
Message-ID: <924EFEDD5F540B4284297C4DC59F3DEE010D5208@orsmsx423.amr.corp.intel.com>
References: <20080511161845.GH15445@codemonkey.org.uk><4827F6A6.8070909@goop.org>
	<20080515105825.GC8015@dominikbrodowski.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-reply-to: <20080515105825.GC8015@dominikbrodowski.net>
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
To: Dominik Brodowski <linux@dominikbrodowski.net>, Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Dave Jones <davej@codemonkey.org.uk>, cpufreq <cpufreq@lists.linux.org.uk>


>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk 
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of 
>Dominik Brodowski
>Sent: Thursday, May 15, 2008 3:58 AM
>To: Jeremy Fitzhardinge
>Cc: Dave Jones; cpufreq
>Subject: Re: [PATCH] Remove deprecated speedstep-centrino driver
>
>On Mon, May 12, 2008 at 08:49:58AM +0100, Jeremy Fitzhardinge wrote:
>> Dave Jones wrote:
>> > On Sat, May 03, 2008 at 09:53:21PM +0200, Thomas Renninger wrote:
>> >  > Remove deprecated speedstep-centrino driver
>> >  >
>> >  > Not 100% sure whether there are machines out there that 
>still need the
>> >  > static Banias tables, Venkatesh?
>> >
>> > Hmm, if we decide to remove this for 2.6.27, I think we should
>> > get a printk into .26 on module load to say that it's going away.
>> > This likely has more valid use cases than the clockmod driver, so I
>> > think a heads-up to any potential users of it who still 
>haven't seen
>> > the warning in the Kconfig might be a good idea.
>> >   
>> 
>> The one function difference from cpufreq_acpi is that it 
>doens't rely on 
>> acpi.  On my laptop of the time that was a useful 
>distinction, but it 
>> may have been more due to the shoddy state of acpi in Linux 
>rather than 
>> the BIOS.
>
>And that's the reason why I'd propose to keep it unless ACPI 
>is actually
>required to be set to "y" on those systems -- which I doubt.
>

I don't think we can remove speedstep_centrino. There are few systems
out
there that don't have proper ACPI P-state tables and depend on
speedstep-centrino static table to change freq.

Thanks,
Venki
