From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: starting governor ondemand failed
Date: Mon, 4 Apr 2005 06:39:52 -0700
Message-ID: <88056F38E9E48644A0F562A38C64FB60046298FE@scsmsx403.amr.corp.intel.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Ivor Hewitt <ivor@ivor.org>, Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@ZenII.linux.org.uk



Dominik,

Can we do some calibration of the time taken to switch frequencies
at the time of initialization and use it here instead of hardcoding=20
it to CPUFREQ_ETERNAL?=20

Thanks,
Venki

>-----Original Message-----
>From: cpufreq-bounces@ZenII.linux.org.uk=20
>[mailto:cpufreq-bounces@ZenII.linux.org.uk] On Behalf Of Ivor Hewitt
>Sent: Monday, April 04, 2005 6:27 AM
>To: Dominik Brodowski
>Cc: cpufreq@ZenII.linux.org.uk
>Subject: Re: starting governor ondemand failed
>
>Dominik Brodowski wrote:
>> On Mon, Apr 04, 2005 at 11:42:19AM +0100, Ivor Hewitt wrote:
>>=20
>>>Hi,
>>>I was trying to have a play with the ondemand governor but I=20
>just get=20
>>>the following logged when I try to switch to it:-
>>>
>>>cpufreq-core: governor switch
>>>cpufreq-core: __cpufreq_governor for CPU 0, event 2
>>>userspace: managing cpu 0 stopped
>>>cpufreq-core: __cpufreq_governor for CPU 0, event 1
>>>cpufreq-core: starting governor ondemand failed
>>>cpufreq-core: __cpufreq_governor for CPU 0, event 1
>>>
>>>This is on a PIIIM using the speedstep-smi interface.
>>>The cpu is only capable of switching between two=20
>frequencies, would this=20
>>>prevent ondemand starting up?
>>=20
>> This isn't the problem, but the following: we do not know how long=20
>> transitions using speedstep-smi take, therefore we still=20
>need to assume
>> that it takes very long, thus making it unable to be used=20
>for ondemand
>> frequency switching.
>>=20
>Hi,
>I'll stick to to cpufreqd then. :-)
>
>Ah I see "CPUFREQ_ETERNAL".
>
>What should be an acceptable transition time? Is it possible for me to=20
>determine my speedstep-smi transition time and enable the switching?
>Or are you saying that there's no way of knowing how long the smi=20
>transition would take, therefore it has to be disabled?
>
>Many thanks,
>
>--=20
>Ivor
>http://www.ivor.it
>
>_______________________________________________
>Cpufreq mailing list
>Cpufreq@lists.linux.org.uk
>http://lists.linux.org.uk/mailman/listinfo/cpufreq
>
