From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: ondemand governor
Date: Sat, 25 Sep 2004 11:42:32 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB6002F2B0F4@scsmsx403.amr.corp.intel.com>
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
To: Stefan Seyfried <seife@gmane0305.slipkontur.de>, cpufreq@www.linux.org.uk

>-----Original Message-----
>From: cpufreq-bounces@www.linux.org.uk=20
>[mailto:cpufreq-bounces@www.linux.org.uk] On Behalf Of Stefan Seyfried
>Sent: Friday, September 24, 2004 11:36 PM
>To: cpufreq@www.linux.org.uk
>Subject: Re: ondemand governor
>
>On Fri, Sep 24, 2004 at 11:29:53PM +0200, Dominik Brodowski wrote:
>
>> Unfortunately, only indirectly. Modprobe cpufreq_ondemand and then=20
>> cat /sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate
>> The latency can be deduced then.
>
>10000
>=20

That means the CPU usage is being checked every 10mS and 100mS for
Possible increase and decrease in freq, respectively.

Try tuning the following.=20
down_threshold=3D40
up_threshold=3D60
sampling_rate=3D100000
sampling_down_factor=3D1

This will make CPU usage checks every 100mS and increase the freq if
utilization is more than 60% and decrease the freq if utilization is=20
less than 40%.

Thanks,
Venki
