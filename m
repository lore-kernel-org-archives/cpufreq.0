From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: Power measurements
Date: Sun, 24 Jun 2007 01:57:10 +0200
Message-ID: <467DB356.7050309@interia.pl>
References: <200706231544.17062.lenb@kernel.org>
	<1182634218393@dmwebmail.belize.chezphil.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <1182634218393@dmwebmail.belize.chezphil.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-9"
To: Phil Endecott <phil_fvnqz_endecott@chezphil.org>
Cc: cpufreq@lists.linux.org.uk

> Len Brown wrote:
>> On Saturday 23 June 2007 08:54, Phil Endecott wrote:
>>> Dear All,
>>>
>>> I would like to share some power consumption numbers that I have just
>>> measured on my VIA C7-M system.  It uses the e_powersaver module and
>>> can run at 400MHz or 1.2GHz.  I have measured the power consumption
>>> when idle and when running a "while(1){}" program at each speed:
>>>
>>>          400    1200
>>> Idle    16W    16W
>>> Busy    17W    20W
>>>
>>> What I find interesting is that the idle power at 1.2GHz is identical
>>> to that at 400 MHz.
It isn't.
>>> This makes me wonder if the on-demand governor would actually save
>>> any power at all.
There is a difference of 0,5W~1,0W max.
>>> I plan to do some more accurate measurements and to experiment with
>>> some different workloads.  Has anyone else done anything like this?
>>
>> In idle, the processor is executing at 0MHz --
>> so idle power consumption has little to do with cpufreq.
>=20
> Well, the clock is running so signals will still be toggling in the
> processor.  Many of them will be gated off though.
>=20
> Do other people observe that reducing the clock frequency with cpufreq
> does not reduce idle power consumption?
Yes. Because of RAM, VGA, harddisk, etc. If I understand correcly You are=20
measuring entire system power consumption. This isn't P4 4GHz which=20
needs 150W. This is VIA C7-Eden 1,2GHz which needs 10W - 50% less is 5W.
>> The exception is if the processor doesn't automatically
>> adjust it voltage when entering idle.  In this case,
>> idle power would depend on the frequency of the processor
>> when idle was entered -- not because of the frequency --
>> but because of the associated voltage.
>=20
> Ah, I had wondered about this.  According to sensors, Vcore is always
> 1.09 V.  (Hmm, I can't be sure that I'm looking at the right line in the
> output of the sensors program, or that it is configured correctly.  But
> none of the voltages change.)  Are there any VIA experts reading this
> who know what's supposed to happen?
% dmesg | grep eps=20
But most C7-Eden doesn't scale voltage.
>> I don't know about VIA C7, but some Pentium M's used to
>> have different idle power depending on the P-state because
>> of this.  But the more recent ones all have "Enhanced" C-states
>> where the voltage is automatically lowered in idle.
>=20
>> back to you question -- 20 - 16W =3D 4W is on the table;
>> and the performance difference between 400 and 1200 is on the table.
>=20
> Well, in idle, the power difference is zero and the performance
> difference is zero.
> When active, on-demand would use the higher frequency anyway.
> So it looks to me as if 'on-demand' and 'performance' will behave
> identically in terms of both power and performance.
If CPU is sleeping a lot even 0,5W can make a difference. But there is=20
time needed to enter 400MHz and time needed to leave 400MHz. In real=20
life "performance" governor will use less power.
>> how you choose to use these states will depend on how you use
>> the machine.
>=20
> I don't think there's a situation where I would want to use on-demand.
>=20
> Unless I'm missing something.  Which is quite likely.....
>=20
> Regards,
>=20
> Phil.
Regards
Rafa=B3

=20

-----------------------------------------------------------------------=20
Linda jako gospodyni domowa - zobacz!!!
>>> http://link.interia.pl/f1a79
