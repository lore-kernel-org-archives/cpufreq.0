From: Norbert Preining <preining@logic.at>
Subject: Re: Which cpufreq driver is best for ...
Date: Wed, 3 Sep 2003 21:50:13 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030903195013.GA25291@gamma.logic.tuwien.ac.at>
References: <20030903055749.GA21721@gamma.logic.tuwien.ac.at>
	<20030903192749.GA30360@brodo.de>
	<20030903055749.GA21721@gamma.logic.tuwien.ac.at>
	<3F55D261.6010407@basmevissen.nl> <20030903193040.GB30360@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030903192749.GA30360@brodo.de>
	<20030903193040.GB30360@brodo.de>
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

Dear Dominik!

On Mit, 03 Sep 2003, Dominik Brodowski wrote:
> Well, if you run CPU hogs, the p4-clockmod driver indeed prolongs battery
> life and reduces heat production. But less work is done, also. So the rat=
io
>=20
> 	amount of energy
> 	----------------
> 	amount of work
>=20
> is better (lower) for the speedstep-ich driver than for the p4-clockmod
> driver.

On Mit, 03 Sep 2003, Dominik Brodowski wrote:
> No, speedstep-ich is "superior". p4-clockmod only "throttles" the CPU, i.=
e.
> it scales down the frequency but not the voltage. This results in an
> approximately linear saving of energy. speedstep-ich also scales the
> voltage, which causes much better saving of energy.=20

Sorry for the stupid questions, but why there are 8 different cpu
frequencies possible with p4-clockmod, while there are only 2 with
speedstep-ich?

> And as long as ACPI C-States "idling" or APM "hlt" instructions work, the
> CPU is "throttled"[*] if there is no work to do anyway, so the p4-clockmod
> driver doesn't save you anything. The p4-clockmod driver almost only is
> useful where ACPI or APM "idling" is borken.

Does this mean, that with speedstep-ich I do *not* need a
cpufreq/speedstep/cpudyn/(insert your favorite) daemon and this is done
automatically?

More detailed: linux-2.4.23-pre2 with cpufreq from cvs: What is the best
way to:
	* reduce heat
	* increase battery life
(and still do some work, but I normally do not have big long cpu intense
applications running, besides kernel compiling)?

I found for now that having p4-clockmod saves more energy/produces less
heat since most of the time the laptop is running in 275MHz (with
cpudynd), while with speedstep-ich it is running at 1200MHz.

Finally: If p4-clockmod only scales down cpu freq, and speedstep-ich
scaled down cpu freq *AND* voltage, are there any statistics or other
ways to compare battery life/heat production between the two,
assuming that for the former the minimal cpu freq is 274MHz and for the
later 1200MHz.=20

Concise: Does the speedstep-ich voltage reduction decrease the amount of
energy used by a factor 4 (~ 1200/274) so that it is comparable to
p4-clockmod?


Anyway, thanks for all the information and help and I really appreciate
your great work.

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
HEATON PUNCHARDON (n.) A violent argument which breaks out in the car
on the way home from a party between a couple who have had to be
polite to each other in company all evening.
			--- Douglas Adams, The Meaning of Liff
