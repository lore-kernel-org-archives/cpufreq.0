From: Eric Piel <Eric.Piel@lifl.fr>
Subject: Re: [PATCH 2/2 updated] Measure transition latency at driver
	initialization
Date: Fri, 02 Dec 2005 12:37:20 +0100
Message-ID: <439031F0.2090607@lifl.fr>
References: <11333087111183-git-send-email-malattia@linux.it>	<438D9111.2000306@tremplin-utc.net>	<20051130223038.GD3620@inferi.kami.home>	<438E38B3.3080009@tremplin-utc.net>	<20051201193147.GB4432@inferi.kami.home>	<438F659B.3070103@tremplin-utc.net>
	<20051201233411.GA5563@inferi.kami.home>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20051201233411.GA5563@inferi.kami.home>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mattia Dongili <malattia@linux.it>
Cc: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, Eric Piel <Eric.Piel@tremplin-utc.net>, Dominik Brodowski <linux@dominikbrodowski.net>, davej@redhat.com

12/02/2005 12:34 AM, Mattia Dongili wrote/a =C3=A9crit:
> Fine with me. Following your suggested code, I only changed the order
> of the assigment and the printk because it might still be interesting to
> see the measured value without having to enable cpufreq_debug.
Yes, that's a good idea :-)

>=20
> So, to summarize:
> the attached patch introduces runtime latency measurement for many
> speedstep based processors instead of using CPUFREQ_ETERNAL. It includes
> some sanity checks in case the measured value is out of range and
> assigns a safe value of 500uSec that should still be enough on
> problematics chipsets (current testing report values ~200uSec).
Again, I though it was done... and then Ville showed that's it's plainly=20
wrong to assume anything with speedstep-smi: it could take up to 1=20
second to change of frequency or few uSec. So we should probably back=20
out the smi part.

What I propose: modify slightly the interface of speedstep_get_freqs():=20
  * if transition_latency is NULL, we don't try to update the transition=20
latency,
* otherwise we so as usual.
Then, in speedstep-smi we can call speedstep_get_freqs() with NULL,=20
voila :-)

Later we could change the transition latency of speedstep-smi from=20
ETERNAL to 1s... but that's not going to help much anyway for the=20
ondemand governor.

Eric
