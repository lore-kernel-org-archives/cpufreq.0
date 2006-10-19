From: "Mateusz Mielnicki" <matim@wp.pl>
Subject: Re: Intel T2250
Date: Thu, 19 Oct 2006 09:54:42 +0200
Message-ID: <45372f425dbf5@wp.pl>
References: <4536b0c818197@wp.pl> <200610190136.48254.len.brown@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-reply-to: <4536b0c818197@wp.pl> <200610190136.48254.len.brown@intel.com>
Content-Disposition: inline
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
To: Len Brown <lenb@kernel.org>
Cc: cpufreq <cpufreq@lists.linux.org.uk>

Yes, every module of cpufreq loads, acpi-cpufreq, cpufreq_powersave, cpufre=
q_conservative, freq_table and so on, excepting speedstep-centrino which gi=
ves "No such device".

Dnia 19-10-2006 o godz. 7:36 Len Brown napisa=B3(a):
> On Wednesday 18 October 2006 18:55, Mateusz Mielnicki wrote:
> > Modules speedstep-centrino is not loading. I tried vanilla sources,=20
> later phc and still the same errors. I do everything like in manual, and =

> simply speedsteping don't work. I think that simply that processor is=20
> not listed in the source code.
> > I'm working on HP nx7400 EY508ES, with Intel T2250 processor.
>=20
> does module acpi-cpufreq load instead?
>=20
> -Len
>=20


----------------------------------------------------
The Colors European Tour - jesie=F1 2006 - sprawd=BC czy b=EAd=B1 w Twoim
mie=B6cie -> Kliknij:
http://klik.wp.pl/?adr=3Dhttp%3A%2F%2Fadv.reklama.wp.pl%2Fas%2Fd21.html&sid=
=3D904
