From: Philip Lawatsch <philip@lawatsch.at>
Subject: Re: Make overclock possible with cpufreq
Date: Mon, 29 May 2006 11:48:05 +0200
Message-ID: <447AC355.7070403@lawatsch.at>
References: <6d24915a0605281326j597faae7u49daaf78c962e2db@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <6d24915a0605281326j597faae7u49daaf78c962e2db@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Matteo Giordano <ilmalteo@gmail.com>, cpufreq@lists.linux.org.uk

Matteo Giordano wrote:
> Hi,
> I just subscribed to the list to address this issue (I think it's an
> *issue*).
> I'm not a kernel hacker so I'm just guessing here, even if I searched
> and tried all the afternoon.
> It's not possible to use cpufreq with an overclocked CPU because the
> processor's frequencies are "hardcoded" somewhere (the BIOS or a PSB
> table?).
> So if I push my Athlon 64 3200+ to 2.4GHz the "performance" governor
> will always put it to 2GHz max, causing the overclock to be useless.

Note, I'm only a cpufreq user myself, so I might be wrong, but these are
my observations:

.) k8 powernow only changes the multiplier, but not the reference clock.
Thus if you overclock the reference clock and do not change anything
else you should be fine.

.) cpufreq _did_ (back in 2.6.15?) report the actual cpu frequencies in
/proc/cpuinfo, but this changed and now it reports the frequency it
thinks the cpu is running at.

One way to verify that the cpu is still overclocked is to simply look at
the bogomips value in /proc/cpuinfo or run some benchmarks.

In my case I've still got the (expected) higher bogomips value for 2.6
ghz even though cpufreq thinks that the cpu is at 2.2 ghz.

kind regards Philip
