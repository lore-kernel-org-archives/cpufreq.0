From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: [PATCH 2/2 updated] Measure transition latency at driver
	initialization
Date: Sat, 03 Dec 2005 00:43:11 +0100
Message-ID: <4390DC0F.8050507@tremplin-utc.net>
References: <11333087111183-git-send-email-malattia@linux.it>	<438D9111.2000306@tremplin-utc.net>	<20051130223038.GD3620@inferi.kami.home>	<438E38B3.3080009@tremplin-utc.net>	<20051201193147.GB4432@inferi.kami.home>	<438F659B.3070103@tremplin-utc.net>	<20051201233411.GA5563@inferi.kami.home>
	<439031F0.2090607@lifl.fr>	<4792.83.103.117.254.1133530475.squirrel@picard.linux.it>
	<20051202205941.GE3598@inferi.kami.home>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20051202205941.GE3598@inferi.kami.home>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mattia Dongili <malattia@linux.it>
Cc: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, Dominik Brodowski <linux@dominikbrodowski.net>, davej@redhat.com

02.12.2005 21:59, Mattia Dongili wrote/a =C3=A9crit:

> here it is:
> the attached patch introduces runtime latency measurement for ICH[234]
> based chipsets instead of using CPUFREQ_ETERNAL. It includes
> some sanity checks in case the measured value is out of range and
> assigns a safe value of 500uSec that should still be enough on
> problematics chipsets (current testing report values ~200uSec). The
> measurement is currently done in speedstep_get_freqs in order to avoid
> further unnecessary transitions and in the hope it'll come handy for SMI
> also.

It looks fine for me :-) Dave, Venki, do you have any objections? Please=20
apply those two patchs to finally get over the transition latency=20
problem on speedstep-ich.

cheers,
Eric
