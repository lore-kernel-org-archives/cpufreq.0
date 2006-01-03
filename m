From: Gunter Ohrner <G.Ohrner@post.rwth-aachen.de>
Subject: Re: cpufreq: powernow-k8 frequency transitions question
Date: Tue, 03 Jan 2006 01:16:07 +0100
Message-ID: <dpcfn8$16q$1@sea.gmane.org>
References: <dp8h08$du6$1@sea.gmane.org> <p73fyo6ft59.fsf@verdi.suse.de>
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

Andi Kleen wrote:
>> I already asked this question on linux-kernel@vger.kernel.org but maybe
>> this list would be a more appropriate place...
> The proceedings of the Ottawa Linux Symposium 2004 (available online)
> have a detailed paper on the powernow-k8 driver.

Ah, thanks. I found it, read it, and will soon compare the description to
the current implementation.
From what I saw I already figured out the most important parts myself, as
the driver is rather readable, but the paper contained some interesting
additional details and reasons for some things I still wondered about.

>> How do the conservative/ondemand cpufreq governors cope with the kernel
>> advertising frequencies it cannot directly transition between?
> Step by step. The frequency/voltage transistion functions
> in powernow-k8.c go through them in loops.

Oh, ok, I must have missed that part in the driver, I will look for it.

Thanks a lot! :-)

Greetings,

  Gunter

--=20
The students were staring at her in the manner of those who have heard=20
of the species 'female' but have never expected to get this close to=20
one.        -- (Terry Pratchett, Soul Music)
*** PGP-Verschl=FCsselung bei eMails erw=FCnscht :-) *** PGP: 0x1128F25F ***
