From: Andre Eisenbach <int2str@gmail.com>
Subject: Re: [PATCH] cpufreq_ondemand
Date: Tue, 19 Oct 2004 22:03:55 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <7f800d9f04101922031be5cfe8@mail.gmail.com>
References: <20041017222916.GA30841@inskipp.digriz.org.uk>
	<4172F3C5.8090604@kolivas.org>
Reply-To: Andre Eisenbach <int2str@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <4172F3C5.8090604@kolivas.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Con Kolivas <kernel@kolivas.org>
Cc: linux-kernel@vger.kernel.org, Alexander Clouter <alex-kernel@digriz.org.uk>, cpufreq@www.linux.org.uk

On Mon, 18 Oct 2004 08:35:49 +1000, Con Kolivas <kernel@kolivas.org> wrote:
> I'd much prefer it shot up to 100% or else every time the cpu usage went
> up there'd be an obvious lag till the machine ran at it's capable speed.
>   I very much doubt the small amount of time it spent at 100% speed with
> the default design would decrease the battery life significantly as well.

I like Alexanders idea better and will give it a good try. If the
speed steps down slowly but shoots up 100% quickly (as it is right
now), even a small task (like opening a folder, or scrolling down in a
document) will cause a tiny spike to 100% which takes a while to go
back down. The result is that the CPU spends most of it's time at 100%
or calming down. I wrote a small test program on my notebook which
confirms this.

It's either or. Either you go up AND down slowly (which I would
prefer), or you go up and down immediately. But spiking up and slowly
going back down is not a good combo.

Alex has my vote, even so I have to give if some more testing.

Cheers,
    Andre
