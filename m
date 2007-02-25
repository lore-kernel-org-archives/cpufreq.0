From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: [Bug 8081] Conservative governor sets wrong and too high
 sampling rates
Date: Sun, 25 Feb 2007 23:31:49 +0100
Message-ID: <45E20E55.3060505@interia.pl>
References: <JE1FH3$64A7C47FE3A2367714996D45D173E659@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <JE1FH3$64A7C47FE3A2367714996D45D173E659@libero.it>
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
Content-Type: text/plain; charset="iso-8859-9"
To: stefano ferri <ferriste@libero.it>
Cc: cpufreq@lists.linux.org.uk

> Hi Rafal
Hi Stefano
> I think you have not understood what is the core of the problem...
Maybe. It is weekend and it is late and conservative works for me.
> The problem is not to make possible to change sampling rates, anyone with=
 the current code of the kernel can do it.
> The problem is that conservative has a 10x factor of polling times if com=
pared to ondemand.
>=20
>> The CPUfreq governor "conservative", much like the "ondemand"
>> governor, sets the CPU depending on the current usage. It differs in
>> behavior in that it gracefully increases and decreases the CPU speed
>> rather than jumping to max speed the moment there is any load on the
>> CPU.
>=20
> Right, but if ondemand has a minimum polling time of 99500 milliseconds, =

> also conservative should have it, even if it "gracefully" increases and=20
> decreases the CPU speed. The policy of the transition of a governor=20
> is another thing. It is a kernel space governor and it should do the thin=
gs=20
> gracefully but rapidly ;-)!
I don't like word "rapidly" here. Ondemand is doing things rapidly and as=20
result my CPU is near the max frequency most time. Fan is making noise :-(
> The problem is that line 497 in the conservative.c code.
> I don't know if the problem depends on my specific hardware,=20
> but my system does not respond at all to a variable system load=20
> without deleting that 10x factor, my cpu goes at 400 Mhz all the time,=20
> also transition to 800 Mhz are rare.
My CPU goes at 533MHz most the time. Transitions to higher frequencies=20
are rare and happen only if there is constant load.
Check http://elke.homelinux.net/index.cgi
Not sure why my CPU was 300% idle once, but rest seems to be OK.
Red line is fan on temperature. Green line is fan off temperature.
Polling at 10s interval.
Please clarify me this problem. If You have 100% constant load (eg. You=20
are compiling Thunderbird) CPU speed is increasing or not? Or Your case is,=
=20
for example, RTorrent with shedule which is using 100% CPU for 1s at 10s=20
interval? Would You like to change CPU frequency for this 1s to higher=20
value?
>=20
>> NACK from me. Current values are working for me. If these values are
>> not good for You then write patch to Kconfig which will allow user to
>> change sampling rate during "make config". Later "make oldconfig" will
>> preserve Your values.
>=20
> I said, it's not that the problem. Users will NOT be able to set a decent=
 polling time if that 10x factor wil not be removed. I can choose a minium =
time of 995000 millisecond (1 second!). Now that I recompiled I obtain a 99=
500 with both ondemand and conservative, as it should be.
> And I see the frequency increasing and decreasing gracefully :-)!
I have sampling rate at 2s (by default). I can lower it to 1s. I can rise=20
it too. You are changing default value and min and max values. This will=20
rise power consumption. Yes, I know that I can change sampling rate. But=20
You are changing *default* value. If You don't like min value then change=20
min value. I disagree with Your change because You are changing *powersaver=
*=20
governor into step-by-step ondemand.
> Stefano

Rafa=B3


----------------------------------------------------------------------
Wolne adresy pocztowe @interia.eu >>> http://link.interia.pl/f19e8
