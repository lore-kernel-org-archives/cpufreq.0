From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: do Pentium4 & PentiumM consume about the same at their lowest
	possible freq?
Date: Fri, 3 Aug 2007 13:32:05 -0700
Message-ID: <653FFBB4508B9042B5D43DC9E18836F50139486C@scsmsx415.amr.corp.intel.com>
References: <46B38D14.4080806@unica.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <46B38D14.4080806@unica.it>
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
To: Roberto De Leo <deleo@unica.it>, cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Roberto De Leo
>Sent: Friday, August 03, 2007 1:16 PM
>To: cpufreq@lists.linux.org.uk
>Subject: Re: do Pentium4 & PentiumM consume about the same at=20
>their lowest possible freq?
>
>
>
>> indeed, under many conditions, using pentium 4 clock modulation will
>> actually increase energy use, rather than decrease it.
>>
>Jeez, that's odd!
>Then maybe this is the reason why I don't notice any particular=20
>improvement when I slow down my celeron-m, which uses indeed the P4=20
>modulation sw rather than the speedstep centrino. But then,=20
>why slowing=20
>down the CPU at all if it doesn't save you any watt? I guess I'll stop=20
>using it.

It is meant to be used under thermal condition where slowing down CPU
will result in reducing the temperature and not for power savings in
normal conditions.

Thanks,
Venki
