From: "Hiroshi Miura" <miura@da-cha.org>
Subject: Re: Can't get it working on Mobile Coppermine 1Ghz - i440BX -
	please help...
Date: Sat, 23 Sep 2006 19:54:38 +0900
Message-ID: <a11ccc30609230354h205fb392t7712d8477497bd28@mail.gmail.com>
References: <20060923102009.32968.qmail@web30805.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060923102009.32968.qmail@web30805.mail.mud.yahoo.com>
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
To: Johny the Ripper <my_publicyty@yahoo.com>
Cc: cpufreq@lists.linux.org.uk, Bruno Ducrot <ducrot@poupinou.org>

Hi,

You can find a speedstep-smi.c
in /usr/src/linux/arch/i386/kernel/cpu/cpufreq/
which is the source file Bruno memtioned.

2006/9/23, Johny the Ripper <my_publicyty@yahoo.com>:
>
> Hi Bruno, thanks again :) But I'm a bit in the dark
> here: which file should I change? I searched
> /usr/src/linux/drivers/cpufreq/cpufreq_ondemand.c but
> I didn't find the line you specified...
> Anyway, I'm glad there's a way to make this governor
> work, even though maybe it will not be perfect...

I also don't know proper value of transition latency
because there are not any description in public documents
that I found.

-- 
HIroshi Miura
