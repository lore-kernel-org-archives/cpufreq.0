From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: ondemand question?
Date: Tue, 26 Oct 2004 09:26:15 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB60032E5AC3@scsmsx403.amr.corp.intel.com>
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
To: Nebojsa Trpkovic <trx@inbox.ru>, cpufreq@www.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@www.linux.org.uk=20
>[mailto:cpufreq-bounces@www.linux.org.uk] On Behalf Of Nebojsa Trpkovic
>Sent: Tuesday, October 26, 2004 12:34 AM
>To: cpufreq@www.linux.org.uk
>Subject: Re: ondemand question?
>
>Pallipadi, Venkatesh wrote:
>
>>The frequency is not fixed. Default freq will depend on what amount of
>>time does CPU actually take to change the frequency. And user=20
>can change
>>this default value within some limits.
>>
>>Once you start using ondemand governor you will find this (and other
>>ondemand tunables here)
>>/sys/devices/..../cpufreq/ondemand/sampling_rate
>>/sys/devices/..../cpufreq/ondemand/sampling_rate_max
>>/sys/devices/..../cpufreq/ondemand/sampling_rate_min
>>(all the numbers here are in uS)
>>
>>Thanks,
>>Venki
>> =20
>>
>Thank you. I made changes I needed. Only thing I don't understand here=20
>is purpose of "sampling_down_factor", but I think I have some=20
>idea what=20
>it can be (because of slow slowing down of the CPU)...
>
>Thank you.
>

sampling_down_factor - When it is 1, ondemand checks for frequency=20
increase and decrease at the same period/frequency. When it is n,=20
ondemand checks for frequency decrease once after n checks=20
for frequency increase.

Thanks,
Venki
