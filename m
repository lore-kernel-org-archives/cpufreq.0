From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: speedstep-centrino fails to load
Date: Sun, 8 Apr 2007 11:02:16 -0700
Message-ID: <653FFBB4508B9042B5D43DC9E18836F53610AF@scsmsx415.amr.corp.intel.com>
References: <200704081807.54642.giacof@tiscali.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <200704081807.54642.giacof@tiscali.it>
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
To: Federico Giacomini <giacof@tiscali.it>, cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
>Federico Giacomini
>Sent: Sunday, April 08, 2007 9:08 AM
>To: cpufreq@lists.linux.org.uk
>Subject: Re: speedstep-centrino fails to load
>
>On Sunday 08 April 2007 02:09, Jeremy Fitzhardinge wrote:
>> Federico Giacomini wrote:
>> > hello again,
>> >
>> > the error message indicates your address, if you have no=20
>time to deal with that right now, please give me any other=20
>name to contact about the bug.
>> >  =20
>>=20
>> Hi,
>>=20
>> The cpufreq list is the right for bugs in this driver.  It's actually
>> obsolete now, replaced by the acpi driver, but if you're seeing a
>> message telling you to mail me, you must be using a fairly=20
>old version.
>>=20
>>     J
>> > Regards,
>> >
>> > Federico
>> >
>
>Hi, thank you for replying.
>You mean the module speedstep-centrino is deprecated now, and=20
>I should use acpi_cpufreq on any Pentium M laptop? Even if my=20
>kernel is 2.6.17?
>

No. speedstep centrino is deprated only in 2.6.20 onwards.
2.6.17 acpi-cpufreq or speedstep-centrino any one of them can work for
you
Depending on what your BIOS ACPI support has. So, please try both
acpi-cpufreq
and speedstep_centrino (with SPEEDSTEP_CENTRINO_ACPI enabled in config).
If both of them does not work, please go ahead and open a bug at
bugme.osdl.org
under ACPI related bugs. We can track the issue down systematically that
way.

Also, if none of those two drivers work, it will be interesting to know
whether it is a recent regression or it did not work on this particular
system
with earlier kernels as well.

Thanks,
Venki
