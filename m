From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: ondemand governor
Date: Fri, 24 Sep 2004 16:55:31 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB6002F2B01B@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-class: urn:content-classes:message
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
To: Dominik Brodowski <linux@dominikbrodowski.de>, Stefan Seyfried <seife@gmane0305.slipkontur.de>
Cc: cpufreq@www.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@www.linux.org.uk=20
>[mailto:cpufreq-bounces@www.linux.org.uk] On Behalf Of Dominik=20
>Brodowski
>Sent: Friday, September 24, 2004 2:30 PM
>To: Stefan Seyfried
>Cc: cpufreq@www.linux.org.uk
>Subject: Re: ondemand governor
>
>On Fri, Sep 24, 2004 at 10:53:02PM +0200, Stefan Seyfried wrote:
>> On Fri, Sep 24, 2004 at 10:17:24PM +0200, Dominik Brodowski wrote:
>> > On Fri, Sep 24, 2004 at 04:27:13PM +0200, Stefan Seyfried wrote:
>> > > i finally tried the ondemand governor. Short: i wasn't=20
>very impressed :-)
>> > > I ran it on a Dell D600 with 1700mhz pentium M (banias)
>> >=20
>> > Hm. What's the latency of the system? cat=20
>/proc/acpi/processor/*/performance
>> > - or do you use the built-in tables?
>>=20
>> to be honest - i have no idea. I don't have=20
>/proc/acpi/processor/*/performance
>> It seems it is not compiled into SUSE kernels since it's=20
>marked 'deprecated'.
>> dmesg doesn't show me much either, can i get this from sysfs?
>
>Unfortunately, only indirectly. Modprobe cpufreq_ondemand and then=20
>cat /sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate
>The latency can be deduced then.
>
>Also, which driver do you use?
>
>> also it may be a good idea to provide an option to consider=20
>"nice" processes
>> as idle.
>As an option, yes.
>
>> Yes, that's what i had in mind. One "small, simple, fast"=20
>and one "fat and
>> bloated with options" :-)
>
>Excellent.
>
>	Dominik
>

By any chance you have enabled local APIC (timer interrupts) and also
using C3-states?

I have one known issue where ondemend doesn't work properly with the
above configuartion.

Thanks,
Venki
