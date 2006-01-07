From: Gunter Ohrner <G.Ohrner@post.rwth-aachen.de>
Subject: Re: cpufreq: powernow-k8 frequency transitions question
Date: Sat, 07 Jan 2006 15:28:12 +0100
Message-ID: <dpoj4u$87s$1@sea.gmane.org>
References: <84EA05E2CA77634C82730353CBE3A84303D430BD@SAUSEXMB1.amd.com>	<20060103162946.GF13887@poupinou.org>
	<dpf5ue$4a0$1@sea.gmane.org> <43BB29FF.2000401@gmail.com>
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

Nebojsa Trpkovic wrote:
> The most usefull powersaving is achieved by lowering the voltage and not =

> the further lowering of frequency.

Yes, but lower clock speeds usually allow for lower voltages, so that's what
you gain by lowering the core frequency.

> minimum stable voltage just to be 110% sure it will work stable:
> Winchester runs with 1.0GHz @1.0V and 1.8GHz @1.275V

I'm currently running my Winchester 3000+ at 1,0GHZ@1,0V and 1,8GHz@1,15V
only, and it's rock solid for me so far - it survived hours of 100% cpu
load during normal operation and using cpuburn's burnK7, either locked at
on of the frequencies or in dynamic mode using the ondemand governor.

> So, I've modified powernow-k8.c to lower the voltages read from BIOS for =

> every p-state.

Changing the vlaues returned by the BIOS by a function is a really
interesting approach, especially if there's not much point in providing
additional P-states, which is my current impression. At the moment I have
ACPI table queries turned off in powernow-k8 and supply a hand craftes PSB
table, but obviously that's not the most flexible solution. Mh, two VID and
FID mapping function's which initially are identity functions but with some
sysfs-tuneable parameters sounds interesting to me... :-)

I guess I should try that.

Greetings and thanks for that idea,

  Gunter

--=20
The question seldom addressed is *where* Medusa had snakes. Underarm=20
hair is an even more embarassing problem when it keeps biting the top=20
of the deodorant bottle.        -- (Terry Pratchett, Soul Music)
*** PGP-Verschl=FCsselung bei eMails erw=FCnscht :-) *** PGP: 0x1128F25F ***
