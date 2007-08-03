From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: do Pentium4 & PentiumM consume about the same at their
 lowest possible freq?
Date: Fri, 3 Aug 2007 15:59:22 -0500
Message-ID: <1449F58C868D8D4E9C72945771150BDF02076FA8@SAUSEXMB1.amd.com>
References: <653FFBB4508B9042B5D43DC9E18836F50139486C@scsmsx415.amr.corp.intel.com>
	<46B394D5.4030509@unica.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <46B394D5.4030509@unica.it>
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
To: Roberto De Leo <deleo@unica.it>
Cc: cpufreq@lists.linux.org.uk

> >It is meant to be used under thermal condition where slowing down CPU
> >will result in reducing the temperature and not for power savings in
> >normal conditions.
> >
> I thought that power consumption and heat dissipation in the CPU were=20
> more or less proportional but evidently my belief was too naif  :-)
>=20
> I guess that the same thing holds for the Athlon64

Most processors reduce power consumption faster than they reduce
frequency, because reducing frequency allows the processor to
also reduce voltage.  There is a corner case that if you only
reduce frequency, you do not get much power reduction, but the
standard powernow-k[7,8] driver reduces both voltage and
frequency.

The only numbers I have handy are a bit old, but here's the
original Opteron/Athlon FX at 2.2 GHz:

Frequency (GHz)	Voltage (V)		Power (W)
2.2			1.5			89
2.0			1.4			69
1.8			1.3			50
1.0			1.1			22

A drop of 50% in frequency cuts maximum power
by more than 66%.  Actual measured power may be
lower, since idle blocks consume less power,
and a processor at minimum pstate may also be
going into C1 (Halt) a good deal of the time.

-Mark Langsdorf
Operating System Research Center
AMD
