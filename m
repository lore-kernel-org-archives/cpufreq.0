From: Gunter Ohrner <G.Ohrner@post.rwth-aachen.de>
Subject: RE: cpufreq: powernow-k8 frequency transitions question
Date: Tue, 03 Jan 2006 01:19:28 +0100
Message-ID: <dpcfth$16q$2@sea.gmane.org>
References: <84EA05E2CA77634C82730353CBE3A84303D430BD@SAUSEXMB1.amd.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@lists.linux.org.uk

Devriendt, Paul wrote:
> Transitions between low frequencies (<=3D1.4GHz) are not supported by
> hardware. The way to do them is to transition to an intermediate
> high frequency.

Yes, I read about that in the PDF I referred to. I guess that#s the guide
you also mentioned?

> No BIOSs define two low PStates so the case never occurs, but it could
> theoretically be done.=20

I'm currently experimenting with the speeds my CPU can run at. (Out of spec,
at lower frequencies and voltages to safe a few watts and keep everything
cool'n'quiet, so to say... ;)

It seems to run fine a several low pstates, I just need to check if
supporting low-low-transitions would be worth the hassle, or if I just
limit my pstate table to two pstates between which the CPU can transition
directly.

Thanks a lot for your answer,

  Gunter

--=20
Thunder rolled. ... It rolled a six.        -- (Terry Pratchett,=20
Guards! Guards!)
*** PGP-Verschl=FCsselung bei eMails erw=FCnscht :-) *** PGP: 0x1128F25F ***
