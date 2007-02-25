From: "stefano ferri" <ferriste@libero.it>
Subject: Re: [Bug 8081] Conservative governor sets wrong and too high
	sampling rates
Date: Sun, 25 Feb 2007 22:24:39 +0100
Message-ID: <JE1FH3$64A7C47FE3A2367714996D45D173E659@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: rafalbilski <rafalbilski@interia.pl>
Cc: cpufreq <cpufreq@lists.linux.org.uk>

Hi Rafal, I think you have not understood what is the core of the problem=
...
The problem is not to make possible to change sampling rates, anyone with=
 the current code of the kernel can do it.
The problem is that conservative has a 10x factor of polling times if com=
pared to ondemand.

>The CPUfreq governor "conservative", much like the "ondemand"
>governor, sets the CPU depending on the current usage. It differs in
>behavior in that it gracefully increases and decreases the CPU speed
>rather than jumping to max speed the moment there is any load on the
>CPU.

Right, but if ondemand has a minimum polling time of 99500 milliseconds, =
also conservative should have it, even if it "gracefully" increases and d=
ecreases the CPU speed. The policy of the transition of a governor is ano=
ther thing. It is a kernel space governor and it should do the things gra=
cefully but rapidly ;-)!

The problem is that line 497 in the conservative.c code.
I don't know if the problem depends on my specific hardware, but my syste=
m does not respond at all to a variable system load witout deleting that =
10x factor, my cpu goes at 400 Mhz all the time, also transition to 800 M=
hz are rare.

>NACK from me. Current values are working for me. If these values are
>not good for You then write patch to Kconfig which will allow user to
>change sampling rate during "make config". Later "make oldconfig" will
>preserve Your values.

I said, it's not that the problem. Users will NOT be able to set a decent=
 polling time if that 10x factor wil not be removed. I can choose a miniu=
m time of 995000 millisecond (1 second!). Now that I recompiled I obtain =
a 99500 with both ondemand and conservative, as it should be.
And I see the frequency increasing and decreasing gracefully :-)!

Stefano




---------- Initial Header -----------

From      : "Rafal Bilski" rafalbilski@interia.pl
To          : ferriste@libero.it
Cc          : cpufreq@lists.linux.org.uk
Date      : Sun, 25 Feb 2007 21:29:59 +0100
Subject : Re: [Bug 8081] Conservative governor sets wrong and too high sa=
mpling rates







> > ------- Additional Comments From ferriste@libero.it  2007-02-25 08:37=
 -------
> > Created an attachment (id=3D10530)
> >  --> (http://bugzilla.kernel.org/attachment.cgi?id=3D10530&action=3Dv=
iew)
> > This is a simple patch to fix the bug. Apply it at conservative.c
> NACK from me. Current values are working for me. If these values are 
> not good for You then write patch to Kconfig which will allow user to 
> change sampling rate during "make config". Later "make oldconfig" will =

> preserve Your values.
> 
> Rafal
> 
> 
> ----------------------------------------------------------------------
> Przedluz domene.PL za 75 zl >> http://link.interia.pl/f1a19
> 
> =0A=0A=0A------------------------------------------------------=0APassa=
 a Infostrada. ADSL e Telefono senza limiti e senza canone Telecom=0Ahttp=
://click.libero.it/infostrada25feb07=0A
