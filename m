From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] acpi-cpufreq: Use IA32_APERF and IA32_MPERF and get
	freq feedback from hardware
Date: Mon, 25 Sep 2006 07:41:18 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454A4110F@scsmsx413.amr.corp.intel.com>
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
To: Erik Slagter <erik@slagter.name>, cpufreq@www.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Erik Slagter
>Sent: Monday, September 25, 2006 6:14 AM
>To: cpufreq@www.linux.org.uk
>Subject: Re: [PATCH] acpi-cpufreq: Use IA32_APERF and=20
>IA32_MPERF and get freq feedback from hardware
>
>Venkatesh Pallipadi wrote:
>>=20
>> Enable ondemand governor and acpi-cpufreq to use IA32_APERF=20
>and IA32_MPERF MSR
>> to get active frequency feedback for the last sampling=20
>interval. This will
>> make ondemand take right frequency decisions when hardware=20
>coordination of
>> frequency is going on.
>
>Does this mean there is actually no real clean approach to=20
>determine the
>current cpu speed?
>

The problem is, a lot of times current frequency may not mean much as
frequency can change immediately after one get frequency call or
immediately before we did the call. The freuency can change
asynchronously due to number of reasons like hardware coordination, TM2
and get frequency will not help to get frequency over a period of time.
Also, there is no call back from hardware when frequency changes
asynchronously. So, getting average frequency over a period of time is
the best we can do in order to use the utilization in that period and
make some frequency target decision for next sampling period.

Thanks,
Venki=20
