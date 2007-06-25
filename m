From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: Power measurements
Date: Mon, 25 Jun 2007 08:39:55 +0200
Message-ID: <467F633B.3000909@interia.pl>
References: <467DB356.7050309@interia.pl>
	<1182723258692@dmwebmail.belize.chezphil.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1182723258692@dmwebmail.belize.chezphil.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Phil Endecott <phil_fvnqz_endecott@chezphil.org>
Cc: cpufreq@lists.linux.org.uk

>>>>> Dear All,
>>>>>
>>>>> I would like to share some power consumption numbers that I have just
>>>>> measured on my VIA C7-M system.  It uses the e_powersaver module and
>>>>> can run at 400MHz or 1.2GHz.  I have measured the power consumption
>>>>> when idle and when running a "while(1){}" program at each speed:
>>>>>
>>>>> [...]
>=20
> Here are some more accurate numbers:
>=20
>         400      1200
> Idle    10.55    10.91
> Busy    11.47    13.48
>=20
> [The first numbers were made with a mains power meter.  The second ones
> were made between the power supply and the motherboard; I used a power
> supply extension cable, cut in half, with some 0.01 and 0.1 ohm series
> resistors.]
>=20
> [...]
>=20
>>>> The exception is if the processor doesn't automatically
>>>> adjust it voltage when entering idle.  In this case,
>>>> idle power would depend on the frequency of the processor
>>>> when idle was entered -- not because of the frequency --
>>>> but because of the associated voltage.
>>>
>>> Ah, I had wondered about this.  According to sensors, Vcore is always
>>> 1.09 V.  (Hmm, I can't be sure that I'm looking at the right line in the
>>> output of the sensors program, or that it is configured correctly.  But
>>> none of the voltages change.)  Are there any VIA experts reading this
>>> who know what's supposed to happen?
>> % dmesg | grep eps=20
>=20
> Thanks, yes, I found this after I posted my last message.  Apparently it
> should use 860 mV at 1.2 GHz and 844 mV at 400 MHz.  So I was looking at
> the wrong line when I reported 1.09 V;  0.86 V is reported in another lin=
e.
>=20
>> But most C7-Eden doesn't scale voltage.
>=20
> That is consistent with what I'm seeing, and it's unfortunate.  (You say
> 'most'; do you know of *any* C7 boards that DO change the voltage?  And
> how much difference would it make?  (0.844/0.860)^2 =3D 0.96, i.e. a 4%
> saving if power is proportional to V^2, which is what how CMOS worked
> back in the days when I understood it.)
I was thinking about processors. Most C7-Eden CPU's have same voltage on=20
high and low frequency. Looks like Your's has different voltages. If=20
You don't see 844mV at 400MHz then probably VID pins aren't connected=20
to VRM on motherboard.
Mode	MHz		Voltage (mV)	Power (W)
P0	1200		860		7
P1	400		844		3
Looks like P0 is much more power efficient then P1. I'm assuming that=20
1200 will be 3 times faster then 400MHz. It is what I saw on VIA C3=20
processors.
But it is easier to keep CPU cool at 400MHz.
> (And just to be certain: in e_powersaver you write to one register which
> both changes the frequency and asks for a different voltage at the same
> time; so there's no chance of a software change to correct this - right?)
Right.
>>>> back to you question -- 20 - 16W =3D 4W is on the table;
>>>> and the performance difference between 400 and 1200 is on the table.
>>>
>>> Well, in idle, the power difference is zero and the performance
>>> difference is zero.
>>> When active, on-demand would use the higher frequency anyway.
>>> So it looks to me as if 'on-demand' and 'performance' will behave
>>> identically in terms of both power and performance.
>> If CPU is sleeping a lot even 0,5W can make a difference. But there is
>> time needed to enter 400MHz and time needed to leave 400MHz.
>=20
> My understanding of the C7 clock switching (which only comes from a VIA
> powerpoint presentation) is that because it has 2 PLLs it can change
> from one clock to the other much more quickly than other processors
> which have to wait thousands of cycles for the PLL to stabilise after
> changing.
Yes. And C7 is better from P4-M in this because C7 doesn't require=20
chipset support. P4-M SpeedStep is only supported on Intel chipsets.=20
Unfortunatly I have SiS. HT isn't working either.
> [...]
> Many thanks for your feedback.  My aim is to make this machine as
> power-efficient as possible, which I've achieved mainly by working on
> the PSU (the first one I had was < 40% efficient, now I'm up to about
> 70%), and by using a solid-state disk.  It's getting increasingly
> difficult to find things to improve!
Newer PSU's should have 80%-85% efficiency. But 70% isn't that bad.

You should probably poke some registers in northbridge. I don't=20
know much about newer VIA chipsets, but older (CLE266) had many bits=20
which could improve power savings - dynamic clock stop to different=20
chipset components, ACPI C3 can put memory to sleep and so on.=20
Unfortunatly these bits are disabled by default and are never touched=20
by BIOS.

Btw. Can You benchmark Your's C7 for me? I would like to compare it to=20
my P4-M which is eating much more power. I'm not sure how much exacly=20
because I had to change FSB frequency, but something about 25W.
Maybe "nbench"?
>=20
> Regards,
>=20
> Phil.

Regards
Rafa=B3




----------------------------------------------------------------------
Ile masz w domu niepotrzebnych rzeczy?
Wymien sie z sasiadami >> http://link.interia.pl/f1a93
