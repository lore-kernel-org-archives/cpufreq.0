From: Norbert Preining <preining@logic.at>
Subject: Re: Which cpufreq driver is best for ...
Date: Thu, 4 Sep 2003 11:59:35 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030904095935.GB2082@gamma.logic.tuwien.ac.at>
References: <20030903055749.GA21721@gamma.logic.tuwien.ac.at>
	<20030903192749.GA30360@brodo.de>
	<20030903055749.GA21721@gamma.logic.tuwien.ac.at>
	<3F55D261.6010407@basmevissen.nl> <20030903193040.GB30360@brodo.de>
	<20030903195013.GA25291@gamma.logic.tuwien.ac.at>
	<20030903210153.GA19704@brodo.de>
	<20030904070943.GA13834@gamma.logic.tuwien.ac.at>
	<20030904094650.GA20816@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030904094650.GA20816@brodo.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@www.linux.org.uk

On Don, 04 Sep 2003, Dominik Brodowski wrote:
> > Using p4-clockmod the normal ACPI idle will reduce the CPU frequency?
> > Interesting, I have to try this.
>=20
> Not really "reduce" it, but "stop" it for certain periods of time.

So I cannot observe this, or? cat /proc/cpuinfo usually shows me the
current cpu freq. With this behaviour it is just a thing of `feeling'
cooler.

> > > a) The idling mechansim is broken.
> >=20
> > How can I check this?
>=20
> a) Do nothing on your notebook for a while. Does it heat up much?=20
> b) check /proc/acpi/processor/*/power whether C1 and C2 are used. C3 would
> be even better.

Hmmm:
[~] cat /proc/acpi/processor/CPU0/power=20
active state:            C1
default state:           C1
bus master activity:     00000000
states:
   *C1:                  promotion[--] demotion[--] latency[000] usage[0000=
0000]
    C2:                  <not supported>
    C3:                  <not supported>
Anything I can do to make C2 (and C3) work?

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
LUDLOW (n.)
A wad of newspaper, folded tablenapkin or lump of cardboard put under
a wobbly table or chair to make it stand-up straight. It is perhaps
not widely known that air-ace Sir Douglas Bader used to get about on
an enormous pair of ludlows before he had his artificial legs fitted.
			--- Douglas Adams, The Meaning of Liff
