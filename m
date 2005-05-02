From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Possible CPUFreq governor
Date: Mon, 2 May 2005 07:02:16 -0700
Message-ID: <88056F38E9E48644A0F562A38C64FB60049EEBC2@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Mark Bidewell <mark.bidewell@alumni.clemson.edu>, Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Mark Bidewell
>Sent: Monday, May 02, 2005 5:51 AM
>To: Bruno Ducrot
>Cc: cpufreq@lists.linux.org.uk
>Subject: Re: Possible CPUFreq governor
>
>I have been examining the structure and design of the ondemand govenor=20
>further.  Would it be accurate to characterize your concern as=20
>basically=20
>that under heavy process load, the p-state switching latency becomes=20
>longer than the timeslices and thus could dominate the CPU? =20
>Or is there=20
>an issue with processor damage?
>

P-state switching latency will be same at all times, irrespective
of processor load. IIUC, the issue here is adding the knowledge of CPU=20
temperature to the CPU frequency governor.

For that, As Bruno potins out, one can have a shell script/program on=20
top of ondemand governor, that monitors the temperature in /proc/...
And changes ondemand governor's /sys/..../cpufreq/scaling_max_freq

Thanks,
Venki
