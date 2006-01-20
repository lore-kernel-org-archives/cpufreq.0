From: Gunter Ohrner <G.Ohrner@post.rwth-aachen.de>
Subject: Re: ondemand and p3-m
Date: Sat, 21 Jan 2006 00:59:50 +0100
Message-ID: <dqrtgo$a1b$1@sea.gmane.org>
References: <1137795365.28411.30.camel@littledragon>
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

Niko Ehrenfeuchter wrote:
> While using the speedstep-ich module works for userspace stuff, echoing
> "ondemand" into scaling_governor simply yields an invalid argument
> error.

Mh, I guess you compiled the governor as a module, but the
cpufreq_ondemand.ko module isn't loaded?

Scaling with PIII-M and an i8xx chipset should work just fine, especially if
it does using the "userspace" governor.

Greetings,

  Gunter

--=20
3) I don't sign parts of the body, even if they're still attached.     =20
  -- From Terry's Rules of Book Signing           (Terry Pratchett,=20
alt.fan.pratchett)
*** PGP-Verschl=FCsselung bei eMails erw=FCnscht :-) *** PGP: 0x1128F25F ***
