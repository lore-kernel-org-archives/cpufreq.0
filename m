From: Frank Doege <frank@network-steps.de>
Subject: Re: Speedstep on Intel Pentium M
Date: Tue,  1 Jun 2004 05:11:26 +0200 (CEST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <5069769.1086059486121.SLOX.WebMail.wwwrun@thor.yiti.intern>
References: <8012937.1086037545966.SLOX.WebMail.wwwrun@thor.yiti.intern><20040531233542.368b9da0.frx@firenze.linux.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
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
To: Francesco Poli <frx@firenze.linux.it>
Cc: cpufreq@www.linux.org.uk

Morning,

thanks for your fast answering. I have an IBM X40 with Pentium M ULV, when =
i run Windows i can work over 8 ours but only 6 with linux. Does the Centri=
no Driver offers voltage scaling ? May be thats the reason that the akku li=
fes longer under windows.

So can i modify the Min Limit off scaling in the kernel driver ?

Thanks

Bassbauer

Am Mo 31.05.2004 23:35, Francesco Poli <frx@firenze.linux.it> schrieb:

> On Mon, 31 May 2004 23:05:45 +0200 (CEST) Frank Doege wrote:
>=20
> > i have sucessfully enabled speedfreq using the centrino drivers in the
> > kernel 2.6.7. My Laptop steps between 600Mhz and 1.2 Ghz, all runs
> > very fine. The Question i have is why can windows step the processor
> > to 300Mhz but Linux doesnt ?
>=20
> As I understand it, Windows throttles the CPU in order to reach that
> `virtual' 300 MHz clock frequency.
> But throttling is useless, at least from an energy-saving point of view.
> It could be useful from a thermal point of view, but, IIRC, ACPI
> P-states should be better for that.
>=20
> Cpufreq gurus and kernel hackers are welcome to correct me and/or
> clarify further...  :p
>=20
>=20
> --=20
>              |  GnuPG Key ID =3D DD6DFCF4 | You're compiling a program
>   Francesco  |        Key fingerprint =3D | and, all of a sudden, boom!
>      Poli    | C979 F34B 27CE 5CD8 DC12 |         -- from APT HOWTO,
>              | 31B5 78F4 279B DD6D FCF4 |             version 1.8.0
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq

-----------------------------------------------------------------------
Frank Doege=09=09Tel. : 0911/97790545
Network-Steps=09       Fax. : 0911/97790543
Bulmannstr. 34=09       eMail: frank@network-steps.de
90459 N=C3=BCrnberg=09    Web  : www.network-steps.de
-----------------------------------------------------------------------
