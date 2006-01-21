From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Speedstep on a Pentium4 630 (2.6.13)
Date: Sat, 21 Jan 2006 07:17:58 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB6006FB7B60@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
To: Andy Burns <fedora@adslpipe.co.uk>, cpufreq@lists.linux.org.uk


Actually No.

Acpi-cpufreq _and_ speedstep-centrino are the right drivers (don't worry
too much about the centrino name here) to be used on P4 630 and P4 Xeons
as well. One of these drivers will be used depending on the BIOS and
things like whether HT is enabled etc.

And EIST on P4s cannot do frequencies like 600 MHz. Typically 2.8 GHz is
the least frequency they can go upto.=20

Thanks,
Venki

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Andy Burns
>Sent: Saturday, January 21, 2006 5:55 AM
>To: cpufreq@lists.linux.org.uk
>Subject: Re: Speedstep on a Pentium4 630 (2.6.13)
>
>celtune-gmx wrote:
>
>> i think a cpu with EIST should be scaleable like a Pentium M=20
>(my 735 is=20
>> with EIST scaleable from 600MHz(0,700V) to 1,7 GHz(1,276V))
>
>Would I get better results with speedstep-ich instead of acpi-cpufreq?
>
>_______________________________________________
>Cpufreq mailing list
>Cpufreq@lists.linux.org.uk
>http://lists.linux.org.uk/mailman/listinfo/cpufreq
>
