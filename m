From: "Stijn Van Nieuwenhuyse" <stivani@gmail.com>
Subject: Re: Dell bios + cpufreqd problem
Date: Sat, 5 Aug 2006 18:40:48 +0200
Message-ID: <e29f4c3f0608050940s17432273ofdaa40e7bcd60218@mail.gmail.com>
References: <e29f4c3f0608030232n695737f6yd249b24f059f5c6e@mail.gmail.com>
	<1154606992.4302.496.camel@queen.suse.de>
	<e29f4c3f0608040845y10f38c01lda01eaeb9c0edb14@mail.gmail.com>
	<8355938.1154725804784.SLOX.WebMail.wwwrun@imap-dhs.suse.de>
	<20060805082832.GA4060@inferi.kami.home>
	<e29f4c3f0608050357x1f536e82s1f98696b8a16c84f@mail.gmail.com>
	<20060805115208.GB4060@inferi.kami.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060805115208.GB4060@inferi.kami.home>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

I was using cpufrequtils version 001, but have upgraded to 002 now.
Everything seems to be the same like before the upgrade.

I would like to try your patches.
Do you need some more info from me?

Greets,

Stijn

On 8/5/06, Mattia Dongili <malattia@linux.it> wrote:

>
> It seems to be as Thomas diagnosed.
> Out of curiosity, which cpufrequtils version do you have? see
> cpufreq-info full output, if you don't have version 002, please upgrade
> it and retry.
>
> Anyway I'll try to fix the 15secs delay in cpufreqd 2.2.0, the failure
> to se a new policy should be better handled.
> Stijin, could you try out some patches I'd forward you privately later?
>
> Thanks
> --
> mattia
> :wq!
>
