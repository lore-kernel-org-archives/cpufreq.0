From: Norbert Preining <preining@logic.at>
Subject: Re: Which cpufreq driver is best for ...
Date: Wed, 3 Sep 2003 16:32:50 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030903143250.GC571@polaris.logic.tuwien.ac.at>
References: <20030903055749.GA21721@gamma.logic.tuwien.ac.at>
	<3F55D261.6010407@basmevissen.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F55D261.6010407@basmevissen.nl>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@www.linux.org.uk

On Mit, 03 Sep 2003, Bas Mevissen wrote:
> >Which cpufreq driver is best for=20
> >	Mobile Intel(R) Pentium(R) 4 - M CPU 2.20GHz
> >I can use the
> >	p4-clockmod
> >and the
> >	speedstep-ich
> >With the p4-clockmod I can adapt the freq between 274MHz and 2.2GHz,
> >while with speedstep-ich I can only go between 1.2GHz and 2.2GHz. So I
> >guess p4-clockmod is superior for my chip/cpu.
> >
>=20
> It depends on what you want. If you want to get battery life to the max=20
> (and power consumption/heat production as low as possible), you need=20
> p4-clockmod.

This is what I think too, because with p4-clockmod I can set the frq as
low as 274MHz, while with speedstep-ich only down to 1200MHz, this makes
a big difference, in heat and battery life, I guess.

> If you really want the best battery life, you can use/write a governor=20
> that depends on e.g. load. (I've seen something about that somewhere.)

I have this one running, it it called
	cpudyn(d)
and is in debian/sid. Adapts to the load quite fast. Normallz the laptop
is in 274MHz mode, but is going up to 2200MHz immediately when I start
latex-ing or gcc-ing.

Now, what would be nice, is a cpudyn2 that steps the processor dependend
on the load to different speeds.

But for now I will adjust the lowest/highest allowed freq with acpi
events so that on battery not even 2200 is used, but less.

Best wishes

Norbert

---------------------------------------------------------------------------=
----
Norbert Preining <preining AT logic DOT at>         Technische Universit=E4=
t Wien
gpg DSA: 0x09C5B094      fp: 14DF 2E6C 0307 BE6D AD76  A9C0 D2BF 4AA3 09C5 =
B094
---------------------------------------------------------------------------=
----
YADDLETHORPE (vb.)
(Of offended pooves.) To exit huffily from a boutique.
			--- Douglas Adams, The Meaning of Liff
