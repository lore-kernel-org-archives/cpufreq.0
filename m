From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] Driver to export CPUfreq statistic
Date: Sun, 21 Nov 2004 15:15:33 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB6003662062@scsmsx403.amr.corp.intel.com>
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
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.de>, "Zou, Nanhai" <nanhai.zou@intel.com>
Cc: cpufreq@www.linux.org.uk


>-----Original Message-----
>From: cpufreq-bounces@www.linux.org.uk=20
>[mailto:cpufreq-bounces@www.linux.org.uk] On Behalf Of Dominik=20
>Brodowski
>Sent: Sunday, November 21, 2004 2:07 AM
>To: Zou, Nanhai
>Cc: cpufreq@www.linux.org.uk
>Subject: Re: [PATCH] Driver to export CPUfreq statistic
>> +config CPU_FREQ_STAT
>> +       tristate "CPU frequency translation statistics"
>> +       depends on CPU_FREQ_TABLE
>> +       default y
>> +       help
>> +         This driver exports CPU frequency statistics information
>> through sysfs
>> +         file system
>> +
>> +config CPU_FREQ_STAT_DETAILS
>> +       bool "CPU frequency translation statistics details"
>> +       depends on CPU_FREQ_STAT
>> +       default n
>> +       help
>> +         This will show detail CPU frequency translation=20
>table in sysfs
>> file
>> +         system
>>=20
>> I'm pondering two things:=20
>> a) should we make this dependant on CPU_FREQ_DEBUG?
>> b) should we make CPU_FREQ_STAT_DETAILS available unconditionally?
>

I feel this should not be depending on CPU_FREQ debug. Then we can have
some utility in cpufreq-utils which can display 'top' like output.
The only reason why we thought of keeping STAT_DETAILS as config is, it
doesn't strictly follow to /sys output format, with a huge array output.


>
>And third: what's the general opinion on whether to merge it
>a) into the kernel sources	_or_
>b) into cpufrequtils (in debug/kernel/ )
>
>The former means it's available much more easily, as no=20
>userspace package is
>necessary. The latter has the advantage that interested=20
>parties can access
>it, but it does not increase the kernel normally.

I feel this should be in base kernel.

Thanks,
Venki
