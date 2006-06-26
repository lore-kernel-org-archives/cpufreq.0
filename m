From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: ondemand vs suspend.
Date: Mon, 26 Jun 2006 11:43:44 -0700
Message-ID: <EB12A50964762B4D8111D55B764A84541D4DBA@scsmsx413.amr.corp.intel.com>
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
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Dave Jones <davej@redhat.com>, pjones@redhat.com, cpufreq@lists.linux.org.uk


>-----Original Message-----
>From: Jeremy Fitzhardinge [mailto:jeremy@goop.org]=20
>Sent: Friday, June 23, 2006 3:45 PM
>To: Pallipadi, Venkatesh
>Cc: Dave Jones; cpufreq@lists.linux.org.uk; pjones@redhat.com
>Subject: Re: ondemand vs suspend.
>
>Venkatesh Pallipadi wrote:
>> Does it only happen on CPU 1 or both the CPUs? What does=20
>/sys/.../cpufreq
>> look like once you get to this stuck at lowest freq state? Does=20
>> scaling_available_frequencies still show all the freqs.
>>  =20
>Did you have a chance to look at this, or should I do more=20
>investigation?
>


I am not able to reprocude this on my Core Duo system.  At this point I
will need some more information on what exactly happens at this point of
failure to start looking at the code.. Like questions above. Does
scaling_available_frequencies still show all freqs. What is *max *min
values in /sys/.../cpufreq/ ..

Thanks,
Venki
