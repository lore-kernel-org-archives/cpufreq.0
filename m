From: Norbert Preining <preining@logic.at>
Subject: Re: Which cpufreq driver is best for ...
Date: Thu, 4 Sep 2003 09:09:43 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030904070943.GA13834@gamma.logic.tuwien.ac.at>
References: <20030903055749.GA21721@gamma.logic.tuwien.ac.at>
	<20030903192749.GA30360@brodo.de>
	<20030903055749.GA21721@gamma.logic.tuwien.ac.at>
	<3F55D261.6010407@basmevissen.nl> <20030903193040.GB30360@brodo.de>
	<20030903195013.GA25291@gamma.logic.tuwien.ac.at>
	<20030903210153.GA19704@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030903210153.GA19704@brodo.de>
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

Good morning Dominik!

First of all: Thanks for the time you take!!!

On Mit, 03 Sep 2003, Dominik Brodowski wrote:
> A.) SpeedStep I: The Front Side Bus (FSB) of your CPU is,
>=20
> B.) Throttling [p4-clockmod]: The CPU only "works" if the clock signal (w=
hich

Ok, I see the difference.

> No, with the _p4-clockmod_ driver you don't need a cpudyn daemon [except -
> see below...]. With _speedstep-ich_ it'd be very usefull.

Using p4-clockmod the normal ACPI idle will reduce the CPU frequency?
Interesting, I have to try this.

> > (and still do some work, but I normally do not have big long cpu intense
> > applications running, besides kernel compiling)?
>=20
> If you don't mind that the CPU heats up during kernel compiles, the
> speedstep-ich driver is better for your usage.

Ok, will try it.

> Unfortunately, I don't have the information for your CPU. But, as a good
> example, let's take the 1.0 GHz Pentium-III-M.=20

I have to think about this and do my own calculation, otherwise I won't
understand it.

> Wrong question: Mostly you do care about "energy needed for certain amount
> of work". There throttling doesn't save you anything if idling works, but
> "speedstepping" does.

You are right. Thanks for pointing this out.

> The only two reasons for CPUfreq drivers which "only" do throttling are:
>=20
> a) The idling mechansim is broken.

How can I check this?

> Best wishes to the wonderful city of Vienna,

Thanks a lot, now that the rain has come back to Vienna after months of
heat we are all quite happy.

Thanks again for the explanations, probably I have to disturb you again ;-)

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
KENTUCKEY (adv.)
Fitting exactly and satisfyingly. The cardboard box that slides neatly
into an exact space in a garage, or the last book which exactly fills
a bookshelf, is said to fit 'real nice and kentuckey'.
			--- Douglas Adams, The Meaning of Liff
