From: "Mattia Dongili" <malattia@linux.it>
Subject: Re: [PATCH 2/2 updated] Measure transition latency at driver 
 initialization
Date: Fri, 2 Dec 2005 14:34:35 +0100 (CET)
Message-ID: <4792.83.103.117.254.1133530475.squirrel@picard.linux.it>
References: <11333087111183-git-send-email-malattia@linux.it>	<438D9111.2000306@tremplin-utc.net>	<20051130223038.GD3620@inferi.kami.home>	<438E38B3.3080009@tremplin-utc.net>	<20051201193147.GB4432@inferi.kami.home>	<438F659B.3070103@tremplin-utc.net>
	<20051201233411.GA5563@inferi.kami.home> <439031F0.2090607@lifl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <439031F0.2090607@lifl.fr>
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
To: Eric Piel <Eric.Piel@lifl.fr>
Cc: Eric Piel <eric.piel@tremplin-utc.net>, CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, Dominik Brodowski <linux@dominikbrodowski.net>, davej@redhat.com

On Fri, December 2, 2005 12:37 pm, Eric Piel said:
> 12/02/2005 12:34 AM, Mattia Dongili wrote/a =C3=A9crit:
[...]
>> problematics chipsets (current testing report values ~200uSec).
> Again, I though it was done... and then Ville showed that's it's plainly
> wrong to assume anything with speedstep-smi: it could take up to 1
> second to change of frequency or few uSec. So we should probably back
> out the smi part.
>
> What I propose: modify slightly the interface of speedstep_get_freqs():
>   * if transition_latency is NULL, we don't try to update the transition
> latency,
> * otherwise we so as usual.
> Then, in speedstep-smi we can call speedstep_get_freqs() with NULL,
> voila :-)

Ok, I had something similar in mind when thinking about creating a more
general function/interface for latency measurement. We will surely need
some way to disable it.

Updated patch will follow soon.
--=20
mattia
:wq!
