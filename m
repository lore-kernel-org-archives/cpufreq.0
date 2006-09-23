From: Johny the Ripper <my_publicyty@yahoo.com>
Subject: Re: Can't get it working on Mobile Coppermine 1Ghz - i440BX -
	please help...
Date: Sat, 23 Sep 2006 04:24:09 -0700 (PDT)
Message-ID: <20060923112409.55922.qmail@web30812.mail.mud.yahoo.com>
References: <a11ccc30609230354h205fb392t7712d8477497bd28@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <a11ccc30609230354h205fb392t7712d8477497bd28@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Hiroshi Miura <miura@da-cha.org>
Cc: cpufreq@lists.linux.org.uk, Bruno Ducrot <ducrot@poupinou.org>

Hi,

thanks for your answer. I still don't get it working
and I'm not sure what's going wrong. Probably my poor
knowledge of using kernel modules...
This is what I did: I adapted the suggested values in
speedstep-smi.c and did a make from /usr/src/linux . I
saw in the output that it compiled the speedstep-smi
module. But I still couldn't load the ondemand
governor. I did a make modules to be sure, but it
didn't help. So I copied the new-made kernel to and
rebooted using this new kernel. (hoping that it would
use the new module) But it still doesn't work.

Am I doing something wrong with this new module or
should I use a different value?


greetz,
Johny

--- Hiroshi Miura <miura@da-cha.org> wrote:

> Hi,
> 
> You can find a speedstep-smi.c
> in /usr/src/linux/arch/i386/kernel/cpu/cpufreq/
> which is the source file Bruno memtioned.
> 
> 2006/9/23, Johny the Ripper
> <my_publicyty@yahoo.com>:
> >
> > Hi Bruno, thanks again :) But I'm a bit in the
> dark
> > here: which file should I change? I searched
> > /usr/src/linux/drivers/cpufreq/cpufreq_ondemand.c
> but
> > I didn't find the line you specified...
> > Anyway, I'm glad there's a way to make this
> governor
> > work, even though maybe it will not be perfect...
> 
> I also don't know proper value of transition latency
> because there are not any description in public
> documents
> that I found.
> 
> -- 
> HIroshi Miura
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
